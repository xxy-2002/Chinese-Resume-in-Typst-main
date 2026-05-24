# Agent 开发基础概念（2026 版）

这份文档不是某一家框架的术语表，而是按 2026 年常见 agent 工程语境整理的一套实用概念。重点不是学术定义，而是面试里怎么讲得清楚。

参考方向包括：

- 你当前仓库里的项目语境
- [aboutskill.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/docs/aboutskill.md) 中提到的工程思路
- OpenAI 2026 Agents SDK 对 `model-native harness`、`skills`、`sandbox`、`trace` 的表述
- Harness Developer Hub 对 `skills` 的工程定义

## 一、什么是 Agent

面试可讲定义：

“Agent 不是单次文本生成，而是能围绕目标持续做决策、调用工具、读写上下文、执行多步任务并根据反馈继续推进的系统。”

关键词：

- 有目标
- 有状态
- 能调用工具
- 能多步执行
- 能根据结果调整下一步

和普通 prompt 的区别：

- prompt 更像一次性请求
- agent 更像带执行闭环的任务系统

## 二、什么是 Harness

2026 年这个词出现得越来越多，原因是大家逐渐发现，真正稳定的 agent 系统，核心难点不只是模型，而是模型外面的那层执行基座。

面试可讲定义：

“Harness 可以理解成 agent 的执行底座或运行基座。它负责把任务、上下文、工具、文件、权限、状态、评测和可观测性组织起来，让模型能在一个受控环境里稳定工作。”

你可以把 Harness 理解成这些能力的组合：

- 任务入口与指令组织
- 上下文选择与注入
- 工具访问
- 文件与工作区管理
- 状态管理
- 评测与验证
- trace 与观测
- 权限控制
- 回滚与审计

为什么这个词 2026 更常见：

- OpenAI 在 2026 年把 Agents SDK 明确描述为更强的 harness，并强调 `model-native harness`、sandbox、memory、filesystem tools、MCP、skills、AGENTS.md 这些原语
- 很多团队已经不再把 agent 框架只看成“prompt 编排器”，而是把它当运行时基础设施

在你的语境里怎么讲：

- `JoyDeliver` 里的 `Harness Agent + Runtime`
- `Skill Factory` 里的可插拔 `Harness`
- 你补充文档里“skill 更像 harness”的判断

## 三、什么是 Skill

面试可讲定义：

“Skill 是一种可复用的能力单元，通常用结构化说明、参考资料和必要脚本把某类任务的经验封装起来，让 agent 在需要时按这个能力模板来工作。”

在工程上，skill 通常包含：

- 任务说明
- 触发条件
- 执行步骤
- 约束规则
- references
- 可能的脚本或工具依赖

为什么 skill 不是普通 prompt：

- skill 是按任务能力封装的
- skill 可能带规则、参考资料、脚本和工具调用方式
- skill 追求复用性和稳定性，不只是把模型“说服过去”

一句话区分：

- prompt：一次性说法
- skill：可复用能力单元
- harness：承载 skill 和 agent 执行的系统底座

## 四、什么是 Runtime

面试可讲定义：

“Runtime 是 agent 真正执行时所在的运行层，负责调度执行过程，而不只是存放代码。”

Runtime 常管的内容：

- 任务生命周期
- 工具调用
- 上下文传递
- 状态流转
- 异常处理
- 并发与重试
- trace 采集

在你的简历语境里：

- `JoyDeliver` 里写的 `Harness Agent` 和调度 `Runtime`
- 它们不是一个抽象名词，而是平台稳定性的关键部分

## 五、什么是 Trace

面试可讲定义：

“Trace 是一次 agent 执行过程的可观测记录，不只看最终答案，还记录过程里发生了什么。”

常见 trace 内容：

- 用户输入
- 模型生成
- 工具调用
- 参数
- 中间状态
- handoff
- guardrail
- 输出结果
- 错误与重试

为什么 trace 很重要：

- 失败能复现
- 优化有证据
- 回归可对比
- 不再只靠总分猜原因

一句话表达：

“没有 trace，很多 agent 优化其实都在拍脑袋。”

## 六、什么是 Eval

面试可讲定义：

“Eval 是用一套可重复的方法判断 agent 或 skill 是否真的变好了。”

2026 年比较实用的 eval 思路：

- 不只看最终答案
- 同时看过程、工具使用、成本、稳定性和回归
- dev / holdout / regression 分开
- 规则检查和 LLM judge 可以并存

你可以把 eval 分成三类讲：

- 结构与安全检查
- 任务结果评测
- 回归与泛化验证

## 七、什么是 Guardrail

面试可讲定义：

“Guardrail 是 agent 执行过程中的护栏规则，用来限制危险行为或约束输出边界。”

常见 guardrail：

- 禁止危险命令
- 禁止越权访问
- 输出格式约束
- 敏感信息保护
- 工具选择限制

## 八、什么是 Hook

面试可讲定义：

“Hook 是挂在 agent 生命周期某个节点上的可插入逻辑，用来做拦截、补充上下文、记录事件、修改输入或者触发附加流程。”

常见 hook 时机：

- 用户输入前
- 模型调用前后
- 工具调用前后
- handoff 前后
- 错误或权限拒绝后

一句话表达：

“Hook 是 agent 生命周期上的治理接口。”

## 九、什么是 Workspace / Sandbox

面试可讲定义：

“Workspace 是 agent 当前任务所处的文件与上下文工作区，sandbox 是对这个工作区和执行环境的受控隔离。”

为什么重要：

- 降低执行风险
- 控制依赖和文件边界
- 保证任务可复现
- 便于审计和清理

## 十、什么是 Multi-Agent

面试可讲定义：

“Multi-Agent 不是单纯开多个模型实例，而是把不同职责的 agent 组织成协作系统，让它们在分工、验证、路由或审查上各自承担角色。”

常见模式：

- planner / executor
- supervisor / worker
- proposer / verifier
- router / specialist

多 agent 的难点：

- 职责重叠
- 路由不稳
- 上下文同步
- 状态共享
- 成本膨胀

## 十一、什么是 Agentic Workflow

面试可讲定义：

“Agentic Workflow 是把传统固定流程和 agent 决策能力结合起来的工作流。哪些步骤固定，哪些步骤交给模型判断，是设计重点。”

和传统 workflow 的区别：

- 传统 workflow：路径基本固定
- agentic workflow：路径可根据上下文动态调整

## 十二、什么是 SSE

面试可讲定义：

“SSE 是一种基于 HTTP 的服务端单向流式推送机制，很适合模型增量输出和状态事件流。”

为什么它在 Agent 开发里常见：

- 模型输出天然适合分块发送
- 前端可以边收边展示
- 和普通 HTTP 体系兼容
- 适合输出 token、状态和事件

一句话表达：

“SSE 是很多 AI 流式输出场景的默认选项。”

## 十三、什么是 MCP

面试可讲定义：

“MCP 可以理解成模型和外部能力之间的标准化接入协议，它让资源、工具和上下文以统一方式被 Agent 发现和调用。”

为什么重要：

- 降低外部能力接入的耦合成本
- 适合平台型 Agent 系统
- 让工具集成更标准化

一句话表达：

“如果 Tool Calling 解决的是‘怎么调一个工具’，MCP 更像在解决‘怎么标准化接入一类能力’。”

## 十四、什么是 ACP

面试可讲定义：

“ACP（Agent Communication Protocol）可以理解成 Agent 和 Agent 之间的标准通信协议，重点是让不同 Agent 用统一方式交换消息、能力和任务状态。”

为什么重要：

- 多 Agent 系统越来越常见
- 平台型 Agent 不只需要接工具，还需要接其他 Agent
- 纯定制接口会让生态碎片化

一句话表达：

“MCP 更偏模型 / Agent 接工具，ACP 更偏 Agent 和 Agent 怎么协作。”

## 十五、这些词之间怎么区分

最实用的区分方式：

- `Agent`：执行者
- `Skill`：可复用能力单元
- `Harness`：执行底座
- `Runtime`：实际运行层
- `Trace`：执行记录
- `Eval`：效果判断
- `Guardrail`：安全与约束
- `Hook`：生命周期治理点
- `SSE`：流式消息传输方式
- `MCP`：外部能力标准化接入协议
- `ACP`：Agent 之间的标准通信协议
- `Sandbox`：受控环境

## 十六、面试里可以直接用的总结句

### 1. Skill 和 Prompt 的区别

“Prompt 更像一次性说法，Skill 是把经验封装成可复用能力单元，通常还带规则、参考资料和脚本。”

### 2. Harness 是什么

“Harness 是 agent 的运行基座，负责把模型外面的执行环境、工具、状态、评测和可观测性组织起来。”

### 3. 为什么 2026 大家更爱讲 Harness

“因为现在大家逐渐发现，agent 是否稳定，不只是模型强不强，更取决于外面的工具层、工作区、状态、权限、trace 和 eval 能不能闭环。”

### 4. 为什么 Trace 重要

“Trace 让优化从拍脑袋变成基于证据的诊断。”

### 5. Hook 是什么

“Hook 是挂在 agent 生命周期节点上的可插拔逻辑，常用来做安全拦截、上下文补充和运行治理。”

### 6. SSE 是什么

“SSE 是基于 HTTP 的单向流式推送机制，特别适合 AI 应用里的增量输出和状态流展示。”

### 7. MCP 是什么

“MCP 是模型与外部能力之间的标准化接入协议，适合平台型 Agent 系统统一接工具和资源。”

### 8. ACP 是什么

“ACP 是面向 Agent-to-Agent 协作的标准通信协议，重点是让不同 Agent 用统一方式交换消息和协同执行任务。”

## 十七、建议回看顺序

1. 先看 `Harness / Skill / Runtime / Trace`
2. 再看 `Eval / Guardrail / Sandbox / Hook`
3. 再看 `SSE / MCP / ACP`
4. 最后看 `Multi-Agent / Agentic Workflow`
