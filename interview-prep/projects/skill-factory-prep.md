# Skill Factory 面试准备

## 一、简历事实

对应简历位置：[2026_6.typ](/home/xxy/Chinese-Resume-in-Typst-main/2026_6.typ:162)

简历里已经写明的事实：

- 这是一个面向业务 `Agent` 的 `Skill` 生产、测评与优化平台
- 借鉴了 `GEPA` 的“轨迹反思 + Genetic-Pareto 候选选择”与 `SkillRL / SkillFoundry` 的闭环思路
- 支持从真实业务 case 中生成、评估、优化可复用 `Skill`
- 设计了可插拔 `Harness`
- 支持 `Executor / Evaluator / Optimizer`
- 管理候选 `Skill`、评测集、指标配置与版本化回归结果
- 基于 `GEPA` 做候选生成与迭代优化
- 构建了 `Skill` 沙盒执行环境
- 记录 `step trace`、`tool call`、标准输出、产物差异、评估打分
- 打通业务 Agent 集成与 case 采集闭环
- 支持批量测评、回归对比与 `Skill` 发布门禁

## 二、这个项目最该讲的价值

这个项目的重点不是“我做了一个 Agent 平台”，而是：

- 把 `Skill` 当成可生产、可评测、可优化、可发布的工程对象
- 把优化过程做成闭环
- 让 `Skill` 的改进不只靠经验，而是能靠 case、轨迹、指标和回归结果来驱动
- 把 `Skill` 优化进一步形式化成类似强化学习的闭环问题，但优化对象是 `SKILL.md` 这类自然语言指令，而不是模型权重

补充与深挖材料：

- [aboutskill.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/docs/aboutskill.md)
- [gepa-prep.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/gepa-prep.md)
- [skill-auto-optimization-harness-deep-dive.md](/home/xxy/Chinese-Resume-in-Typst-main/interview-prep/projects/skill-auto-optimization-harness-deep-dive.md)

这份补充材料里最值得吸收的点有两个：

- `Skill` 看起来像 prompt，但工程上更像 `Harness`
- `Skill` 的优化不该只是手工改 prompt，而应该是可迭代、可评测、可回滚、可选优的训练闭环

这里要明确区分：

- `aboutskill.md` 是他人的相关工作与方法参考
- 它和你的项目有相似痛点与相似方向
- 它可以作为你解释设计思路、行业趋势和方法论的参考
- 它不能直接替代你简历里的项目事实

## 三、推荐讲法

建议主线：

1. 为什么要做 `Skill Factory`
2. 一个 `Skill` 从哪里来
3. 怎么执行、怎么评测、怎么优化
4. 为什么需要 sandbox 和 trace
5. 怎么把线上或测试 case 回流进来

可以这样表达：

“这个项目我后来把它收束成了一个 `Skill Auto-Optimization Harness`。它面向的是 `SKILL.md` 这类 Agent Skill，不是优化模型参数，而是优化自然语言指令本身。核心是把 Skill 的执行、评估、反思、候选生成、验证和接受门控串成闭环。系统里我做了四角色分离：Pi 负责执行 Skill 产出 trace，Codex 负责评分和结构化反馈，DSPy 提供模块化编排框架，GEPA / TextGrad / OPRO 负责搜索候选变体。然后用多维 composite score 和 Pareto Frontier 做选优，再通过 validation、holdout、constraints、review 四重门控决定是否接受新版本。” 

如果你想讲得更完整，可以再补一句：

“我比较强调的一点是，这不是手工调 prompt，而是把 Skill 优化形式化成类似策略优化问题：执行轨迹是证据，评估结果是奖励，候选修改是策略更新，最后用门控和回归机制保证优化不会把系统越改越乱。”

## 四、真实实现里最值得讲的结构

### 1. 四角色分离架构

你可以直接讲成：

- `Pi`：执行器，负责真实运行 skill，产出 trace 和 artifacts
- `Codex`：评估器，负责评分、rubric 匹配和结构化反馈
- `DSPy`：框架层，负责模块化封装与优化流程编排
- `GEPA / TextGrad / OPRO`：优化器层，负责生成和搜索候选 skill

这个结构的价值是：

- 执行和评估分离
- 评估和优化分离
- 后续可以替换执行器、评估器和优化器

### 2. 闭环流程

建议讲成 8 个动作：

1. baseline `SKILL.md`
2. 在 train cases 上执行
3. 产出 traces
4. 结构化评分
5. 生成候选 skill
6. 在 validation + holdout 上验证
7. 通过 acceptance gate 判断接受还是拒绝
8. 接受则版本化保存，拒绝则保留为学习数据

### 3. 四重 Acceptance Gate

这是你很能体现工程意识的一点：

- validation 改善
- holdout 不回退
- constraints 通过
- review 通过

一句话表达：

“不是候选得分高就直接接收，而是必须经过验证、泛化、约束和审查四重门控。”

## 五、真实实现里最值得讲的模块

### 1. Rubric-Aware Evaluator

这个模块比“只做关键词匹配”更真实也更有说服力。

你可以讲：

- 原始 evaluator 太弱，只能做 keyword overlap
- 你实现了 5 层渐进匹配
- 包括 exact substring、stem、synonym、fuzzy match
- 还能解析 `must / must_not` 结构化 rubric

一句话表达：

“我把 evaluator 从‘对词’升级成了‘对规则和语义层次做渐进匹配’，这样它更像一个真实评估器，而不是粗糙打分器。”

### 2. Pareto 多维选择

这块要和 GEPA 一起讲。

你可以讲：

- 单个标量分数不够
- 需要同时看质量、效率、策略性等多个维度
- 所以系统里用了动态扩展的 `composite_score`
- 再用 `Pareto Frontier` 做候选选取

### 3. 多优化器支持

这也是很强的工程点：

- `GEPA`
- `TextGrad`
- `OPRO`

你可以讲：

- 不是把优化绑定死在一个算法上
- 而是把优化器做成可替换组件
- 不同优化器的候选生成方式不同，但都接入同一套 harness 执行与评估闭环

### 4. Skill Bank

这里可以讲你受 `SkillRL` 启发的两层技能库：

- `S_g`：通用 skill
- `S_t`：任务级 skill

重点不在背名字，而在于说明：

- 经验可以跨任务蒸馏
- 任务级启发式可以保留下来
- Skill 优化不是每次从零开始

### 5. Curriculum Learning

你可以讲：

- 按 case 难度做调度
- 先 easy，再 medium，再 hard
- 让优化过程更稳、更快收敛

### 6. Constraint Gates

这块能体现你不是只追求“改出更高分”，还在控制系统失控：

- 非空 body
- 长度约束
- 增长比例约束
- frontmatter 结构约束
- trigger boundary 约束

### 7. Trace 诊断

这个点和你的简历经历非常一致。

可讲法：

“核心不是只看总分，而是保留原始执行 trace。这样下一轮优化不是拍脑袋改，而是基于具体 case、具体工具调用和具体失败路径做诊断，知道为什么错、该改哪里、改完应该影响什么。”

## 六、可以明确拿来讲的数据点

这些数据很适合在面试里当“我不是只做概念设计”的证据：

- `24` 个 benchmark cases：8 train + 8 validation + 8 holdout
- `6` 个评估维度：trigger / procedure / grounding / constraint / generalization / composition
- baseline：`0.39` aggregate，`2/24` passed
- candidate：`0.58` aggregate，`9/24` passed，`0 regressions`
- 总提升：`+0.19`

你也可以再择机讲这些：

- `19` 轮自进化
- `0` 次崩溃
- `0` 次回滚
- 测试用例从 `17` 扩到 `31`
- `71/71` 检查点通过
- 一个真实业务 skill 候选压缩后，召回率从 `86%` 拉到 `98.67%`

## 七、研究定位与差异化怎么讲

你这部分已经不只是“做了个工具”，而是能讲成一条研究故事：

- 把 GEPA 看成退化的 policy gradient
- 引入 batching / replay / curriculum / Pareto
- 研究 harness 层如何影响 skill 优化收敛

建议表达：

“我不是只想做一个能跑的优化器，而是想把 Skill 优化这件事形式化地讲清楚：执行器、评估器、优化器和数据调度这些 harness 层设计，会怎样影响优化效果和收敛行为。”

## 八、面试官最可能追问的点

- 为什么要做四角色分离
- Pi / Codex / DSPy / GEPA 分别负责什么
- RubricEvaluator 比 keyword evaluator 强在哪里
- 为什么 benchmark 要分 train / validation / holdout
- 6 个维度怎么来的
- 为什么不用单一分数
- 为什么 `Harness` 要可插拔
- `Executor / Evaluator / Optimizer` 分别负责什么
- `GEPA` 在你的系统里具体怎么落地
- 为什么要做 `Pareto Frontier`
- 为什么 `trace` 比摘要或总分更重要
- sandbox 具体隔离了哪些资源
- TextGrad / OPRO 为什么也值得做
- Skill Bank 为什么有价值
- Curriculum 为什么能帮助优化
- 发布门禁怎么定义
- 这个项目和你实习里的平台经验有什么联系

## 九、简单回答方向

- `Harness`：
  统一不同任务类型的执行和评测接口，降低平台耦合

- `Pi`：
  真实执行 skill，产出 trace 和 artifacts

- `Codex Evaluator`：
  负责结构化评分和失败反馈，不只是简单比对关键词

- `DSPy`：
  负责把优化流程模块化封装，承载编排与 compile

- `GEPA / TextGrad / OPRO`：
  负责生成和搜索候选 skill 变体

- `RubricEvaluator`：
  让评估从“粗糙词匹配”变成“规则感知 + 多层匹配”

- `GEPA`：
  利用执行轨迹和 badcase 做候选生成，再通过多指标比较选择更优方案

- `Pareto Frontier`：
  避免只盯一个分数，兼顾成功率、成本、稳定性等目标

- `composite_score`：
  多维聚合用于排序与比较，但最终不完全依赖单一标量做决策

- `sandbox`：
  控制文件、网络、依赖和超时，保证执行安全且结果可复现

- `trace`：
  让失败能被复现，让优化前后能被比较

- `四重 Gate`：
  validation、holdout、constraints、review 缺一不可

- `curriculum`：
  让优化从简单 case 起步，降低前期噪声

- `failure replay`：
  让失败样本不被白白浪费，而是进入后续优化学习循环

## 十、你可以主动建立的关联

这个项目和实习经历可以连起来讲：

- 在实习里你接触了 `Agent` 平台、记忆、路由、评估、trace
- 在这个项目里你把这些工程经验收束到 `Skill` 闭环优化上
- 所以它不是孤立项目，而是你过往方向的自然延展

## 十一、表达边界

有一条要严格注意：

- 简历里已经写明的内容，可以当作你完成过的事实来讲
- 外部参考材料里的机制不要直接替换成你的项目事实
- 但你现在补充的架构、模块、benchmark 和结果，可以作为真实实现细节来讲

也就是说，面试时最好优先说：

- 我的项目目标是什么
- 我的真实系统怎么设计
- 我为什么这样设计

然后再补：

- 我怎样验证过它有效
- 它和现有方法相比改了什么

## 十二、面试前简单回看

- 能不看稿解释四角色分离架构
- 能不看稿解释闭环流程
- 能不看稿解释 RubricEvaluator
- 能不看稿解释 `GEPA`
- 能不看稿解释 Pareto 与 composite score
- 能不看稿解释为什么要 `sandbox + trace`
- 能不看稿讲 benchmark 数据
- 能说清“一个 Skill 从 case 到发布”的完整链路
