const resources = {
  hero: [
    {
      title: "主手册",
      desc: "总控入口，按简历逐项映射资料，适合第一次完整浏览。",
      path: "../RESUME_PREP_HANDBOOK_2026_6.md",
      type: "总控",
      priority: "core",
      note: "最重要入口",
    },
    {
      title: "快速清单",
      desc: "快速把握哪些内容最重要，适合开始前做总览。",
      path: "../INTERVIEW_CHECKLIST.md",
      type: "清单",
      priority: "today",
      note: "先看再分流",
    },
    {
      title: "3 天冲刺",
      desc: "按面试时间倒排的准备计划，明确时长、深度和优先级。",
      path: "../PREP_PLAN_3_DAYS.md",
      type: "计划",
      priority: "sprint",
      note: "短期执行",
    },
  ],
  experience: [
    {
      title: "京东 JoyDeliver",
      desc: "交付智能平台主线稿，覆盖 Harness、Runtime、Skill、Pipeline 和应用场景。",
      path: "../internships/joydeliver-prep.md",
      type: "实习",
      priority: "core",
      note: "A 档",
    },
    {
      title: "Moatable Flow",
      desc: "多模型接入、记忆架构、Agent 治理、评估与成本优化的核心经历。",
      path: "../internships/flow-papago-prep.md",
      type: "实习",
      priority: "core",
      note: "A 档",
    },
    {
      title: "Skill Factory",
      desc: "Skill 生产、测评、优化与发布闭环，主项目准备稿。",
      path: "../projects/skill-factory-prep.md",
      type: "项目",
      priority: "core",
      note: "A 档",
    },
    {
      title: "GEPA 专题",
      desc: "针对 GEPA、Pareto Frontier 和 trace 驱动候选优化的专项面试稿。",
      path: "../projects/gepa-prep.md",
      type: "项目",
      priority: "today",
      note: "专项补充",
    },
    {
      title: "Momenta 补充经历",
      desc: "工程执行、OTA、日志排障和 Dify Agent 的补充准备稿。",
      path: "../internships/momenta-prep.md",
      type: "实习",
      priority: "reference",
      note: "收尾项",
    },
  ],
  fundamentals: [
    {
      title: "基础知识回看顺序",
      desc: "Redis / MySQL / 网络 / OS / Agent 概念的优先级总览。",
      path: "../fundamentals/fundamentals-review-order.md",
      type: "基础",
      priority: "today",
      note: "总路线",
    },
    {
      title: "Agent 基础概念",
      desc: "Harness、Skill、Runtime、Trace、Hook、Eval、Sandbox 等 2026 常用概念。",
      path: "../fundamentals/agent-basics-2026.md",
      type: "基础",
      priority: "today",
      note: "Agent 概念",
    },
    {
      title: "Agent 前沿与训练优化",
      desc: "Hook、Trace-first eval、Agent Lightning、TRACE 等面向业务应用的前沿补充。",
      path: "../fundamentals/agent-advanced-2026-for-ai-apps.md",
      type: "前沿",
      priority: "sprint",
      note: "岗位贴合",
    },
    {
      title: "大模型应用开发：岗位整理版",
      desc: "从原始长文里筛出当前岗位最值得看的主题：Tool Use、MCP、Memory、RAG、vLLM、LoRA、DPO、GRPO、Multi-Agent。",
      path: "../projects/大模型应用开发面试题_QA整理_岗位整理版.md",
      type: "前沿",
      priority: "core",
      note: "现在先看这个",
    },
    {
      title: "大模型到 Agent 开发核心 QA片",
      desc: "进一步压缩成可背的核心问题，只保留最可能被问、最能和项目经历挂钩的内容。",
      path: "../projects/大模型到Agent开发核心QA片.md",
      type: "QA",
      priority: "core",
      note: "背诵版",
    },
    {
      title: "技能栏对照",
      desc: "把简历技能栏转成可答的话术，适合快速回顾每一栏怎么讲。",
      path: "../fundamentals/resume-skills-prep.md",
      type: "基础",
      priority: "today",
      note: "简历对应",
    },
    {
      title: "Redis QA 整理",
      desc: "分布式锁、缓存一致性、雪崩、穿透、热 Key、大 Key 等高频问题。",
      path: "../fundamentals/Redis面试题_QA整理.md",
      type: "QA",
      priority: "core",
      note: "高频",
    },
    {
      title: "MySQL QA 整理",
      desc: "索引、联合索引、事务、MVCC、锁等最容易结合项目追问的内容。",
      path: "../fundamentals/MySQL面试题_QA整理.md",
      type: "QA",
      priority: "core",
      note: "高频",
    },
    {
      title: "计算机网络 QA 整理",
      desc: "TCP、HTTP/HTTPS、TLS、DNS 和常见网络排障。",
      path: "../fundamentals/计算机网络面试题_QA整理.md",
      type: "QA",
      priority: "core",
      note: "高频",
    },
    {
      title: "操作系统 QA 整理",
      desc: "进程线程协程、IO 多路复用、epoll、零拷贝等核心内容。",
      path: "../fundamentals/操作系统面试题_QA整理.md",
      type: "QA",
      priority: "sprint",
      note: "补基础",
    },
    {
      title: "Go QA 整理",
      desc: "channel、context、GMP、GC 等内容，作为收尾和补强。",
      path: "../fundamentals/Golang面试题_QA整理.md",
      type: "QA",
      priority: "reference",
      note: "有余力再看",
    },
  ],
  handwriting: [
    {
      title: "手撕题准备总览",
      desc: "说明当前岗位下手撕题的定位、优先级、时间预算和最值得看的题型。",
      path: "../general/leetcode-handwriting-prep.md",
      type: "手撕题",
      priority: "sprint",
      note: "补充项",
    },
    {
      title: "LeetCode Hot 100 终版",
      desc: "当前手撕题主入口，带优先级与题型组织，建议优先使用这一版。",
      path: "../general/Interview_Prep_Final.md",
      type: "手撕题",
      priority: "sprint",
      note: "主入口",
    },
  ],
  mock: [
    {
      title: "均衡版模拟面试",
      desc: "适合常规技术一面，从自我介绍到项目与基础知识的均衡问答。",
      path: "../mock-interviews/mock-interview-v1-balanced.md",
      type: "模拟",
      priority: "today",
      note: "先练这个",
    },
    {
      title: "项目深挖版模拟面试",
      desc: "更偏 Agent 平台和项目细节，重点压 JoyDeliver、Flow 和 Skill Factory。",
      path: "../mock-interviews/mock-interview-v2-project-deep-dive.md",
      type: "模拟",
      priority: "sprint",
      note: "第二轮",
    },
    {
      title: "压力追问版模拟面试",
      desc: "更像强追问场景，适合做横向比较、边界澄清和岗位收口训练。",
      path: "../mock-interviews/mock-interview-v3-pressure-and-cross.md",
      type: "模拟",
      priority: "sprint",
      note: "第三轮",
    },
  ],
  reference: [
    {
      title: "aboutskill 相关工作参考",
      desc: "相似痛点和方法灵感来源，适合扩展，不替代项目事实。",
      path: "../docs/aboutskill.md",
      type: "参考",
      priority: "reference",
      note: "相关工作",
    },
    {
      title: "Generic Agent 参考笔记",
      desc: "从记忆、反思、规划、行动闭环角度理解 Agent 长期行为体，对多级记忆和多步任务组织很有启发。",
      path: "../docs/generative-agents-note.md",
      type: "参考",
      priority: "reference",
      note: "视野扩展",
    },
    {
      title: "Meta-Harness 参考笔记",
      desc: "重点看 trace-first diagnosis、轨迹驱动优化和 harness 在评测闭环里的作用。",
      path: "../docs/meta-harness-note.md",
      type: "参考",
      priority: "reference",
      note: "方法参考",
    },
    {
      title: "大模型应用开发原始长文",
      desc: "保留为原始资料，覆盖很全，但范围较大，且含部分引用占位，适合深挖时回看。",
      path: "../projects/大模型应用开发面试题_QA整理.md",
      type: "参考",
      priority: "reference",
      note: "原始长文",
    },
    {
      title: "Flow 原始补充材料",
      desc: "包含前沿建议和延展方案，适合作为补充阅读。",
      path: "../internships/flow（papago.ai）项目.md",
      type: "参考",
      priority: "reference",
      note: "原始材料",
    },
    {
      title: "教育、奖项与竞赛",
      desc: "教育与比赛的简短准备稿，适合作收尾准备。",
      path: "../education/education-and-competition-prep.md",
      type: "背景",
      priority: "reference",
      note: "弱主线",
    },
    {
      title: "迁移记录",
      desc: "资料来源与迁移索引，用于追溯，不是主阅读入口。",
      path: "../MIGRATION_INDEX.md",
      type: "归档",
      priority: "reference",
      note: "来源记录",
    },
    {
      title: "简历 PDF 对照",
      desc: "当前准备围绕的简历版本，适合在浏览资料时随时对照原文。",
      path: "../resume-reference/2026_6.pdf",
      type: "简历",
      priority: "today",
      note: "对照用",
    },
    {
      title: "目录说明",
      desc: "说明资料范围、定位和使用原则，适合第一次了解这套资料库时浏览。",
      path: "../README.md",
      type: "说明",
      priority: "reference",
      note: "目录说明",
    },
  ],
};

const checklistItems = [
  {
    id: "self_intro",
    title: "自我介绍",
    detail: "能稳定讲 1-2 分钟版本，突出 Agent 应用研发主线。",
  },
  {
    id: "joydeliver",
    title: "JoyDeliver",
    detail: "能讲清 Harness / Runtime / Skill / Pipeline。",
  },
  {
    id: "flow",
    title: "Flow(Papago.ai)",
    detail: "能讲清多模型接入、记忆、路由、评估、成本优化。",
  },
  {
    id: "skill_factory",
    title: "Skill Factory",
    detail: "能讲清 Harness、GEPA、trace、sandbox、发布门禁。",
  },
  {
    id: "agent_concepts",
    title: "Agent 概念",
    detail: "Harness / Skill / Runtime / Hook / Trace / Eval 一句话定义。",
  },
  {
    id: "redis_mysql_net",
    title: "Redis / MySQL / 网络",
    detail: "高频题能答，且能和项目经历连起来。",
  },
  {
    id: "mock_interview",
    title: "模拟面试",
    detail: "至少完整练过 2 轮，能扛一轮纵向追问。",
  },
];

const sections = [
  ["hero", document.getElementById("hero-grid"), true],
  ["experience", document.getElementById("experience-grid"), false],
  ["fundamentals", document.getElementById("fundamentals-grid"), false],
  ["handwriting", document.getElementById("handwriting-grid"), false],
  ["mock", document.getElementById("mock-grid"), false],
  ["reference", document.getElementById("reference-grid"), false],
];

let activeFilter = "all";
let activeSearch = "";
const checklistStorageKey = "interview-prep-checklist-v1";

function buildCard(item, hero = false) {
  const article = document.createElement("article");
  article.className = `resource-card${hero ? " hero" : ""}`;
  article.dataset.priority = item.priority;
  article.dataset.search = [item.title, item.desc, item.type, item.note].join(" ").toLowerCase();

  article.innerHTML = `
    <div class="resource-meta">
      <span class="badge type">${item.type}</span>
      <span class="badge priority-${item.priority}">${priorityLabel(item.priority)}</span>
    </div>
    <h3 class="resource-title">${item.title}</h3>
    <p class="resource-desc">${item.desc}</p>
    <div class="resource-footer">
      <div>
        <div class="resource-path">${item.note}</div>
      </div>
      <a class="resource-link" href="${item.path}">打开资料</a>
    </div>
  `;

  return article;
}

function priorityLabel(priority) {
  switch (priority) {
    case "core":
      return "核心";
    case "today":
      return "今天先看";
    case "sprint":
      return "3天冲刺";
    case "reference":
      return "参考";
    default:
      return "全部";
  }
}

function render() {
  let total = 0;

  sections.forEach(([key, container, hero]) => {
    container.innerHTML = "";
    resources[key].forEach((item) => {
      const matchesFilter = activeFilter === "all" || item.priority === activeFilter;
      const matchesSearch =
        !activeSearch || [item.title, item.desc, item.type, item.note].join(" ").toLowerCase().includes(activeSearch);

      if (matchesFilter && matchesSearch) {
        container.appendChild(buildCard(item, hero));
        total += 1;
      }
    });
  });

  document.getElementById("total-count").textContent = total;
}

function getChecklistState() {
  try {
    return JSON.parse(localStorage.getItem(checklistStorageKey) || "{}");
  } catch {
    return {};
  }
}

function saveChecklistState(state) {
  localStorage.setItem(checklistStorageKey, JSON.stringify(state));
}

function renderChecklist() {
  const container = document.getElementById("checklist-items");
  const countNode = document.getElementById("checklist-count");
  const fillNode = document.getElementById("checklist-fill");
  const state = getChecklistState();

  container.innerHTML = "";

  let doneCount = 0;

  checklistItems.forEach((item) => {
    const checked = Boolean(state[item.id]);
    if (checked) doneCount += 1;

    const wrapper = document.createElement("div");
    wrapper.className = `checklist-item${checked ? " done" : ""}`;

    wrapper.innerHTML = `
      <input id="check-${item.id}" type="checkbox" ${checked ? "checked" : ""} />
      <label for="check-${item.id}">
        <strong>${item.title}</strong>
        <span>${item.detail}</span>
      </label>
    `;

    const input = wrapper.querySelector("input");
    input.addEventListener("change", () => {
      const next = getChecklistState();
      next[item.id] = input.checked;
      saveChecklistState(next);
      renderChecklist();
    });

    container.appendChild(wrapper);
  });

  countNode.textContent = `${doneCount} / ${checklistItems.length}`;
  fillNode.style.width = `${(doneCount / checklistItems.length) * 100}%`;
}

document.getElementById("global-search").addEventListener("input", (event) => {
  activeSearch = event.target.value.trim().toLowerCase();
  render();
});

document.querySelectorAll(".filter-chip").forEach((button) => {
  button.addEventListener("click", () => {
    document.querySelectorAll(".filter-chip").forEach((chip) => chip.classList.remove("active"));
    button.classList.add("active");
    activeFilter = button.dataset.filter;
    render();
  });
});

document.getElementById("reset-checklist").addEventListener("click", () => {
  localStorage.removeItem(checklistStorageKey);
  renderChecklist();
});

render();
renderChecklist();
