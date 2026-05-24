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
  *预计实习时长*：6个月，可立刻到岗
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

  参加*2025 腾讯游戏算法大赛*：数智决策科学赛道 (**Agent/Text2SQL**)，**全国排名 TOP 60**

  参加*2025 腾讯广告算法大赛*：全模态生成式推荐赛道，实战探索多模态 RAG 与生成式排序架构
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
  [ *AI智能体开发实习生* ],
  date[ 2026.03 – 至今 ],
  logo: "icons/JD.png",
)

- 参与 *ToB* 项目交付场景端到端智能体建设，覆盖需求、设计、开发、测试、交付等核心环节；基于业务流程进行任务建模、*Agent* 协作机制设计与流程链路优化，支撑交付流程智能化升级
- 参与交付提效类智能体应用开发，涉及知识库问答、交付可行性分析、标书生成、PPT 生成等场景；负责相关方案设计与功能实现，提升信息检索、分析生成及交付材料产出的效率

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
- *多智能体编排与治理* | 针对 *Supervisor-Worker* 模式开发无状态 *Validator* 提升*参数准确率*；研发 *Agent Overlap Analyzer*，利用 *TF-IDF* 量化职责重叠度以治理*意图漂移*；开发 *AgentSelector*，通过*强制 Tool Calling* 替代自然语言分类，极大增强极端场景下的*路由稳定性*
- *工程效能与成本优化* | 开发*端到端 LLM 自动化评估流水线*，支持 *Batch API* 与 * 断点续传 (Checkpoint)* 机制，使回归测试计算成本降低 *50%*；落地 *TOON 序列化协议*与*语义压缩技术*，显著降低线上全链路 *Token 消耗*
- *Lofty Agent Studio 平台开发* | 主导研发后端服务，基于 *AWS Cognito 与 Lambda* 实现免密 *SSO 鉴权*与 *Team 隔离*；设计并开发新的 *Workspace 级别通用接口*，支撑 *NLP 团队*将用户自定义智能体动态接入现有业务流
- *技术栈* : Java (JDK 21), Python, Spring Boot, FastAPI, Redis, AWS (Lambda/ECS/Cognito), MySQL, DynamoDB
#item(
  [ *Momenta* ],
  [ *CPM 实习生* ],
  date[ 2025.02 – 2025.06 ],
  logo: "icons/momenta图标2.png", // 在此处替换为你的 logo 实际路径
)

- 负责车型的 *6 个小版本* 冒烟测试与智驾功能联调，构建测试用例验证功能，确保数据闭环回流
- 独立完成 *上百台车辆* 的 ADC 软件 *OTA 部署*，熟练运用 *Linux/Shell* 指令处理大规模车端任务
- 掌握车端设备 (*IPC/IPD*) 远程调试与 *Docker* 环境配置；通过核心日志分析与标定文件管理，精准诊断智驾功能故障，支持自动驾驶路测迭代
== #fa-code 项目经历

#item(
  text(size: 11pt)[ *全栈即时通讯项目* ],
  [ *个人项目* ],
  date[ 2025.03 – 2025.07 ],
)

#tech[ C++, Qt, Boost.Asio, gRPC, MySQL, Redis ]

分布式即时通讯系统，采用 *gRPC* 微服务架构，设计自定义应用层协议，支持服务发现、断线重连与负载均衡，支持登录注册，好友管理、聊天通信、文件传输等核心功能

- 核心网络层基于 *Boost.Asio* 实现 **Reactor 高并发模型**，采用 *One Loop Per Thread* 策略与 *I/O Context 池*，单机压测消息延迟稳定在10ms以内，单服务器支持8000+稳定连接，多服务器可支持1W+活跃用户
- 构建分布式服务集群，*GateServer* 网关实现统一鉴权，*StatusServer* 采用 *一致性哈希* 算法进行节点调度，有效解决服务器扩缩容时的 *会话迁移* 与 *雪崩问题*
- 设计高可用数据存储方案，封装 *MySQL/Redis* 连接池，采用 **Cache-Aside** 模式与 **延时双删** 策略保障缓存一致性，引入 *gRPC* 实现服务间的高效低延迟通信
- 基于 *Qt* 开发仿微信桌面客户端，利用 **信号槽机制** 解耦 UI 与网络，封装 **TCP 粘包处理**，完整实现 **用户登录、好友管理、断点续传** 等业务模块

#item(
  text(size: 11pt)[ *GigaEinoAI —— 个人知识库智能助手* ],
  [ *个人项目* ],
  date[ 2025.07 – 2025.09 ],
)

#tech[ Go, Eino, Hertz, Milvus, MCP ]

基于 Go 语言开发的个人知识库智能助手，集成 *RAG* 技术与 *MCP* 协议，支持工具调用与长文本对话

- 基于 *Eino 框架* 编排大模型图模式，利用 *上下文压缩* 与 *前缀缓存* 机制支持长上下文，集成 MCP 实现联网搜索等工具调用
- 构建基于 *Milvus* 的 RAG 系统，支持多格式文档解析；通过 *混合检索、并行检索与重排序* 策略，显著提升问答准确率
- 使用 *Hertz 框架* 构建高性能 HTTP 服务，配置 *CORS* 中间件与流式响应接口，实现低延迟的 AI 对话交互


