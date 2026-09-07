# Skill Auto-Optimization Harness 深挖问答版

这份文档专门服务 `Skill Factory / Skill Auto-Optimization Harness` 的深挖追问。

## 1. 你这个项目一句话到底是什么？

答：

“它是一个面向 AI Agent Skill 的自动优化框架，优化对象不是模型权重，而是 `SKILL.md` 这类自然语言能力描述。系统通过执行、评估、反思、变异、验证的闭环迭代改进 Skill。”

## 2. 它和普通 prompt 优化工具的本质差别是什么？

答：

“我把它做成了一个 harness，而不是一次性 prompt 改写器。核心不只是生成新文本，而是把执行证据、结构化评分、候选搜索、验证和接受门控串起来。”

## 3. 为什么你说 GEPA 是退化的 Policy Gradient？

答：

“因为在我的理解里，GEPA 已经具有策略优化的雏形：有候选生成、有评估反馈、有版本更新。但它缺 batching、credit assignment、failure replay 和更明确的训练式闭环，所以我说它更像退化版本的 policy gradient。”

## 4. 为什么要做四角色分离？

答：

“因为执行、评估、框架编排和优化器搜索这四类职责混在一起会导致系统难替换、难调试、难比较。我把它拆成 Pi、Codex、DSPy 和优化器层之后，不同执行器、不同 evaluator、不同 optimizer 可以独立替换和对比。”

## 5. RubricEvaluator 比关键词匹配强在哪里？

答：

“关键词匹配只能知道有没有出现某些词，但不知道规则是否真的满足。我做的 RubricEvaluator 会解析 `must / must_not` 结构，还做 exact、stem、synonym、fuzzy 这些多层匹配，所以更像一个能理解约束的评估器。”

## 6. 为什么 benchmark 要分 train / validation / holdout？

答：

“因为只看 train 会过拟合，只看 validation 不够稳，只看最终分数又看不到泛化。train 用来驱动优化，validation 用来判断当前候选是不是有效，holdout 用来防止表面变好但真实泛化变差。”

## 7. 为什么不用单一总分？

答：

“因为 Skill 优化天然是多目标问题。只看单一总分会掩盖一些退化，比如成功率上升但成本失控，或者局部提升但回归变坏。所以我会保留多维 composite_score，再用 Pareto Frontier 做候选筛选。”

## 8. TextGrad 和 OPRO 为什么也要做？

答：

“因为我不想把优化器绑死在一个方法上。GEPA、TextGrad、OPRO 的候选生成逻辑不同，把它们都接进同一套 harness 后，系统才能真正比较不同优化策略在同一任务上的表现。”

## 9. Skill Bank 的价值是什么？

答：

“它让系统不是每次从零开始优化。通用 skill 可以跨任务复用，任务级 skill 可以保留局部启发式，这样优化过程更像持续积累能力，而不是一次性 patch。”

## 10. 你这个项目最能打动面试官的地方是什么？

答：

“不是我做了多少模块，而是我把 Skill 优化这件事从‘手工调 prompt’推进成了一个可以执行、评估、反思、比较、验证和选优的工程闭环，而且我有 benchmark、门控和结果数据去证明它真的有效。”
