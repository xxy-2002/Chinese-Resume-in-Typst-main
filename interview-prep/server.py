from __future__ import annotations

import html
import mimetypes
import os
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import unquote, urlparse

from markdown_it import MarkdownIt


ROOT = Path(__file__).resolve().parent
REPO_ROOT = ROOT.parent
HOST = "127.0.0.1"
PORT = 8767

md = MarkdownIt("commonmark", {"html": False, "linkify": True, "typographer": True}).enable("table")

CHECKLIST_ITEMS = [
    ("self_intro", "自我介绍", "能稳定讲 1-2 分钟版本，突出 Agent 应用研发主线。"),
    ("joydeliver", "JoyDeliver", "能讲清 Harness / Runtime / Skill / Pipeline。"),
    ("flow", "Flow(Papago.ai)", "能讲清多模型接入、记忆、路由、评估、成本优化。"),
    ("skill_factory", "Skill Factory", "能讲清 Harness、GEPA、trace、sandbox、发布门禁。"),
    ("agent_concepts", "Agent 概念", "Harness / Skill / Runtime / Hook / Trace / Eval 一句话定义。"),
    ("redis_mysql_net", "Redis / MySQL / 网络", "高频题能答，且能和项目经历连起来。"),
    ("mock_interview", "模拟面试", "至少完整练过 2 轮，能扛一轮纵向追问。"),
]


def is_within_root(path: Path) -> bool:
    try:
        resolved = path.resolve()
        resolved.relative_to(REPO_ROOT.resolve())
        return True
    except ValueError:
        return False


def resolve_requested_path(requested: str) -> Path:
    if requested in {"", "/"}:
        return (ROOT / "index.html").resolve()

    requested_path = Path(requested)
    if requested_path.is_absolute() and str(requested_path).startswith(str(REPO_ROOT)):
        return requested_path.resolve()
    relative = requested.lstrip("/") or "index.html"
    return (ROOT / relative).resolve()


def viewer_shell(title: str, rel_path: str, content: str) -> str:
    checklist_html = "\n".join(
        f"""
        <div class="check-item">
          <input id="ck-{item_id}" data-id="{item_id}" type="checkbox" />
          <label for="ck-{item_id}">
            <strong>{html.escape(name)}</strong>
            <span>{html.escape(detail)}</span>
          </label>
        </div>
        """
        for item_id, name, detail in CHECKLIST_ITEMS
    )
    return f"""<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>{html.escape(title)}</title>
    <style>
      :root {{
        --bg: #f4f1ea;
        --surface: #fcfbf8;
        --border: #d8d1c5;
        --text: #1f1d1a;
        --muted: #686257;
        --accent: #284f58;
        --code-bg: #f0ece4;
      }}
      * {{ box-sizing: border-box; }}
      body {{
        margin: 0;
        font-family: "Noto Sans SC", "PingFang SC", "Microsoft YaHei", sans-serif;
        color: var(--text);
        background: var(--bg);
      }}
      a {{ color: var(--accent); word-break: break-word; }}
      .page {{
        width: min(1380px, calc(100% - 24px));
        margin: 0 auto;
        padding: 20px 0 32px;
      }}
      .toolbar {{
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 18px;
        padding: 14px 16px;
        border: 1px solid var(--border);
        background: var(--surface);
        border-radius: 8px;
      }}
      .toolbar a {{
        text-decoration: none;
        color: var(--accent);
        font-weight: 600;
      }}
      .toolbar .meta {{
        color: var(--muted);
        font-size: 13px;
      }}
      .layout {{
        display: grid;
        grid-template-columns: minmax(0, 1fr) 320px;
        gap: 18px;
        align-items: start;
      }}
      .content-card, .side-card {{
        border: 1px solid var(--border);
        background: var(--surface);
        border-radius: 8px;
        box-shadow: 0 18px 40px rgba(44, 42, 37, 0.06);
      }}
      .content-card {{
        padding: 28px 30px;
        line-height: 1.78;
      }}
      .side-card {{
        padding: 18px;
        position: sticky;
        top: 16px;
      }}
      h1, h2, h3, h4, h5, h6 {{
        font-family: "Noto Serif SC", "Source Han Serif SC", "Songti SC", serif;
        line-height: 1.35;
        margin-top: 1.6em;
        margin-bottom: 0.6em;
      }}
      h1 {{ margin-top: 0; font-size: 34px; }}
      h2 {{ font-size: 26px; }}
      h3 {{ font-size: 21px; }}
      p, li {{ font-size: 15px; }}
      code {{
        font-family: "SFMono-Regular", "Cascadia Mono", "Consolas", monospace;
        background: var(--code-bg);
        padding: 0.18em 0.38em;
        border-radius: 4px;
        font-size: 0.94em;
      }}
      pre {{
        overflow-x: auto;
        background: #201e1b;
        color: #f7f4ee;
        padding: 16px;
        border-radius: 8px;
      }}
      pre code {{
        background: transparent;
        color: inherit;
        padding: 0;
      }}
      blockquote {{
        margin: 1.2em 0;
        padding: 0.2em 1em;
        border-left: 4px solid rgba(40, 79, 88, 0.3);
        color: var(--muted);
        background: rgba(255, 255, 255, 0.45);
      }}
      table {{
        width: 100%;
        min-width: 640px;
        border-collapse: separate;
        border-spacing: 0;
        margin: 0;
        font-size: 14px;
        background: #fff;
      }}
      th, td {{
        border-right: 1px solid var(--border);
        border-bottom: 1px solid var(--border);
        padding: 11px 13px;
        text-align: left;
        vertical-align: top;
      }}
      th {{
        position: sticky;
        top: 0;
        z-index: 1;
        background: rgba(40, 79, 88, 0.08);
        color: var(--text);
        font-weight: 700;
      }}
      th:first-child, td:first-child {{
        border-left: 0;
      }}
      tr:first-child th {{
        border-top: 0;
      }}
      tbody tr:nth-child(even) td {{
        background: rgba(40, 79, 88, 0.025);
      }}
      tbody tr:hover td {{
        background: rgba(40, 79, 88, 0.06);
      }}
      .table-wrap {{
        margin: 1.2em 0;
        overflow-x: auto;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: #fff;
        box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.6);
      }}
      .table-wrap table {{
        min-width: max(640px, 100%);
      }}
      .table-wrap::-webkit-scrollbar {{
        height: 10px;
      }}
      .table-wrap::-webkit-scrollbar-thumb {{
        background: rgba(31, 29, 26, 0.18);
        border-radius: 999px;
      }}
      .table-wrap::-webkit-scrollbar-track {{
        background: rgba(31, 29, 26, 0.05);
      }}
      img {{
        max-width: 100%;
        height: auto;
        border-radius: 6px;
      }}
      .side-title {{
        margin: 0 0 12px;
        font-size: 14px;
        font-weight: 700;
        color: var(--accent);
      }}
      .check-progress {{
        display: grid;
        gap: 8px;
        margin-bottom: 14px;
      }}
      .check-progress span {{
        color: var(--muted);
        font-size: 13px;
      }}
      .bar {{
        height: 8px;
        background: rgba(31, 29, 26, 0.08);
        border-radius: 999px;
        overflow: hidden;
      }}
      .fill {{
        width: 0;
        height: 100%;
        border-radius: 999px;
        background: linear-gradient(90deg, var(--accent), #4d6142);
      }}
      .check-items {{
        display: grid;
        gap: 10px;
      }}
      .check-item {{
        display: grid;
        grid-template-columns: 18px minmax(0, 1fr);
        gap: 10px;
        align-items: start;
        padding-top: 10px;
        border-top: 1px solid rgba(31, 29, 26, 0.08);
      }}
      .check-item:first-child {{
        border-top: 0;
        padding-top: 0;
      }}
      .check-item input {{
        margin-top: 3px;
        accent-color: var(--accent);
      }}
      .check-item label {{
        display: grid;
        gap: 3px;
        cursor: pointer;
      }}
      .check-item strong {{
        font-size: 13px;
      }}
      .check-item span {{
        font-size: 12px;
        color: var(--muted);
        line-height: 1.5;
      }}
      .check-item.done strong,
      .check-item.done span {{
        opacity: 0.66;
      }}
      .check-item.done strong {{
        text-decoration: line-through;
      }}
      .ghost {{
        border: 1px solid #bdb3a3;
        background: transparent;
        color: var(--muted);
        padding: 6px 10px;
        border-radius: 999px;
        font-size: 12px;
        cursor: pointer;
      }}
      .side-head {{
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 12px;
      }}
      .side-head .side-title {{
        margin: 0;
      }}
      .pdf-frame {{
        width: 100%;
        min-height: 78vh;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: #fff;
      }}
      @media (max-width: 1040px) {{
        .layout {{
          grid-template-columns: 1fr;
        }}
        .side-card {{
          position: static;
        }}
      }}
      @media (max-width: 720px) {{
        .content-card {{ padding: 22px 18px; }}
        h1 {{ font-size: 28px; }}
        h2 {{ font-size: 22px; }}
      }}
    </style>
  </head>
  <body>
    <div class="page">
      <div class="toolbar">
        <a href="/web/index.html">返回资料库</a>
        <div class="meta">{html.escape(rel_path)}</div>
      </div>
      <div class="layout">
        <article class="content-card">
          {content}
        </article>
        <aside class="side-card">
          <div class="side-head">
            <p class="side-title">准备 Checklist</p>
            <button id="reset-checklist" class="ghost" type="button">重置</button>
          </div>
          <div class="check-progress">
            <span id="check-count">0 / 0</span>
            <div class="bar"><div id="check-fill" class="fill"></div></div>
          </div>
          <div id="check-items" class="check-items">
            {checklist_html}
          </div>
        </aside>
      </div>
    </div>
    <script>
      const storageKey = "interview-prep-checklist-v1";
      const items = {html.escape(str([item_id for item_id, _, _ in CHECKLIST_ITEMS]))};
      function getState() {{
        try {{
          return JSON.parse(localStorage.getItem(storageKey) || "{{}}");
        }} catch {{
          return {{}};
        }}
      }}
      function saveState(state) {{
        localStorage.setItem(storageKey, JSON.stringify(state));
      }}
      function renderChecklist() {{
        const state = getState();
        let done = 0;
        items.forEach((id) => {{
          const input = document.querySelector(`input[data-id="${{id}}"]`);
          const wrapper = input.closest(".check-item");
          input.checked = Boolean(state[id]);
          wrapper.classList.toggle("done", input.checked);
          if (input.checked) done += 1;
        }});
        document.getElementById("check-count").textContent = `${{done}} / ${{items.length}}`;
        document.getElementById("check-fill").style.width = `${{(done / items.length) * 100}}%`;
      }}
      document.querySelectorAll("#check-items input").forEach((input) => {{
        input.addEventListener("change", () => {{
          const state = getState();
          state[input.dataset.id] = input.checked;
          saveState(state);
          renderChecklist();
        }});
      }});
      document.getElementById("reset-checklist").addEventListener("click", () => {{
        localStorage.removeItem(storageKey);
        renderChecklist();
      }});
      document.querySelectorAll("article table").forEach((table) => {{
        if (table.parentElement && table.parentElement.classList.contains("table-wrap")) return;
        const wrap = document.createElement("div");
        wrap.className = "table-wrap";
        table.parentNode.insertBefore(wrap, table);
        wrap.appendChild(table);
      }});
      renderChecklist();
    </script>
  </body>
</html>
"""


def render_markdown_page(file_path: Path, rel_path: str) -> str:
    text = file_path.read_text(encoding="utf-8")
    body = md.render(text)
    title = file_path.stem
    return viewer_shell(title, rel_path, body)


def render_pdf_page(file_path: Path, rel_path: str) -> str:
    raw_src = "/__raw__/" + rel_path
    content = f"""
    <h1>{html.escape(file_path.stem)}</h1>
    <p>这是 PDF 浏览页。右侧的 Checklist 会常驻，方便你边看边勾选。</p>
    <iframe class="pdf-frame" src="{html.escape(raw_src)}"></iframe>
    """
    return viewer_shell(file_path.stem, rel_path, content)


class InterviewPrepHandler(SimpleHTTPRequestHandler):
    def translate_path(self, path: str) -> str:
        parsed = urlparse(path)
        requested = unquote(parsed.path)
        full_path = resolve_requested_path(requested)
        if not is_within_root(full_path):
            return str(ROOT)
        return str(full_path)

    def do_GET(self) -> None:
        parsed = urlparse(self.path)
        requested = unquote(parsed.path)
        raw_mode = False
        if requested.startswith("/__raw__/"):
            raw_mode = True
            requested = requested[len("/__raw__"):]
            if not requested.startswith("/"):
                requested = "/" + requested
        file_path = resolve_requested_path(requested)
        relative = str(file_path.relative_to(ROOT)).replace(os.sep, "/")

        if not is_within_root(file_path):
            self.send_error(HTTPStatus.FORBIDDEN, "Forbidden")
            return

        if file_path.is_dir():
            index_path = file_path / "index.html"
            if index_path.exists():
                self.path = "/" + str(index_path.relative_to(ROOT)).replace(os.sep, "/")
                return super().do_GET()
            self.send_error(HTTPStatus.NOT_FOUND, "Directory listing disabled")
            return

        if not file_path.exists():
            self.send_error(HTTPStatus.NOT_FOUND, "File not found")
            return

        if not raw_mode and file_path.suffix.lower() == ".md":
            rendered = render_markdown_page(file_path, relative)
            encoded = rendered.encode("utf-8")
            self.send_response(HTTPStatus.OK)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(encoded)))
            self.end_headers()
            self.wfile.write(encoded)
            return

        if not raw_mode and file_path.suffix.lower() == ".pdf":
            rendered = render_pdf_page(file_path, relative)
            encoded = rendered.encode("utf-8")
            self.send_response(HTTPStatus.OK)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(encoded)))
            self.end_headers()
            self.wfile.write(encoded)
            return

        mime_type, _ = mimetypes.guess_type(str(file_path))
        if mime_type is None:
            mime_type = "application/octet-stream"

        with file_path.open("rb") as f:
            data = f.read()

        self.send_response(HTTPStatus.OK)
        if mime_type.startswith("text/") or file_path.suffix.lower() in {".js", ".css", ".html"}:
            self.send_header("Content-Type", f"{mime_type}; charset=utf-8")
        else:
            self.send_header("Content-Type", mime_type)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)


def main() -> None:
    server = ThreadingHTTPServer((HOST, PORT), InterviewPrepHandler)
    print(f"Serving interview-prep on http://{HOST}:{PORT}/")
    server.serve_forever()


if __name__ == "__main__":
    main()
