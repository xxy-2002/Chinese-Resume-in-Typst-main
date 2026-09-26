# 基础知识回看顺序

这份清单只保留和 `2026_6.typ` 简历强相关的基础知识方向，目标是面试前快速回看，而不是做系统性重学。

## 操作系统与网络融合速刷

如果时间有限，优先使用融合版：它把进程/线程、内存、I/O 多路复用、Socket、TCP、HTTP、TLS、DNS、SSE 和网络排障串成一条链路，每题都附有 **Key words**。

- [操作系统与计算机网络面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/操作系统与计算机网络面试题_融合精简版.md)

## 其他融合资料

按上一份资料的方式，其他基础方向也整理成“结论 → 原理 → 场景 → Key words”的精简问答：

- [编程语言与工程面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/编程语言与工程面试题_融合精简版.md)
- [MySQL 与 Redis 面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/MySQL与Redis面试题_融合精简版.md)
- [后端架构与系统设计面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/后端架构与系统设计面试题_融合精简版.md)
- [中间件与工程实践面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/中间件与工程实践面试题_融合精简版.md)
- [大模型与 Agent 面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/大模型与Agent面试题_融合精简版.md)
- [分布式与高可用面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/分布式与高可用面试题_融合精简版.md)

## 一、回看优先级

1. `Redis`
2. `MySQL`
3. `计算机网络`
4. `操作系统 / Linux`
5. `Agent 开发基础概念`
6. `Go`

## 二、Redis

必须回看：

- 分布式锁
- 缓存一致性
- 缓存雪崩、击穿、穿透
- 热 Key、大 Key
- Redis 为什么快

对应资料：

- [Redis面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Redis面试题_QA整理.md)
- [Redis面试题 _ 小林coding.pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Redis面试题%20_%20小林coding.pdf)

## 三、MySQL

必须回看：

- 索引分类
- 联合索引与最左前缀
- 回表与覆盖索引
- 事务隔离级别
- MVCC
- 锁

对应资料：

- [MySQL面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/MySQL面试题_QA整理.md)
- [MySQL面试题 _ 小林coding .pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/MySQL面试题%20_%20小林coding%20.pdf)

## 四、计算机网络

必须回看：

- TCP 三次握手
- TCP 四次挥手
- 可靠传输
- 拥塞控制
- HTTP 与 HTTPS
- TLS
- DNS
- 常见网络排障
- `SSE`
- `MCP` 的传输承载理解
- `ACP / A2A` 的定位理解
- AI 流式消息传输场景

对应资料：

- [计算机网络面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/计算机网络面试题_QA整理.md)
- [计算机网络面试题 _ 小林coding.pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/计算机网络面试题%20_%20小林coding.pdf)

## 五、操作系统 / Linux

必须回看：

- 用户态与内核态
- 进程、线程、协程
- 上下文切换
- IO 多路复用
- epoll
- 零拷贝

对应资料：

- [操作系统面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/操作系统面试题_QA整理.md)
- [操作系统面试题 _ 小林coding .pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/操作系统面试题%20_%20小林coding%20.pdf)

## 六、Python

建议回看：

- 浅拷贝 / 深拷贝
- 装饰器
- 上下文管理器
- 协程 / asyncio
- GIL
- FastAPI
- 垃圾回收

对应资料：

- [Python面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Python面试题_QA整理.md)

## 七、Go

有余力再看：

- channel
- mutex
- sync.Map
- context
- GMP
- 内存逃逸
- GC

对应资料：

- [Golang面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Golang面试题_QA整理.md)
- [Golang面试题 _ 小林coding .pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Golang面试题%20_%20小林coding%20.pdf)

## 八、Agent 开发基础概念

这部分适合补充 2026 语境下较新的常用说法：

- `Harness`
- `Skill`
- `Runtime`
- `Trace`
- `Hook`
- `Eval`
- `Guardrail`
- `Sandbox`
- `Multi-Agent`
- `Agentic Workflow`

对应资料：

- [agent-basics-2026.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-basics-2026.md)
- [agent-advanced-2026-for-ai-apps.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-advanced-2026-for-ai-apps.md)

## 九、分布式与高可用（新增）

必须回看：

- 四维框架：服务发现、服务一致性、服务状态、服务通信
- CAP/BASE 理论 + 工程取舍
- 分布式锁（Redis SETNX + Lua）
- 缓存三兄弟（穿透/击穿/雪崩）
- 分布式事务方案对比
- Kafka 核心原理（不丢消息、积压处理、故障恢复）
- K8s 核心组件（Service/Deployment/StatefulSet/探针/HPA）
- 高可用手段（熔断/降级/限流/超时/重试）
- Flink vs Spark 定位和差异
- 数据管道 vs 业务系统核心区别

对应资料：

- [分布式与高可用面试题·融合精简版](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/分布式与高可用面试题_融合精简版.md)

## 十、最后速刷

在完整看完 `md` 之后，再拿这些资料做速刷：

- [MySQL_Redis_面试高频25题_AI播客文字稿.pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/MySQL_Redis_面试高频25题_AI播客文字稿.pdf)
- [MySQL_Redis_面试睡前播客复习_28问.pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/MySQL_Redis_面试睡前播客复习_28问.pdf)
- [播客复习稿_计算机基础与网络基础_融合版V2.pdf](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/播客复习稿_计算机基础与网络基础_融合版V2.pdf)

建议顺序：

- 先刷 5 个 `QA整理.md`
- 再用 3 个融合 PDF 做最后复盘
