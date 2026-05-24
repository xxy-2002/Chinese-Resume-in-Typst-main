# Flow(Papago.ai) 面试准备

## 一、简历事实

对应简历位置：[2026_6.typ](/home/xxy/Chinese-Resume-in-Typst-main/2026_6.typ:126)

简历里已经写明的事实：

- 参与 `Flow (Papago.ai)` 智能体平台开发
- 负责 `Flow Core` 与 `Flow Agent` 开发
- 做过 `Model Adapter`，接入 `Gemini` 与 `AWS Bedrock (Qwen)`
- 用 `AsyncExitStack` 做连接池复用，降低核心接口延迟 `20%`
- 研发 `Cortex` 记忆中枢，支持单/多 Agent 记忆共享与逻辑隔离
- 用 `MemoryBuffer` 异步缓冲与 `Redis + Lua` 分布式锁处理高并发竞争
- 在 `Supervisor-Worker` 模式上开发无状态 `Validator`
- 做过 `Agent Overlap Analyzer` 和 `AgentSelector`
- 做过端到端 `LLM` 自动化评估流水线，使回归测试成本降低 `50%`
- 做过 `TOON` 序列化协议与语义压缩，降低全链路 `Token` 消耗
- 做过基于 `AWS Cognito + Lambda` 的免密 `SSO` 与 `Team` 隔离

## 二、现有资料的使用边界

已有材料：[flow（papago.ai）项目.md](</home/xxy/Chinese-Resume-in-Typst-main/interview-prep/internships/flow（papago.ai）项目.md>)

注意：

- 这份资料里混有不少“可做建议”与前沿方案，不都等同于你已完成的工作
- 面试时应以简历中已经写明的内容为主
- 资料适合作为延展思路，不适合直接当作事实复述

## 三、最值得讲的四条线

### 1. 多模型接入

重点：

- 为什么要做 `Model Adapter`
- 为什么要接 `Gemini` 和 `Bedrock(Qwen)`
- 适配层解决了什么问题

一句话表达：

“我做的不是简单换模型，而是把不同模型能力和调用差异收敛到统一适配层，让上层 Agent 逻辑尽量不感知底层模型差异。”

### 2. 记忆架构

重点：

- 为什么需要共享与隔离同时存在
- `Cortex` 的角色是什么
- `MemoryBuffer + Redis + Lua` 解决了什么并发问题

一句话表达：

“核心不是把记忆存下来，而是在多 Agent 并发场景下同时保证共享效率、隔离边界和一致性。”

### 3. 多智能体治理

重点：

- `Validator` 为什么做成无状态
- `Agent Overlap Analyzer` 为什么需要
- `AgentSelector` 如何帮助稳定路由

一句话表达：

“多 Agent 难点不在于能不能跑起来，而在于职责边界、参数正确率和复杂场景下的稳定路由。”

### 4. 评估与成本优化

重点：

- 自动化评估流水线解决了什么问题
- `Batch API + Checkpoint` 为什么能降成本
- `TOON + 语义压缩` 为什么能降 token 消耗

一句话表达：

“我做的不只是功能开发，还把评估和成本控制做成了工程能力，这样平台优化才有闭环。”

## 四、面试官可能会追问

- 为什么 `AsyncExitStack` 能降低延迟
- `Redis + Lua` 分布式锁为什么适合这个场景
- 多 Agent 共享记忆时最难的问题是什么
- `Validator` 的输入输出是什么
- `Overlap Analyzer` 为什么用 `TF-IDF`
- 自动化评估流水线的指标有哪些
- token 压缩和结果质量之间怎么平衡

## 五、面试前简单回看

- 简历里 Moatable 这 5 条经历各讲一遍
- 明确区分“我做过的”与“我能扩展讲的”
- 至少准备好下面 4 个关键词：
  - `Model Adapter`
  - `Cortex`
  - `Validator`
  - `LLM 自动化评估流水线`
