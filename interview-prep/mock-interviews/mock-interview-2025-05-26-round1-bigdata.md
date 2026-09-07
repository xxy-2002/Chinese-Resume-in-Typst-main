# 一面面试记录 — 2026年5月26日

**面试轮次：** 一面
**面试部门：** 大数据相关岗位
**核心方向：** Data Agent / NL2SQL / 大数据技术 / 大模型微调

---

## Q1: 自然语言生成SQL（NL2SQL / Data Agent）的语义层相关问题

### 问题拆解

面试官关注的核心是：**如何让自然语言准确映射到SQL查询**，以及在实际数据环境中遇到的语义问题。

### 语义层（Semantic Layer）是什么

语义层是位于用户自然语言和底层数据库之间的一层抽象映射。它的作用是：

- **业务术语 → 数据表/字段映射**：比如用户说"销售额"，语义层需要映射到 `SUM(order.amount) WHERE status = 'completed'`
- **消歧与规范化**：同一个业务概念在不同表中可能有不同名称
- **提供上下文约束**：告诉模型哪些表可以JOIN、哪些字段是主键/外键

### 常见语义问题

**1. 二义性（Ambiguity）**
- 同一个词在不同上下文含义不同：比如"客户"可能指 `customer` 表或 `user` 表
- "上个月"到底是自然月还是过去30天？
- 解决方案：通过 **Schema Linking** + **Few-shot Examples** 消歧，或者在语义层中定义明确的别名映射

**2. 语义混淆（Semantic Confusion）**
- 不同字段名表达相同含义：`revenue` vs `income` vs `sales_amount`
- 同一字段名在不同表中含义不同：`status` 在订单表和用户表中含义完全不同
- 解决方案：构建 **业务词汇表（Business Glossary）**，统一术语映射

**3. 数据治理相关问题**
- **数据质量**：NULL值、重复数据导致查询结果不一致
- **权限控制**：NL2SQL需要感知用户权限，不同角色能访问的表/字段不同
- **数据血缘**：当底层表结构变更时，语义层的映射需要同步更新
- **指标一致性**：同一个指标（如DAU）在不同系统中计算口径不同

### 实际技术方案

```
用户自然语言 → 意图识别 → Schema Linking → SQL生成 → SQL校验 → 执行
                  ↓              ↓
             语义层匹配      消歧 & 约束
```

- **Text-to-SQL 典型模型**：DIN-SQL, DAIL-SQL, C3SQL
- **语义层实现**：通常用 YAML/JSON 定义指标和维度的映射关系，配合向量检索做相似度匹配
- **Agent增强**：用 ReAct 或 multi-step agent 做多轮澄清，当查询意图不明确时主动追问

---

## Q2: 大数据相关技术简要了解

### 核心技术栈分层

```
┌─────────────────────────────────────────┐
│           数据应用层                      │
│   BI报表 / 数据产品 / ML / AI Agent      │
├─────────────────────────────────────────┤
│           数据服务层                      │
│   API Gateway / 数据服务 / 指标平台       │
├─────────────────────────────────────────┤
│           数据计算层                      │
│   Spark / Flink / Presto / Hive         │
├─────────────────────────────────────────┤
│           数据存储层                      │
│   HDFS / Iceberg / Hudi / Delta Lake    │
│   ClickHouse / Doris / StarRocks        │
├─────────────────────────────────────────┤
│           数据采集层                      │
│   Kafka / Flume / Canal / Debezium      │
├─────────────────────────────────────────┤
│           资源调度层                      │
│   YARN / K8s / Mesos                    │
└─────────────────────────────────────────┘
```

### 关键技术简述

| 技术 | 定位 | 核心特点 |
|------|------|----------|
| **Hadoop/HDFS** | 分布式存储 | 适合大批量离线数据，3副本容错 |
| **Spark** | 批处理引擎 | 内存计算，比MapReduce快10-100x，支持SQL/ML/图计算 |
| **Flink** | 流处理引擎 | 真正的流式计算，低延迟，支持事件时间和状态管理 |
| **Hive** | SQL-on-Hadoop | 将SQL翻译为MapReduce/Spark任务，适合离线分析 |
| **Kafka** | 消息队列 | 高吞吐、持久化，用于数据管道和事件流 |
| **ClickHouse** | OLAP数据库 | 列式存储，超快聚合查询，适合实时分析 |
| **Doris/StarRocks** | MPP数据库 | 实时数仓，支持高并发查询，兼容MySQL协议 |
| **Iceberg/Hudi** | 数据湖格式 | 支持ACID事务、时间旅行、schema evolution |

### 湖仓一体（Lakehouse）趋势

- 传统架构：数据湖（廉价存储） + 数仓（高性能查询） 分离 → 数据冗余、ETL链路长
- 湖仓一体：用 Iceberg/Hudi/Delta Lake 在数据湖上提供数仓能力
- 统一存储、统一计算、减少数据搬运

### 面试加分点

- 能说出 **Lambda 架构**（批+流）和 **Kappa 架构**（纯流）的区别
- 了解 **数据治理** 的核心：元数据管理、数据质量、数据安全、数据血缘
- 知道 **OLTP vs OLAP** 的本质区别

---

## Q3: Transformer架构是什么？存在什么问题？

### 架构概述

Transformer（Vaswani et al., 2017, "Attention Is All You Need"）的核心思想是用 **自注意力机制（Self-Attention）** 替代RNN/LSTM的序列建模方式。

```
输入序列 → Embedding + 位置编码
         → [Encoder] 多层 Self-Attention + FFN
         → [Decoder] Masked Self-Attention + Cross-Attention + FFN
         → 输出序列
```

### 核心组件

**1. Self-Attention 机制**
```
Attention(Q, K, V) = softmax(QK^T / √d_k) V
```
- Q（Query）、K（Key）、V（Value）是输入经过线性变换得到的
- 每个token都能直接关注到序列中的任何其他token
- `√d_k` 是缩放因子，防止点积过大导致softmax梯度消失

**2. Multi-Head Attention**
- 多组独立的QKV投影，每组关注不同的语义子空间
- 拼接后通过线性层合并

**3. 位置编码（Positional Encoding）**
- Transformer本身没有位置感知能力，需要额外注入位置信息
- 原始用正弦/余弦函数，现代用RoPE（旋转位置编码）等

**4. Feed-Forward Network (FFN)**
- 两层线性变换 + 激活函数（ReLU/GELU/SwiGLU）
- 提供非线性变换能力

### 存在的问题

**1. 计算复杂度 O(n^2)**
- Self-Attention需要计算每对token之间的注意力分数
- 序列长度翻倍，计算量翻4倍，显存翻4倍
- 长文本（100K+ tokens）处理非常昂贵

**2. 位置编码的外推问题**
- 训练时用固定长度，推理时超过训练长度效果急剧下降
- 虽然有ALiBi、RoPE+NTK等缓解方案，但根本问题未完全解决

**3. 缺乏真正的"推理"能力**
- Transformer本质是模式匹配，不是逻辑推理
- 链式推理（CoT）是近似方案，不是真正的符号推理

**4. 幻觉（Hallucination）**
- 模型会"编造"看起来合理但实际错误的内容
- 根因：训练数据中的统计相关性 ≠ 因果关系

**5. KV Cache 内存瓶颈**
- 自回归生成时需要缓存所有历史token的KV
- 长序列推理的显存开销巨大
- 催生了 GQA（Grouped Query Attention）、MQA、PagedAttention 等优化方案

**6. 训练不稳定**
- 深层Transformer容易出现训练loss spike
- 需要warmup、梯度裁剪等trick
- 大模型训练的容错和恢复机制很关键

---

## Q4: LoRA 中与 KQV 相关的原理

### LoRA 核心思想

LoRA（Low-Rank Adaptation）的核心假设：**微调时的权重变化矩阵是低秩的**。

```
原始权重: W ∈ R^(d×k)
微调更新: ΔW = B × A, 其中 B ∈ R^(d×r), A ∈ R^(r×k), r << min(d,k)

推理时: h = Wx + ΔWx = Wx + BAx
```

- 冻结原始权重 W，只训练 A 和 B
- 参数量从 d×k 降到 (d+k)×r，大幅减少可训练参数
- 推理时可以将 BA 合并回 W，零额外开销

### 与 KQV 的具体关系

在 Transformer 的注意力层中，有三个关键的线性投影：

```python
Q = X @ W_Q  # Query 投影
K = X @ W_K  # Key 投影
V = X @ W_V  # Value 投影
```

**LoRA 应用在 QKV 上的具体做法：**

```python
# 原始（冻结）
Q = X @ W_Q

# LoRA 微调（只训练 ΔW_Q = B_Q @ A_Q）
Q = X @ W_Q + X @ B_Q @ A_Q
# 即 Q = X @ (W_Q + B_Q @ A_Q)
```

**为什么选择对 QKV 做 LoRA？**

1. **QKV 是注意力的核心**：它们决定了"关注什么"和"关注多少"，是模型理解能力的关键
2. **参数效率高**：QKV投影矩阵通常较大（如4096×4096），LoRA可以用极少参数调整注意力模式
3. **任务适配性强**：不同任务需要模型关注不同的特征子空间，调整QKV的低秩分量就能实现

**LoRA 超参数选择：**

| 参数 | 典型值 | 说明 |
|------|--------|------|
| rank (r) | 8-64 | 越大表达能力越强，但参数越多 |
| alpha (α) | 16-64 | 缩放因子，实际更新 = (α/r) × BA |
| target modules | Q, K, V, O, gate, up, down | 通常至少覆盖QKV |

**α/r 的作用：**
- 实际的权重更新是 `ΔW = (α/r) × B × A`
- α 控制 LoRA 更新相对于原始权重的"力度"
- 一般设 α = 2r，即缩放系数为 2

### LoRA 变体

| 变体 | 特点 |
|------|------|
| **QLoRA** | 4-bit量化 + LoRA，大幅降低显存需求 |
| **DoRA** | 将权重分解为方向和幅度，分别做LoRA |
| **AdaLoRA** | 自适应分配不同层的rank |
| **LoRA+** | A和B使用不同学习率 |

### 面试答题框架

> "LoRA的核心思想是将微调的权重增量分解为两个低秩矩阵的乘积。具体到KQV，我们在Q、K、V的线性投影层旁边各加一个旁路 ΔW = BA，冻结原始W_Q/W_K/W_V只训练BA。这样做的好处是：1）参数量大幅减少；2）推理时可以合并，零开销；3）rank的选择控制了微调的表达能力与效率的trade-off。"

---

## Q5: 项目中与 Harness Agent 相关的例子

### 背景理解

Harness Agent 指的是在 AI Agent 框架中，**编排和调度多个工具/子代理（sub-agent）的协调层**。类似于 Claude Code 中的 agent harness，它负责：
- 工具选择和调度
- 多步任务的规划和执行
- 结果聚合和错误处理

### 项目示例一：GEPA — 自动优化 Harness

**项目名称：** GEPA (Generalized Evolutionary Prompt Architecture)

**核心思路：**
- 设计一个 **自进化 prompt 优化系统**，通过 harness agent 自动迭代优化提示词
- Harness agent 负责：生成候选 prompt → 评估 → 反馈 → 进化

**Agent 编排流程：**
```
用户目标 → Planner Agent（拆分子任务）
         → Generator Agent（生成候选prompt）
         → Evaluator Agent（评估效果，打分）
         → Mutator Agent（基于反馈变异优化）
         → 循环直到收敛
```

**Harness 的关键作用：**
1. **任务拆分**：将"优化一个prompt"拆解为生成-评估-变异的闭环
2. **状态管理**：维护每轮迭代的候选方案和评估分数
3. **终止条件**：设定收敛阈值和最大迭代次数
4. **容错处理**：某个agent失败时的重试和降级策略

### 项目示例二：Skill Factory — 自动技能提取系统

**项目名称：** Skill Factory

**核心思路：**
- 从历史对话中自动提取可复用的"技能"（skill）
- Harness agent 协调多个专门的 agent 完成技能发现、提取、验证

**Agent 编排流程：**
```
历史对话日志 → Discovery Agent（识别有价值的操作模式)
             → Extraction Agent（提取为结构化skill）
             → Validation Agent（在新场景中测试skill有效性）
             → Storage Agent（索引和存储到skill库）
```

**Harness 的关键作用：**
1. **Pipeline 编排**：串联多个agent形成完整的提取流水线
2. **质量门控**：validation agent 不通过则回退重新提取
3. **并发控制**：多个对话可以并行处理，harness管理并发
4. **反馈循环**：skill使用效果回传，驱动下一轮提取策略调整

### 通用 Agent Harness 设计模式

```
┌─────────────────────────────────────┐
│          Harness Controller         │
│  ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐  │
│  │Plan │→│Exec │→│Eval │→│Refine│  │
│  └─────┘ └─────┘ └─────┘ └─────┘  │
│       ↕           ↕         ↕      │
│  ┌─────────────────────────────┐   │
│  │      State Manager          │   │
│  │  (任务状态/上下文/历史)      │   │
│  └─────────────────────────────┘   │
│       ↕                             │
│  ┌─────────────────────────────┐   │
│  │      Tool Registry          │   │
│  │  (工具注册/调度/结果聚合)    │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
```

**回答要点：**
1. 强调 harness 不只是"调用agent"，而是 **状态管理 + 流程编排 + 质量控制**
2. 举具体例子说明 agent 之间的协作关系
3. 提到容错和并发等工程细节，体现工程能力

---

## 面试复盘总结

| 题目 | 难度 | 关键得分点 |
|------|------|-----------|
| Q1 NL2SQL语义层 | ⭐⭐⭐ | 能说出二义性/语义混淆的具体例子和解决方案 |
| Q2 大数据技术 | ⭐⭐ | 能画出技术栈分层，说出核心组件定位 |
| Q3 Transformer | ⭐⭐⭐ | Self-Attention公式 + 至少说出3个问题 |
| Q4 LoRA KQV | ⭐⭐⭐⭐ | 理解低秩分解 + QKV投影 + α/r的作用 |
| Q5 Harness Agent | ⭐⭐⭐ | 结合项目讲清楚agent编排和状态管理 |
