# 大模型应用开发面试题_QA整理：岗位整理版

这份整理版只服务当前目标岗位：

- `AI应用研发工程师`
- `淘天集团-商业智能&决策支持`

目标不是系统复习整个大模型领域，而是从原始长文里筛出对当前岗位最有价值、最容易被追问、最能和你简历项目挂钩的部分。

原始资料：

- [大模型应用开发面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/大模型应用开发面试题_QA整理.md)

---

## 一、这份资料为什么需要重整

原始长文的问题主要有三类：

1. 范围太大：
   从预训练、Transformer 历史一路铺到多模态、车载语音、Agent、RAG、训练框架，信息过多。

2. 岗位不够聚焦：
   当前岗位更关心 `Agent 应用研发`、`结构化任务`、`流程编排`、`评测闭环`、`部署与成本`，而不是泛模型史。

3. 格式上有噪音：
   部分章节含 `:contentReference[oaicite:...]` 这类引用占位，不适合作为直接复习稿。

所以当前建议是：

- 用这份“岗位整理版”做主线
- 原始长文只在需要深挖时回看

---

## 二、当前岗位下最该看的 8 个主题

### 1. Tool Use / MCP / Skill

为什么重要：

- 这是 Agent 平台最贴近工程落地的一层
- 直接关联你的 `JoyDeliver`、`Flow`、`Skill Factory`

你至少要能讲：

- 什么是 Tool Use
- 什么是 MCP
- Skill 和 Tool 的区别
- 为什么平台化系统需要统一接入协议和可复用能力单元

优先回看原文：

- `2.3 Tool Use 与 MCP 与 Skill`

### 2. Memory

为什么重要：

- 直接关联 `Flow` 里的 `Cortex`
- 直接关联你简历写的 `多级记忆管理`

你至少要能讲：

- 短期 / 长期 / 工作记忆
- 共享与隔离为什么要同时存在
- 记忆为什么不能只靠上下文窗口

优先回看原文：

- `2.4 Memory`

### 3. RAG

为什么重要：

- 几乎所有业务 Agent 都绕不开检索与知识接入
- 也和你网络补充里的 `SSE / MCP / 流式传输` 构成完整链路

你至少要能讲：

- RAG 基本流程
- Query 改写
- 多路召回
- Rerank
- 文档分块
- RAG 评估

优先回看原文：

- `2.5 RAG与向量数据库`
- 原文后半段 RAG Q&A 笔记部分

### 4. SFT / LoRA / DPO / GRPO / RLHF

为什么重要：

- 这是“会不会训练/微调”最容易问的基础层
- 你简历技能栏里已经写了这些词

你至少要能讲：

- `SFT` 解决什么问题
- `LoRA` 为什么适合工程实践
- `DPO` 和 `RLHF` 的区别
- `GRPO` 在当前语境里的作用

优先回看原文：

- `Q3 SFT`
- `Q4 LoRA`
- `Q4 RLHF/PPO`
- `Q5 DPO`
- `Q6 GRPO`

### 5. vLLM / KV Cache / 部署与推理

为什么重要：

- 这是 AI 应用岗位很高频的工程追问
- 当前岗位不一定让你手写训练，但很可能问部署和成本

你至少要能讲：

- 什么是 `KV Cache`
- `vLLM` 为什么快
- `PagedAttention` 的核心思路
- 部署里最关注哪些指标

优先回看原文：

- `Q10 KV Cache`
- `Q11 vLLM / PagedAttention`
- `Q12 显存估算`
- `Q13 部署常见问题`

### 6. LangChain / LangGraph / LlamaIndex

为什么重要：

- 这是面试里最常出现的“框架理解题”
- 也直接关联你简历写的 `LangChain / Dify / Eino`

你至少要能讲：

- LangChain 和 LangGraph 的区别
- LlamaIndex 和 LangChain 的区别
- 各自适合什么场景

优先回看原文：

- `2.6 常见框架与平台`

### 7. Multi-Agent / Agentic Workflow / Self-Improving Agent

为什么重要：

- 直接关联 `JoyDeliver`
- 直接关联 `Skill Factory`

你至少要能讲：

- 多智能体为什么不是简单多开几个模型
- `Agentic Workflow` 和传统流程的区别
- 自我改进 Agent 的核心闭环是什么

优先回看原文：

- `2.7 当前前沿方向`

### 8. 生产环境中的 Agent 设计

为什么重要：

- 这是最贴岗位的收口题
- 能把你从“会概念”拉到“会工程”

你至少要能讲：

- 高可用
- 可观测性
- Trace
- 成本优化
- 限流与重试
- 回归与评测

优先回看原文：

- `2.8 生产中的智能体设计`

---

## 三、当前岗位下可以弱化的内容

这些不是不重要，而是当前 3 天内不值得优先投入：

- 太长的大模型发展史时间线
- 过多主流模型横向盘点
- 纯多模态底座细节
- 和当前岗位无强关联的车载语音专项

处理原则：

- 知道它们存在
- 不作为主准备线

---

## 四、建议复习顺序

1. `Tool Use / MCP / Skill`
2. `Memory`
3. `RAG`
4. `LangChain / LangGraph / LlamaIndex`
5. `vLLM / KV Cache / 部署`
6. `SFT / LoRA / DPO / GRPO / RLHF`
7. `Multi-Agent / Agentic Workflow`
8. `生产中的 Agent 设计`

---

## 五、你面试里最该会说的几句话

### 1. 为什么这份内容对当前岗位重要

“这个岗位更像是做 Agent 应用工程，而不是泛模型研究，所以我会优先关注工具接入、记忆、RAG、评测、部署和成本这些更贴业务落地的层面。”

### 2. 为什么不按原文顺序学

“原始资料覆盖很全，但范围太大，里面有些是模型通识，有些是工程细节。对当前岗位，我更适合先把 Agent 应用研发主线捋顺，再补训练和部署。”

### 3. 怎么把它和你的项目挂钩

“我不会把这些当作独立知识点背，而是会和我自己的项目经历绑定，比如 Tool Use、Memory、Trace、Eval、Multi-Agent 这些在 JoyDeliver、Flow 和 Skill Factory 里都有对应场景。”

---

## 六、建议配套资料

如果你按这个主题线准备，建议同步搭配：

- [agent-basics-2026.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-basics-2026.md)
- [agent-advanced-2026-for-ai-apps.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-advanced-2026-for-ai-apps.md)
- [计算机网络面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/计算机网络面试题_QA整理.md)
- [flow-papago-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/internships/flow-papago-prep.md)
- [joydeliver-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/internships/joydeliver-prep.md)
- [skill-factory-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/skill-factory-prep.md)

---

## 七、最小准备标准

如果时间有限，至少做到：

- 能讲 `Tool Use / MCP / Skill`
- 能讲 `Memory`
- 能讲 `RAG`
- 能讲 `vLLM / KV Cache`
- 能讲 `SFT / LoRA / DPO / GRPO`
- 能讲 `Multi-Agent / Agentic Workflow / Trace / Eval`
