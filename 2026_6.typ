#import "template.typ": *

// 主题颜色
#let theme-color = rgb("#003366")
#let icon = icon.with(fill: theme-color)

// 设置图标, 来源: https://fontawesome.com/icons/
#let fa-award = icon("icons/fa-award.svg")
#let fa-building-columns = icon("icons/fa-building-columns.svg")
#let fa-code = icon("icons/fa-code.svg")
#let fa-envelope = icon("icons/fa-envelope.svg")
#let fa-github = icon("icons/fa-github.svg")
#let fa-graduation-cap = icon("icons/fa-graduation-cap.svg")
#let fa-linux = icon("icons/fa-linux.svg")
#let fa-phone = icon("icons/fa-phone.svg")
#let fa-windows = icon("icons/fa-windows.svg")
#let fa-wrench = icon("icons/fa-wrench.svg")
#let fa-work = icon("icons/fa-work.svg")

// 设置简历选项与头部
#show: resume.with(
  // 字体和基准大小
  size: 8.8pt,
  // 标题颜色
  theme-color: theme-color,
  // 控制纸张的边距
  margin: (
    top: 0.2cm,
    bottom: 2cm,
    left: 1.5cm,
    right: 1.5cm,
  ),

  // 如果需要姓名及联系信息居中，请删除下面关于头像的三行参数，并取消header-center的注释
  //header-center: true,

  // 如果不需要头像，则将下面三行的参数注释或删除
  photograph: "照片.jpg",
  photograph-width: 8em,
  gutter-width: 0em,
)[
  = 薛旭阳

  #info(
    color: theme-color,
    (
      icon: fa-phone,
      content: "18636867960",
    ),
    (
      icon: fa-envelope,
      content: "18636867960@163.com",
      link: "mailto:18636867960@163.com",
    ),
    (
      icon: fa-building-columns,
      content: "微信号: xxy159357qaz",
    ),
  )
][  
  #v(1em)
  *预计实习时长*：3-6个月，可立刻到岗
]

== #fa-graduation-cap 教育背景

#sidebar(with-line: true, side-width: 18%)[
  2024.09 - 2027.06

  2020.09 - 2024.06

][
  #item(
  [ *华中科技大学* (985)],
  [研二在读（保研）],
  [   ]
  
)
  #item(
    [*郑州大学*(211)],
    [学士学位],
    [ ],
    
)
]
  #v(-0.1em)华中科技大学学业奖学金一等奖、郑州大学优秀学生奖学金二等奖、全国大学生数学建模竞赛省级二等奖

  参加*2025 腾讯游戏算法大赛*：数智决策科学赛道 (**DaTaAgent/Text2SQL**)，**全国排名 TOP 60**


== #fa-wrench 专业技能

#sidebar(with-line: true, side-width: 15%)[
  *编程语言*

  *Agent 与 RAG*

  *模型微调与 RL*

  *后端与工程*
][
  熟悉 *Python* (FastAPI/并发), *Go* (Eino), *C++* (STL/Asio); 熟练应用常用设计模式

  掌握 *Agentic Workflow* 开发与多级记忆管理; 熟练使用 *LangChain/Dify/Eino*; 熟悉 *Milvus* 与 *RAG* 优化

  熟悉 *SFT* 微调流程 (LoRA); 了解 *RLHF/DPO/GRPO* 等强化学习算法; 熟练掌握 *vLLM/Ollama* 高性能部署

  熟悉 *TCP/IP* 网络编程; 掌握 *MySQL* (索引) 与 *Redis* (分布式锁/缓存); 熟练使用 *Docker*, *Git*, *Linux*
]

== #fa-work 实习经历

#item(
  [ *京东* ],
  [ *AI应用全栈开发实习生* ],
  date[ 2026.03 – 至今 ],
  logo: "icons/JD.png",
)

- 负责 *JoyDeliver* *项目交付智能平台设计与开发*，面向 *ToB* 项目原始材料分散、需求变更频繁、上下文断裂与经验难复用等痛点，将需求定义、原型设计、方案设计、开发实施、测试验证构建为结构化Agent任务流；用户聚焦需求定义，平台驱动 *Agent* 执行、验证与交付闭环，并支持交付项目经验沉淀与复用，驱动平台能力自进化。并已支撑真实项目交付
- 开发底层 *Harness Agent* 服务与调度 *Runtime*为 JoyDeliver，提供稳定的 Agent执行、工具调用、上下文传递、状态流转、异常处理与 *Trace* 记录能力，提升长链路 *Agent* 任务的可观测性、可复现性与工程稳定性
- 设计基于 *Skill* 的 *Pipeline* 多智能体编排模型，将 *Agent / Skill / Pipeline* 抽象为平台一等执行单元，支持按业务场景组合需求分析、原型生成、方案生成、开发测试、结果审查等节点，沉淀可复用交付流水线

- 参与交付提效类智能体应用落地，支持知识库问答、交付可行性分析、标书生成、*PPT* 生成等场景

#item(
  [ *Moatable*#text(size: 0.85em, weight: "regular")[（原人人网）] ],
  [
    #grid(
      columns: (auto, auto, auto),
      gutter: 0.25em,
      align: horizon,
      [*AI 后端开发实习生* ·],
      image("icons/icon3.png", height: 1em),
      [Lofty AI 部门]
    )
  ],
  date[ 2025.09 – 2026.01 ],
  logo: "icons/公司ICON1.png", 
)

- *业务背景* : 参与 *Flow (Papago.ai)* 智能体平台开发，该平台通过为 *Lofty*、TruckerPath 等业务线提供核心 *AI 引擎*与运行时支持。负责 *Flow Core（业务管理层）* 与 *Flow Agent（AI 执行层）* 的开发，涵盖业务逻辑、Agent 开发等多个方面

- *多模型集成与分布式记忆架构* | 开发 *Model Adapter* 层适配 *Gemini* 与 *AWS Bedrock (Qwen)* 模型，实现全量功能接入；利用 *AsyncExitStack* 实现*连接池复用*，降低核心接口延迟 *20%*。研发 *Cortex 记忆中枢*，支持单/多 Agent 间的*记忆共享与逻辑隔离*；通过 *MemoryBuffer 异步缓冲*与 *Redis + Lua 分布式锁*，优化长效记忆质量并解决高并发竞争问题
- *多智能体编排与治理* | 针对 *Supervisor-Worker* 模式开发无状态 *Validator* 提升*参数准确率*；研发 *Agent Overlap Analyzer*，利用 *TF-IDF* 量化职责重叠度以治理*意图漂移*；开发 *AgentSelector*，通过*强制 Tool Calling* 增强极端场景下的*路由稳定性*
- *工程效能与成本优化* | 开发*端到端 LLM 自动化评估流水线*，支持 *Batch API* 与 * 断点续传 (Checkpoint)* 机制，使回归测试计算成本降低 *50%*；落地 *TOON 序列化协议*与*语义压缩技术*，显著降低线上全链路 *Token 消耗*
- *Lofty Agent Studio 平台开发* | 主导研发后端服务，基于 *AWS Cognito 与 Lambda* 实现免密 *SSO 鉴权*与 *Team 隔离*；设计开发新的 *Workspace 级别通用接口*，支撑 *NLP 团队*将用户自定义智能体动态接入现有业务流
- *技术栈* : Java (JDK 21), Python, Spring Boot, FastAPI, Redis, AWS (Lambda/ECS/Cognito), MySQL, DynamoDB
#item(
  [ *Momenta* ],
  [ *集成部署 实习生* ],
  date[ 2025.02 – 2025.06 ],
  logo: "icons/momenta图标2.png", // 在此处替换为你的 logo 实际路径
)

- 负责4车型的 *6 个小版本* 冒烟测试与智驾功能联调，构建测试用例验证功能，确保数据闭环回流
- 独立完成 *上百台车辆* 的 ADC 软件 *OTA 部署*，熟练运用 *Linux/Shell* 指令处理大规模车端任务
- 掌握车端设备 (*IPC/IPD*) 远程调试与 *Docker* 环境配置；通过核心日志分析诊断智驾功能故障，支持自动驾驶路测迭代
- 基于 *Dify* 搭建简单部署预约 *Agent*，支持车端部署任务预约与信息收集，提升部署协同效率
== #fa-code 项目经历

#item(
  text(size: 11pt)[ *Skill Factory —— 自评估闭环 Skill 测评优化平台* ],
  [ *个人项目* ],
  date[ 2026 上半年 ],
)

#tech[ Python, FastAPI, Docker, GEPA, Agent Evaluation, Trace ]

面向业务 *Agent* 的 *Skill* 生产、测评与优化平台，借鉴 *GEPA* 的“轨迹反思 + Genetic-Pareto 候选选择”与 *SkillRL/SkillFoundry* 的经验蒸馏、闭环验证思想，支持从业务真实 *case* 中生成、评估、优化可复用 *Skill*

- 设计可插拔 *Harness* 套件，支持指定 *Executor / Evaluator / Optimizer*，统一管理候选 *Skill*、评测集、指标配置与版本化回归结果，适配代码执行、工具调用、文档生成等多类任务
- 基于 *GEPA* 方法实现候选生成与迭代优化：采样 *Skill* 执行轨迹和工具调用结果，自动归因失败 *case*，生成 *prompt / spec / code* 候选，并通过 *Pareto Frontier* 保留多目标指标下的优势版本
- 构建 *Skill* 沙盒执行环境，隔离文件、网络、依赖和超时资源，记录 *step trace*、*tool call*、标准输出、产物差异与评估打分，支持失败复现、链路诊断和优化前后对比
- 打通业务 *Agent* 集成与 *case* 采集闭环，将线上/测试任务沉淀为优化样本；支持批量测评、回归对比与 *Skill* 发布门禁，形成类似 *SkillRL* 的“执行-评估-优化-再验证”自进化流程
