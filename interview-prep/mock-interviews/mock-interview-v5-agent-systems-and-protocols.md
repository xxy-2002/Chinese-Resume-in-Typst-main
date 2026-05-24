# 模拟面试稿 V5：Agent 系统与协议版

这版专门训练 `Harness / Runtime / MCP / ACP / SSE / Trace / Eval` 这些系统层问题，适合你在项目主线已经比较顺之后深入补洞。

## 1. 你怎么理解 Harness、Runtime、Framework 这三个词的区别？

答题重点：

- Harness：执行底座
- Runtime：实际运行层
- Framework：更宽泛的开发框架概念

追问：

- 为什么你更喜欢用 Harness 这个词

## 2. Skill、Tool、Workflow 之间怎么区分？

答题重点：

- Tool：单个能力点
- Skill：可复用能力单元
- Workflow：任务组织方式

追问：

- 为什么 Skill 不等于 prompt

## 3. MCP 是什么？

答题重点：

- 外部能力标准化接入协议
- 不只是单函数调用

追问：

- 和普通 Tool Calling 的区别

## 4. ACP / A2A 是什么？

答题重点：

- Agent-to-Agent 通信协议
- 多 Agent 标准协作

追问：

- 和 MCP 的边界

## 5. 为什么 AI 应用里经常用 SSE？

答题重点：

- 流式输出
- 用户感知更快
- 和 HTTP 生态兼容

追问：

- 为什么不用 WebSocket

## 6. Trace 记录什么？为什么不能只看最终输出？

答题重点：

- 工具调用
- 中间状态
- handoff
- 错误与重试

追问：

- 为什么不能把所有 trace 全喂给模型

## 7. Eval 为什么在 Agent 场景里更难？

答题重点：

- 不只是看最终答案
- 还要看链路
- 还要看回归

追问：

- dev / holdout / regression 的区别

## 8. 你在生产环境里最担心 Agent 的什么问题？

答题重点：

- 不稳定
- 路由错
- 工具错
- 成本高
- 长尾延迟

追问：

- 怎么排障

## 9. 多 Agent 最难的不是哪一步？

答题重点：

- 不是 spawn 数量
- 是协作边界、状态同步、路由稳定性

## 10. 如果让你设计一个平台级 Agent 系统，你最先会设计哪三件事？

答题重点：

- 执行底座
- 可观测性
- 评测闭环
