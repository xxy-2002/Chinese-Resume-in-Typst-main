# 3 天面试准备清单

目标岗位：

- `AI应用研发工程师`
- `淘天集团-商业智能&决策支持-商业智能&决策支持`

面试时间：

- `2026-05-26` 晚上

目标不是把所有知识重新学一遍，而是做到：

- 你的简历内容都能稳定讲
- 重点项目能抗追问
- 基础知识覆盖到岗位高频
- Agent 新概念和行业说法能讲得自然

## 一、总体策略

这 3 天按下面原则准备：

- `项目 > 岗位贴合 > 基础知识 > 前沿补充 > 教育`
- 先保证你能讲，再补足你能答
- 深度分成三档：
  - `A 档`：必须能展开 3-5 分钟，并能扛追问
  - `B 档`：必须能讲 1-2 分钟，有基本追问准备
  - `C 档`：知道定义、价值和和你项目的关系即可

## 二、你要准备什么，准备多久，准备多深

### 1. JoyDeliver

- 时间：`3.5 小时`
- 深度：`A 档`
- 要求：
  - 能完整讲业务背景
  - 能讲 `Harness / Runtime / Skill / Pipeline`
  - 能讲 2 个应用场景
  - 能回答和 Dify / Coze / LangGraph 的差异

资料：

- [joydeliver-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/internships/joydeliver-prep.md)

### 2. Flow(Papago.ai)

- 时间：`4 小时`
- 深度：`A 档`
- 要求：
  - 能完整讲多模型接入
  - 能讲 `Cortex`、共享与隔离
  - 能讲 `Redis + Lua`、`Validator`、`AgentSelector`
  - 能讲评估流水线和成本优化

资料：

- [flow-papago-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/internships/flow-papago-prep.md)

### 3. Skill Factory

- 时间：`4.5 小时`
- 深度：`A 档`
- 要求：
  - 能完整讲项目目标
  - 能讲 `Harness / Executor / Evaluator / Optimizer`
  - 能讲 `GEPA / Pareto Frontier / sandbox / trace`
  - 能讲为什么它不是普通 prompt 优化
  - 能区分项目事实和参考工作

资料：

- [skill-factory-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/skill-factory-prep.md)
- [aboutskill.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/docs/aboutskill.md)

### 4. Agent 基础概念

- 时间：`2 小时`
- 深度：`B 档`
- 要求：
  - `Harness`
  - `Skill`
  - `Runtime`
  - `Trace`
  - `Hook`
  - `Eval`
  - `Sandbox`
  - `Multi-Agent`

资料：

- [agent-basics-2026.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-basics-2026.md)

### 5. Agent 前沿与训练优化

- 时间：`2 小时`
- 深度：`B 档`
- 要求：
  - 知道 `Hook` 为什么重要
  - 知道 `Trace-first eval`
  - 知道 `Agent Lightning`
  - 知道 `TRACE`
  - 知道这些方法为什么对业务应用有意义

资料：

- [agent-advanced-2026-for-ai-apps.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/agent-advanced-2026-for-ai-apps.md)

### 6. Redis

- 时间：`2 小时`
- 深度：`A- / B+`
- 要求：
  - 分布式锁
  - 缓存一致性
  - 雪崩 / 击穿 / 穿透
  - 热 Key / 大 Key
  - Redis 为什么快

资料：

- [Redis面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Redis面试题_QA整理.md)

### 7. MySQL

- 时间：`2 小时`
- 深度：`A- / B+`
- 要求：
  - 索引分类
  - 联合索引和最左前缀
  - 回表和覆盖索引
  - 事务隔离级别
  - MVCC
  - 锁

资料：

- [MySQL面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/MySQL面试题_QA整理.md)

### 8. 计算机网络

- 时间：`1.5 小时`
- 深度：`B+`
- 要求：
  - TCP 三次握手
  - TCP 四次挥手
  - 可靠传输
  - HTTP / HTTPS
  - TLS

资料：

- [计算机网络面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/计算机网络面试题_QA整理.md)

### 9. 操作系统 / Linux

- 时间：`1 小时`
- 深度：`B`
- 要求：
  - 进程 / 线程 / 协程
  - IO 多路复用
  - epoll
  - 零拷贝

资料：

- [操作系统面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/操作系统面试题_QA整理.md)

### 10. 手撕题

- 时间：`1.5 小时`
- 深度：`B- / C+`
- 要求：
  - 能识别高频题型
  - 能写出标准框架
  - 能说清时间复杂度

资料：

- [leetcode-handwriting-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/general/leetcode-handwriting-prep.md)
- [Interview_Prep_Final.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/general/Interview_Prep_Final.md)

### 11. Go

- 时间：`1 小时`
- 深度：`C+`
- 要求：
  - channel
  - context
  - GMP
  - GC

资料：

- [Golang面试题_QA整理.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/fundamentals/Golang面试题_QA整理.md)

### 12. Momenta

- 时间：`40 分钟`
- 深度：`C / B-`
- 要求：
  - 知道这段经历的定位
  - 能讲 `OTA / 日志排障 / Dify Agent`

资料：

- [momenta-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/internships/momenta-prep.md)

### 13. 教育 / 奖项 / 竞赛

- 时间：`30 分钟`
- 深度：`C`
- 要求：
  - 1 分钟内讲完
  - 腾讯比赛能简单展开

资料：

- [education-and-competition-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/education/education-and-competition-prep.md)

## 三、3 天倒排安排

### Day 1：项目主线打牢

总时长建议：`8-9 小时`

1. `JoyDeliver`：2 小时
2. `Flow`：2.5 小时
3. `Skill Factory`：3 小时
4. 晚上口述复盘：1-1.5 小时

Day 1 目标：

- 三个核心项目都能不看稿讲主线
- 每个项目至少准备 5 个追问

### Day 2：基础知识与岗位贴合

总时长建议：`7-8 小时`

1. `Redis`：2 小时
2. `MySQL`：2 小时
3. `网络`：1.5 小时
4. `Agent 基础概念`：1 小时
5. `Agent 前沿与训练优化`：1 小时
6. `手撕题`：1-1.5 小时

Day 2 目标：

- 能把基础知识和你的项目经历连起来答
- 能自然解释 `Harness / Skill / Hook / Trace / Eval`

### Day 3：模拟面试与补洞

总时长建议：`6-7 小时`

1. 模拟稿 V1：1.5 小时
2. 模拟稿 V2：1.5 小时
3. 模拟稿 V3：1.5 小时
4. 查漏补缺：1 小时
5. `Momenta + 教育 + Go + OS`：1-1.5 小时

Day 3 目标：

- 能连续做 3 轮模拟问答
- 追问下不容易卡壳
- 留下最后一版自己的简洁回答

## 四、面试当天

如果 `2026-05-26` 白天还有时间，只做这些：

- `JoyDeliver` 20 分钟
- `Flow` 20 分钟
- `Skill Factory` 25 分钟
- `Redis / MySQL / 网络` 20 分钟
- `Harness / Skill / Hook / Trace` 15 分钟

不要再开新资料。

## 五、最低完成标准

到面试前，至少要做到：

1. 三个核心项目都能讲 3-5 分钟
2. `Harness / Skill / Hook / Trace / Eval` 都能一句话定义
3. `Redis / MySQL / 网络` 的高频问题都能答
4. 能做至少 2 轮完整模拟面试
