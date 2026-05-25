# JoyDeliver & JoySmith 简历优化与面试准备详尽指南

本指南旨在帮助你梳理实习期间在 **JoyDeliver（项目交付智能平台）** 与 **JoySmith（Harness Agent 服务与调度 Runtime）** 的核心工作，提炼出具有高技术含量的语言表述，并提供高频面试题目的深度解析，支撑你的简历撰写与面试通关。

---

## 1. 简历话术重塑与技术背书

将你简历上的三个核心要点进行**专业术语级扩展**与**量化/架构化表述**：

### 要点一：JoyDeliver 交付平台与任务流设计
*   **原描述**：负责 *JoyDeliver* *项目交付智能平台设计与开发*，面向 ToB 项目原始材料分散、需求变更频繁、上下文断裂与经验难复用等痛点，将需求定义、原型设计、方案设计、开发实施、测试验证构建为结构化Agent任务流...
*   **技术重塑版**：
    > **负责 ToB 软件交付全生命周期智能平台 JoyDeliver 的架构设计与核心研发**。针对原始输入杂乱、长链路上下文丢失、复用性低等痛点，基于 **FastAPI + Next.js** 研发了**分阶段准出式（Stage-Gate）项目交付流水线**。将交付流程解耦为 **知识落库（Knowledge Intake）**、**需求澄清（Clarification）**、**原型生成（Prototype Gen）** 与 **架构设计（Architecture Design）** 四大核心阶段，实现端到端的交付闭环与真实项目落地。

### 要点二：Harness Agent 服务与调度 Runtime (JoySmith)
*   **原描述**：开发底层 *Harness Agent* 服务与调度 *Runtime* 为 JoyDeliver，提供稳定的 Agent 执行、工具调用、上下文传递、状态流转、异常处理与 *Trace* 记录能力...
*   **技术重塑版**：
    > **自主设计并研发了常驻 Agent HTTP 调度服务与执行引擎 JoySmith（基于 Node.js + Hono，深度定制 pi-coding-agent）**。以项目/会话维度提供稳定隔离的 Agent 执行环境：
    > 1. **并发与会话控制**：引入会话级别的 **通道队列（ChannelQueue）** 与互斥锁机制，确保单项目多任务的安全调度与执行。
    > 2. **上下文膨胀治理（Artifacts 外置）**：针对长链路 Multi-Agent 交互中 LLM 上下文（Context Window）快速膨胀与 Token 成本飙升的痛点，设计了**旁路快照与 Artifact 存储机制**。将子 Agent 生成的巨量执行日志与代码文件剥离至带外 Artifact 存储，主会话中仅传递轻量化的 `Summary` 与结构化 `Handoff`，使主会话 Token 消耗降低 70%+。
    > 3. **源码掌控与定制**：主导了对上游底层依赖的 **源码级接管（Vendoring & Fork）**，消除了复杂的 `node_modules` 深层引用，并在其上定制开发了 `custom-bash` 进程控制与安全性边界隔离。

### 要点三：基于 Skill 的 Pipeline 多智能体编排
*   **原描述**：设计基于 *Skill* 的 *Pipeline* 多智能体编排模型，将 *Agent / Skill / Pipeline* 抽象为平台一等执行单元...
*   **技术重塑版**：
    > **构建了基于 Skill 的协同编排多智能体流水线（Orchestrated Executor Pipeline）**。弃用传统后端写死 DAG 状态机的呆板模式，采用 **LLM 动态规划 + Runtime 状态辅助（Runtime-assisted Collaborative Workflows）** 的新范式：
    > 1. **双阶段执行模式（Plan-Execute）**：将复杂任务拆解为 **只读沙箱规划阶段（Plan）** 与 **受控执行阶段（Execute）**。主智能体通过只读工具（Read/Grep/Find/Status）输出带步骤编号的 `plan.md`，用户在 Web 端审阅并添加行内标注（Inline Annotations）后，Runtime 重塑 Plan 并驱动子 Agent 严格按照 `[DONE:n]` 标记执行。
    > 2. **并行安全锁（Locking & writeScope）**：支持多子智能体并发执行。设计了基于文件路径的 **写范围保护协议（writeScope Locking）**，提供 `reservation`（排他预留）与 `dynamic`（动态冲突检测）双模式文件锁，彻底避免了并发代码写入冲突。
    > 3. **轻量化 Handoff 协议**：制定了子 Agent 间状态流转的 `Handoff` JSON 规范（`completed`/`blocked`/`need_retry`/`partial`），使主智能体能根据子 Agent 反馈动态进行重新规划（Replan）与容错续跑。

---

## 2. JoyDeliver & JoySmith 架构设计

### 2.1 整体架构拓扑图

```mermaid
flowchart TD
    subgraph Web_Frontend [前端 UI (Next.js 14)]
        UI[交付管理/计划评审/KB浏览器]
    end

    subgraph JoyDeliver_API [管理与准出编排服务 (FastAPI)]
        Router[API Gateway & Agent Router]
        DB[(SQLite / PostgreSQL)]
        FS[共享文件系统: projects/name/]
        DocParse[DocParse Service: 原始文件提取]
    end

    subgraph JoySmith_Service [Harness Agent 调度与运行时 (Hono/Node.js)]
        Hono[Hono HTTP/SSE Server]
        Mgr[Session Manager & ChannelQueue]
        Orch[Pipeline Orchestrator]
        Compat[Custom Bash & Compat Shim]
        VendorPI[pi-agent-core / pi-ai Vendored Source]
        Artifacts[(Artifact 旁路存储)]
    end

    subgraph LLM_Provider [京东云大模型]
        LLM[OpenAI 兼容接口: Kimi-K2.6]
    end

    UI <-- HTTP/SSE --> Router
    Router <-- SQLite Metadata --> DB
    Router <-- DB / callback --> Hono
    Router -- 1. Submit Doc --> DocParse
    DocParse -- 2. MD output --> FS
    
    Hono <-- 3. Load/Save Session --> FS
    Hono <-- 4. Call Agent Tool --> VendorPI
    Orch -- Parallel Lock / writeScope --> FS
    Compat -- Spawns/Safe Execution --> FS
    VendorPI <-- 5. Tool Call / Chat --> LLM
    VendorPI -- 6. Large Payloads Offload --> Artifacts
```

### 2.2 核心协作流程（E2E 交付流）
1.  **材料落库与解析**：用户通过 Web 页面上传 ToB 项目的原始文档（PRD、会议纪要等）。JoyDeliver API 触发后端任务，调用自建的 **DocParse 服务** 将多格式文件（PDF/DOCX等）统一转为 Markdown。
2.  **知识落库准出（Stage-Gate）**：JoyDeliver 通过 **Agent Router** 路由到 JoySmith，基于项目绑定关系创建 Agent Session。Agent 开始扫描项目 `kb/` 目录。
    *   准出检查：检查是否存在 `requirements.md`、`solution-architecture.md` 等 7 大核心交付文档。
    *   通过后，生成 **准出报告快照**。若后续材料发生变更，系统会比对哈希值，决定是否触发 **增量重构（Increment Update）**。
3.  **动态 Pipeline 协同执行**：
    *   主 Agent 读取项目对应的 Pipeline 模板（如 `Knowledge Base Workflow`），通过 **`pipeline_plan`** 工具在 SQLite 中注册结构化任务步骤。
    *   对于每一个步骤，主 Agent 调用 **`agent` tool**，由 JoySmith 动态拉起子 Agent（绑定对应 Skill，如 `repo_explorer`）。
    *   子 Agent 在隔离的工作区执行，修改文件或分析代码，最后通过 **`## Handoff` JSON 块** 向主会话返回终态与摘要。
4.  **开发同步**：终态产物写入 `sync/` 目录，通过 CLI 工具 `joydeliverhub` 拉取至开发本地的 `.joycode/` 中。

---

## 3. 面试高频问题与满分回答模板

### Q1：为什么不直接调用京东云的 LLM API，而是大费周章地开发了一个 JoySmith (Node.js) 独立服务作为底层 Agent 运行时？
> **回答要点：**
> 1.  **文件操作与安全沙箱的稳定性**：在软件交付场景下，Agent 需要高频地进行文件读写、Grep 搜索、命令行执行（Bash）等文件系统级操作。大模型直接生成的代码或工具调用很难提供断点续传、路径越界防御与超时控制。我们引入 JoySmith 隔离了文件系统的底层细节，用 TypeScript 编写了严密的安全检查（如 `resolve_under_root` 防任意路径穿越）。
> 2.  **会话并发与状态恢复（持久化）**：ToB 交付是一个长周期的过程，我们不能只让 Agent 存在于内存中。JoySmith 实现了会话管理，将 Agent 每次交互的消息序列（`context.jsonl`）、原始审计日志（`log.jsonl`）和长期记忆（`MEMORY.md`）落盘。当发生网络断连、会话崩溃或用户在多端切换时，能够以毫秒级恢复会话状态，这在原始 API 层面是无法做到的。
> 3.  **高并发下的 Channel Mutex**：避免多个任务并发读写同一个项目的代码库导致冲突，我们在 Session Manager 中引入了基于 Hono 协程的 `ChannelQueue` 互斥锁，确保操作排队，提升工程稳定性。

### Q2：在长周期的 Multi-Agent 交付任务中，Agent 会频繁调用子 Agent 进行各个模块的设计与开发，这会导致主会话的上下文（Context Window）快速膨胀，你是如何解决这个 Token 消耗高昂且长上下文导致 LLM 幻觉的问题的？
> **回答要点（核心亮点，面试官最爱听的系统级重构）：**
> *   **问题本质**：传统的 Multi-Agent 框架（如 LangChain/AutoGPT）中，子 Agent 执行的完整输出（如分析的几百行日志、生成的整篇 PRD 代码）会被一股脑“回填”到主 Agent 的上下文里。这会导致主会话在多轮交互后，上下文窗口爆满，推理变慢，Token 费用激增，甚至主 Agent 遗忘之前的关键指令（Needle in a Haystack 效应）。
> *   **我们的解决方案（Artifacts 旁路存储机制）**：
>     1.  **结构与数据剥离**：我们改造了 `agent` 调用工具，让子 Agent 不再直接将全部正文输出回传给主会话。我们限制子 Agent 必须在结尾输出一个极轻量级的结构化 JSON 区块：**`## Handoff`**。
>     2.  **Handoff JSON** 仅包含 4 个关键信息：任务状态（`completed/blocked` 等）、简短总结（Summary）、输出的产物 ID（`artifactId`）和后续推荐（Next Actions）。
>     3.  **旁路存储与按需读取**：主会话的 Runtime 拦截到子 Agent 输出后，将完整的长篇内容存入 **Artifact 旁路存储器**。只把 Handoff 里面的 Summary 与 `artifactId` 塞回主会话的 Context 中。主会话在后续规划中，如果需要具体内容，可以通过专门的 `read_artifact` 显式读取，不需要主 LLM 重复记忆，从而将主会话 Token 消耗和上下文大小降低了 70% 以上，极大地提升了决策确定性。

### Q3：并行执行多个子 Agent 任务时，如果他们需要同时修改同一个代码库，你是如何设计并发控制和文件锁的？
> **回答要点：**
> *   我们设计了基于 **`writeScope`（写范围保护）** 的锁定机制，并在 Runtime 实现了两种锁策略：
>     1.  **`reservation`（排他预留模式）**：当子 Agent 声明的修改范围有重叠（例如都写 `src/services/` 目录），或任务涉及到全局汇总文件（如 `router.py`）时，Runtime 会强制将这部分 Scope 串行化。后续的子 Agent 任务会在队列中等待锁释放。
>     2.  **`dynamic`（动态冲突检测模式）**：当子 Agent 只能声明一个较粗的 Scope，但预计实际只会修改里面不交叉的具体子文件时启用。Runtime 会利用内存中的文件哈希快照，在子 Agent 运行结束后提交文件写入前，动态检测是否有文件冲突（Conflict Check）。如有冲突，则自动标记为 `need_retry`，触发回滚并重新规划。
>     3.  对于只读任务，我们会在工具调用参数中显式标记 `readonly: true`，不分配任何写锁，从而最大化并行的吞吐量。

### Q4：你在简历中提到主导了底层依赖的“源码级接管”（Vendoring & Fork），出于什么考量？遇到过什么工程挑战？
> **回答要点：**
> *   **背景与考量**：最初我们依赖 npm 上的开源库 `@mariozechner/pi-coding-agent`，但随着业务的深入，我们发现开源库的升级（包括其改名为 `@earendil-works/pi-mono`）带来了破坏性的 API 变更，直接升级会导致 JoySmith 崩溃；此外，作为 ToB 平台，我们需要对 Agent 执行的每一条 Shell 命令、模型交互格式和沙箱边界拥有 **绝对控制权**。因此，我决定进行 **Monorepo 源码接管**：
>     1.  我们将上游库的核心 package（`ai`/`agent`/`coding-agent`/`tui`）及 `tsconfig` 编译底座完整 vendored 到 JoySmith 仓库中，修改 package scope 为 `@joysmith/*`，用 npm workspace 进行统一管理。
>     2.  **工程挑战与兼容层（Compat Shim）**：原项目里存在很多非公开导出的内部依赖（例如 JoySmith 直接深引用了 `node_modules/.../dist/utils/shell.js` 等未导出文件）。在源码化接管中，我设计了统一的 PI SDK 入口 `pi-sdk.ts`，并编写了 `src/core/pi-compat/` 兼容层，重新封装了底层的自定义 bash 进程管理器。
>     3.  **资源文件漏拷的陷阱**：在搬迁 TS 源码时，我发现 Agent 运行时在特定主题渲染、HTML 报告导出时频繁报错。定位后发现，TS 编译器不会自动搬运 `theme.json` 和 `template.html` 等非 TS 静态资源。为此，我修改了构建脚本，并在 vendoring 清单中强制锁定了这些非 TS 资源的复制，顺利打通了编译与测试。

### Q5：解释一下你们的“只读沙箱规划（Plan） + 验证执行（Execute）”两阶段多智能体编排是怎么工作的？
> **回答要点：**
> *   传统 Agent 执行复杂任务容易“脱缰”，在没想清楚之前就乱改文件，导致改错后无法收敛。我们引入了两阶段控制：
>     1.  **规划阶段（Plan-Stage）**：当用户下发任务后，主 Agent 被装载为“只读沙箱模式”，只允许调用 `read`、`grep`、`find` 等只读工具。主 Agent 在主会话中分析上下文，并自动生成带有编号和稳定 `stepId` 的 `plan.md`。
>     2.  **人工评审桥接（Human-in-the-loop）**：产生的 Plan 结构化数据会被同步写入 SQLite。前端 Web 页面会渲染这套 Plan，并允许交付工程师进行手动调整、标注（Annotations）或重排步骤。
>     3.  **受控执行阶段（Execute-Stage）**：用户确认后，下发执行指令。主 Agent 开启“全功能写权限”，动态唤起子 Agent 去执行具体步骤。子 Agent 每执行完一个步骤，必须在输出中打上 `[DONE:step_id]`。Runtime 监视器如果发现某一步失败或输出不符合规范，会自动触发重规划（Replan）并中断流程，防止错误扩散。

---

## 4. 补充加分项：你可以聊的实习感悟与工程痛点

在面试中，主动聊出你在实际开发中踩过的坑和解决思路，能极大地体现你的**实际工程落地能力**：
1.  **关于大模型工具调用（Tool Calling）的局限性**：
    *   在实习中，我们接入的是京东云的模型（Kimi-K2.6），虽然兼容 OpenAI 协议，但在支持 `tools` 字段的复杂嵌套时偶尔会出现参数溢出或解析错误。为了解决这个问题，我们在 `model_provider.ts` 里加入了一层 **结构化 Shim 转换器**，将一些新版的 `tool_calls` 参数向下兼容成旧版的 `functions` 结构投喂给模型，大大提升了在国产云模型环境下的稳定性。
2.  **关于状态同步与异常处理（对账机制）**：
    *   Agent 经常写文件写到一半由于超时中断，这会导致本地磁盘上的代码与数据库里的任务状态不一致。我们遵循“**文件系统是总线，DB 是索引**”的原则，在 JoyDeliver API 侧设计了 `manifest.json` 对账机制。每次 Agent 执行前会计算文件 SHA-256 哈希值快照，如果任务失败，API 能够依据快照安全地把 workspace 还原（Rollback）到干净的准出点，杜绝了代码半吊子修改带来的编译报错。

---

祝你面试顺利！你可以随时查阅本仓库下的 `/Users/xuexuyang.3/JoyDliver/JoyDliver/superpowers/specs/` 与 `/Users/xuexuyang.3/JoySmith/docs/` 目录，获取更多代码细节支持。
