# 简历技能栏准备

这份文档只服务于 [2026_6.typ](/home/xxy/Chinese-Resume-in-Typst-main/2026_6.typ:91) 的技能栏，目标是把“会什么”转成“面试里怎么答”。

## 一、编程语言

简历内容：

- `Python (FastAPI/并发)`
- `Go (Eino)`
- `C++ (STL/Asio)`
- 熟练应用常用设计模式

准备重点：

- `Python`：重点讲 `FastAPI`、并发、工程效率
- `Python` 基础建议额外准备：浅拷贝 / 深拷贝、装饰器、上下文管理器、协程、`GIL`、垃圾回收
- `Go`：重点讲并发、工程结构、Eino 使用经验
- `C++`：只保留到你能稳定回答的粒度，不要主动拉太深
- `设计模式`：准备 2-3 个你在实际项目里确实能落地解释的模式

## 二、Agent 与 RAG

简历内容：

- `Agentic Workflow`
- 多级记忆管理
- `LangChain / Dify / Eino`
- `Milvus`
- `RAG` 优化

准备重点：

- `Agentic Workflow` 和普通 workflow 的区别
- 长短期记忆与共享隔离
- 你在哪些场景用过 `LangChain / Dify / Eino`
- `Milvus` 在向量检索里的角色
- `RAG` 可以从召回、重排、切分、评测四个方向讲

参考资料：

- [agent-basics-2026.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-basics-2026.md)
- [大模型应用开发面试题_QA整理.md](</home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/大模型应用开发面试题_QA整理.md>)

## 三、模型微调与 RL

简历内容：

- `SFT`
- `LoRA`
- `RLHF / DPO / GRPO`
- `vLLM / Ollama`

准备重点：

- `SFT` 是什么，作用是什么
- `LoRA` 为什么省资源
- `RLHF / DPO / GRPO` 的差异
- `vLLM` 为什么快
- `Ollama` 适合什么场景

参考资料：

- [大模型应用开发面试题_QA整理.md](</home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/大模型应用开发面试题_QA整理.md>)

## 四、后端与工程

简历内容：

- `TCP/IP`
- `MySQL (索引)`
- `Redis (分布式锁/缓存)`
- `Docker`
- `Git`
- `Linux`

准备重点：

- `MySQL`：索引、事务、锁
- `Redis`：分布式锁、缓存问题
- `TCP/IP`：三次握手、四次挥手、可靠传输
- `Docker / Linux`：部署、排障、环境隔离

参考资料：

- [fundamentals-review-order.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/fundamentals-review-order.md)

## 五、面试前简单回看

- 每一栏都准备一句定义
- 每一栏都准备一个你实际做过的例子
- 不熟的不要主动往深里引
