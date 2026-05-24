---
AIGC:
    ContentProducer: Minimax Agent AI
    ContentPropagator: Minimax Agent AI
    Label: AIGC
    ProduceID: 4d25c9e4fe3c462eb0a2b83156dd7847
    PropagateID: 4d25c9e4fe3c462eb0a2b83156dd7847
    ReservedCode1: 304402201ec6ed81a105cb10f7135b7da523683016cd7617743d17e1a730a2d4d05ceb31022067ad676d94a327322459293668c434bcbb1bb757774f72289a72bbf44e68bfc6
    ReservedCode2: 304502205d479a317a1a86a40d3a4319086f6bbf2f471c8456c33eec6e0ca05cb838f12c022100f415b43e1412ab81618aa4ba562f88ccbbe506e9533f8e5f851207f185bc88af
---

# LeetCode Hot 100 面试快速复习手册（Go语言版）

> **复习目标**：在周一前掌握核心思维模型、常用语法工具、标准代码框架。
> **复习方法**：背诵思维引导 → 数据结构 → 代码实现的闭环。
> **作者**：Matrix Agent

---

## 评分系统说明

- **掌握程度 (Mastery)**: 1-10分，评估你对该题解法的熟练程度
- **考频 (Frequency)**: 1-10分，评估该题在面试中出现的频率
- 优先级 = 掌握程度 × 考频率，数值越大越需要优先复习

---

## 目录

### 第一部分：Go语言面试核心语法速查
- [1.1 数组与切片（Slice）](#11-数组与切片-slice)
- [1.2 哈希表（Map）](#12-哈希表-map)
- [1.3 队列与栈](#13-队列与栈)
- [1.4 常用标准库函数](#14-常用标准库函数)
- [1.5 递归与匿名函数](#15-递归与匿名函数)
- [1.6 指针与结构体](#16-指针与结构体)

### 第二部分：核心算法框架
- [2.1 二分查找框架](#21-二分查找框架)
- [2.2 双指针框架](#22-双指针框架)
- [2.3 回溯框架](#23-回溯框架)
- [2.4 动态规划框架](#24-动态规划框架)
- [2.5 BFS/DFS框架](#25-bfsdfs框架)
- [2.6 单调栈框架](#26-单调栈框架)

### 第三部分：Hot 100 题目详细整理

#### 3.1 哈希表类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [1. 两数之和](#1-两数之和leetcode-1---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐ | 50 |
| [49. 字母异位词分组](#49-字母异位词分组leetcode-49---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 28 |
| [128. 最长连续序列](#128-最长连续序列leetcode-128---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |

#### 3.2 双指针类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [283. 移动零](#283-移动零leetcode-283---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [11. 盛最多水的容器](#11-盛最多水的容器leetcode-11---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [15. 三数之和](#15-三数之和leetcode-15---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 40 |
| [42. 接雨水](#42-接雨水leetcode-42---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |

#### 3.3 滑动窗口类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [3. 无重复字符的最长子串](#3-无重复字符的最长子串leetcode-3---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [438. 找到字符串中所有字母异位词](#438-找到字符串中所有字母异位词leetcode-438---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |

#### 3.4 子串类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [560. 和为 K 的子数组](#560-和为-k-的子数组leetcode-560---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [239. 滑动窗口最大值](#239-滑动窗口最大值leetcode-239---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [76. 最小覆盖子串](#76-最小覆盖子串leetcode-76---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |

#### 3.5 普通数组类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [53. 最大子数组和](#53-最大子数组和leetcode-53---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [56. 合并区间](#56-合并区间leetcode-56---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [189. 轮转数组](#189-轮转数组leetcode-189---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |
| [238. 除自身以外数组的乘积](#238-除自身以外数组的乘积leetcode-238---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [41. 缺失的第一个正数](#41-缺失的第一个正数leetcode-41---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |

#### 3.6 矩阵类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [73. 矩阵置零](#73-矩阵置零leetcode-73---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |
| [54. 螺旋矩阵](#54-螺旋矩阵leetcode-54---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [48. 旋转图像](#48-旋转图像leetcode-48---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |
| [240. 搜索二维矩阵 II](#240-搜索二维矩阵-iileetcode-240---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |

#### 3.7 链表类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [160. 相交链表](#160-相交链表leetcode-160---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [206. 反转链表](#206-反转链表leetcode-206---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [141. 环形链表](#141-环形链表leetcode-141---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [142. 环形链表 II](#142-环形链表-iileetcode-142---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [21. 合并两个有序链表](#21-合并两个有序链表leetcode-21---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [2. 两数相加](#2-两数相加leetcode-2---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [19. 删除链表的倒数第 N 个节点](#19-删除链表的倒数第-n-个节点leetcode-19---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [234. 回文链表](#234-回文链表leetcode-234---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [24. 两两交换链表中的节点](#24-两两交换链表中的节点leetcode-24---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [25. K 个一组翻转链表](#25-k-个一组翻转链表leetcode-25---困难) | ⭐⭐⭐ | ⭐⭐⭐ | 9 |
| [138. 随机链表的复制](#138-随机链表的复制leetcode-138---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [148. 排序链表](#148-排序链表leetcode-148---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [23. 合并 K 个升序链表](#23-合并-k-个升序链表leetcode-23---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [146. LRU 缓存](#146-lru-缓存leetcode-146---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 28 |

#### 3.8 二叉树类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [94. 二叉树的中序遍历](#94-二叉树的中序遍历leetcode-94---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [104. 二叉树的最大深度](#104-二叉树的最大深度leetcode-104---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 30 |
| [226. 翻转二叉树](#226-翻转二叉树leetcode-226---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [101. 对称二叉树](#101-对称二叉树leetcode-101---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [543. 二叉树的直径](#543-二叉树的直径leetcode-543---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |
| [102. 二叉树的层序遍历](#102-二叉树的层序遍历leetcode-102---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [108. 将有序数组转换为二叉搜索树](#108-将有序数组转换为二叉搜索树leetcode-108---简单) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |
| [98. 验证二叉搜索树](#98-验证二叉搜索树leetcode-98---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [230. 二叉搜索树中第 K 小的元素](#230-二叉搜索树中第-k-小的元素leetcode-230---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [199. 二叉树的右视图](#199-二叉树的右视图leetcode-199---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [114. 扁平化二叉树为链表](#114-扁平化二叉树为链表leetcode-114---中等) | ⭐⭐⭐ | ⭐⭐⭐ | 9 |
| [105. 从前序和中序遍历序列构造二叉树](#105-从前序和中序遍历序列构造二叉树leetcode-105---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [437. 路径总和 III](#437-路径总和-iiileetcode-437---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [236. 二叉树的最近公共祖先](#236-二叉树的最近公共祖先leetcode-236---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 28 |
| [124. 二叉树中的最大路径和](#124-二叉树中的最大路径和leetcode-124---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 15 |

#### 3.9 图论与回溯类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [200. 岛屿数量](#200-岛屿数量leetcode-200---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [994. 腐烂的橘子](#994-腐烂的橘子leetcode-994---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [46. 全排列](#46-全排列leetcode-46---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 40 |
| [78. 子集](#78-子集leetcode-78---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [17. 电话号码的字母组合](#17-电话号码的字母组合leetcode-17---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [39. 组合总和](#39-组合总和学习leetcode-39---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [22. 括号生成](#22-括号生成leetcode-22---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [79. 单词搜索](#79-单词搜索leetcode-79---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [131. 分割回文串](#131-分割回文串leetcode-131---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [51. N 皇后](#51-n-皇后leetcode-51---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |

#### 3.10 二分查找类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [35. 搜索插入位置](#35-搜索插入位置leetcode-35---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [74. 搜索二维矩阵](#74-搜索二维矩阵leetcode-74---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 16 |
| [34. 在排序数组中查找元素的第一个和最后一个位置](#34-在排序数组中查找元素的第一个和最后一个位置leetcode-34---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [33. 搜索旋转排序数组](#33-搜索旋转排序数组leetcode-33---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [153. 寻找旋转排序数组中的最小值](#153-寻找旋转排序数组中的最小值leetcode-153---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [4. 寻找两个正序数组的中位数](#4-寻找两个正序数组的中位数leetcode-4---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 15 |

#### 3.11 栈与堆类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [20. 有效的括号](#20-有效的括号leetcode-20---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [155. 最小栈](#155-最小栈leetcode-155---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [394. 字符串解码](#394-字符串解码leetcode-394---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [739. 每日温度](#739-每日温度leetcode-739---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [84. 柱状图中最大的矩形](#84-柱状图中最大的矩形leetcode-84---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [215. 数组中的第 K 个最大元素](#215-数组中的第-k-个最大元素leetcode-215---中等) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [347. 前 K 个高频元素](#347-前-k-个高频元素leetcode-347---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [295. 数据流的中位数](#295-数据流的中位数leetcode-295---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |

#### 3.12 贪心算法类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [121. 买卖股票的最佳时机](#121-买卖股票的最佳时机leetcode-121---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐⭐ | 50 |
| [122. 买卖股票的最佳时机 II](#122-买卖股票的最佳时机-iileetcode-122---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [55. 跳跃游戏](#55-跳跃游戏leetcode-55---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [45. 跳跃游戏 II](#45-跳跃游戏-iileetcode-45---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [763. 划分字母区间](#763-划分字母区间leetcode-763---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |

#### 3.13 动态规划类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [70. 爬楼梯](#70-爬楼梯leetcode-70---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [198. 打家劫舍](#198-打家劫舍leetcode-198---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 24 |
| [279. 完全平方数](#279-完全平方数leetcode-279---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [322. 零钱兑换](#322-零钱兑换leetcode-322---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [139. 单词拆分](#139-单词拆分leetcode-139---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [300. 最长递增子序列](#300-最长递增子序列leetcode-300---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 28 |
| [152. 乘积最大子数组](#152-乘积最大子数组leetcode-152---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [416. 分割等和子集](#416-分割等和子集leetcode-416---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [32. 最长有效括号](#32-最长有效括号leetcode-32---困难) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [1143. 最长公共子序列](#1143-最长公共子序列leetcode-1143---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [72. 编辑距离](#72-编辑距离leetcode-72---困难) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐ | 28 |
| [5. 最长回文子串](#5-最长回文子串leetcode-5---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |

#### 3.14 技巧类题目
| 题目 | 掌握程度 | 考频 | 优先级 |
|------|---------|------|--------|
| [136. 只出现一次的数字](#136-只出现一次的数字leetcode-136---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐⭐ | 45 |
| [169. 多数元素](#169-多数元素leetcode-169---简单) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐⭐⭐ | 35 |
| [75. 颜色分类](#75-颜色分类leetcode-75---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |
| [287. 寻找重复数](#287-寻找重复数leetcode-287---中等) | ⭐⭐⭐ | ⭐⭐⭐⭐ | 12 |
| [31. 下一个排列](#31-下一个排列leetcode-31---中等) | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 20 |

---

## 第一部分：Go语言面试核心语法速查

### 1.1 数组与切片（Slice）

**初始化方式：**

```go
// 声明并初始化
s := []int{1, 2, 3, 4, 5}

// make创建指定长度和容量的切片
s := make([]int, 0, 10)  // 长度0，容量10
s := make([]int, 5)      // 长度5，容量5，初始值为[0 0 0 0 0]

// 从数组或切片截取
arr := [5]int{1, 2, 3, 4, 5}
s := arr[1:3]  // [2 3]，左闭右开区间
```

**核心操作：**

```go
// 追加元素（返回新切片）
s = append(s, 6)           // 追加单个元素
s = append(s, 7, 8, 9)     // 追加多个元素
s = append(s, t...)        // 追加另一个切片的所有元素

// 排序
sort.Ints(s)                // 对int切片升序排序
sort.Slice(s, func(i, j int) bool {
    return s[i] < s[j]     // 升序
})

// 查找
sort.SearchInts(s, 5)       // 返回5应该插入的位置
```

**面试高频考点：**
- 切片的扩容机制
- 切片截取与原数组共享底层数组
- nil切片与空切片的区别

### 1.2 哈希表（Map）

**基本操作：**

```go
// 初始化
m := make(map[int]int)              // int->int的映射
m := map[string]int{"a": 1, "b": 2} // 字面量初始化

// 插入/更新
m[key] = value

// 查找（Go独特的两返回值语法）
val, ok := m[key]                   // ok为true表示key存在

// 删除
delete(m, key)                      // 如果key不存在，什么都不发生
```

**并发安全：**

```go
// Go的map不是并发安全的
// 解决方案：sync.Map 或 互斥锁
var m sync.Map
m.Store(key, value)      // 存储
m.Load(key)              // 读取
```

### 1.3 队列与栈

**栈实现（后进先出）：**

```go
type Stack struct {
    data []int
}

func (s *Stack) Push(x int) {
    s.data = append(s.data, x)
}

func (s *Stack) Pop() int {
    x := s.data[len(s.data)-1]
    s.data = s.data[:len(s.data)-1]
    return x
}
```

### 1.4 常用标准库函数

```go
import "sort"
import "strings"

// 字符串操作
strings.Fields("a b c")           // 分割
strings.Split("a,b,c", ",")       // 分割
strings.Join([]string{"a", "b"}, "-") // 连接

// 排序
sort.Ints(nums)
sort.Slice(s, func(i, j int) bool { return s[i] < s[j] })
```

---

## 第二部分：核心算法框架

### 2.1 二分查找框架

```go
func binarySearch(nums []int, target int) int {
    left, right := 0, len(nums)-1
    for left <= right {
        mid := left + (right-left)/2  // 防止溢出
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}
```

### 2.2 双指针框架

**快慢指针：**

```go
func moveZeroes(nums []int) {
    slow := 0
    for fast := 0; fast < len(nums); fast++ {
        if nums[fast] != 0 {
            nums[slow] = nums[fast]
            slow++
        }
    }
    // 补零
}
```

**对撞指针：**

```go
func maxArea(height []int) int {
    left, right := 0, len(height)-1
    maxArea := 0
    for left < right {
        area := min(height[left], height[right]) * (right - left)
        maxArea = max(maxArea, area)
        if height[left] < height[right] {
            left++
        } else {
            right--
        }
    }
    return maxArea
}
```

### 2.3 回溯框架

```go
func backtrack(path []int, used []bool) {
    if len(path) == len(nums) {
        // 记录结果
        return
    }
    for i := 0; i < len(nums); i++ {
        if used[i] { continue }
        used[i] = true
        path = append(path, nums[i])
        backtrack(path, used)
        path = path[:len(path)-1]
        used[i] = false
    }
}
```

### 2.4 动态规划框架

```go
// 一维DP
func dp1D(nums []int) int {
    dp := make([]int, len(nums))
    dp[0] = nums[0]
    for i := 1; i < len(nums); i++ {
        dp[i] = max(dp[i-1]+nums[i], nums[i])
    }
    return dp[len(nums)-1]
}
```

### 2.5 BFS/DFS框架

**BFS（层序遍历）：**

```go
func levelOrder(root *TreeNode) [][]int {
    result := [][]int{}
    queue := []*TreeNode{root}
    for len(queue) > 0 {
        levelSize := len(queue)
        level := []int{}
        for i := 0; i < levelSize; i++ {
            node := queue[0]
            queue = queue[1:]
            level = append(level, node.Val)
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
        }
        result = append(result, level)
    }
    return result
}
```

### 2.6 单调栈框架

```go
func nextGreaterElement(nums []int) []int {
    n := len(nums)
    result := make([]int, n)
    stack := []int{}  // 存储索引，单调递增

    for i := n - 1; i >= 0; i-- {
        for len(stack) > 0 && nums[stack[len(stack)-1]] <= nums[i] {
            stack = stack[:len(stack)-1]
        }
        if len(stack) == 0 {
            result[i] = -1
        } else {
            result[i] = nums[stack[len(stack)-1]]
        }
        stack = append(stack, i)
    }
    return result
}
```

---

## 第三部分：Hot 100 题目详细整理

### 3.1 哈希表类题目

#### 1. 两数之和（LeetCode 1）- 简单

**题目描述：**

给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target 的那 两个 整数，并返回它们的数组下标。

**思维引导：**

空间换时间。遍历时查询目标值与当前值的差值是否在哈希中。

**核心逻辑：**

```go
func twoSum(nums []int, target int) []int {
    m := make(map[int]int)
    for i, v := range nums {
        if idx, ok := m[target-v]; ok {
            return []int{idx, i}
        }
        m[v] = i
    }
    return nil
}
```

**记忆口诀：** "遍历存差值，边存边查效率高"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 50

---

#### 49. 字母异位词分组（LeetCode 49）- 中等

**题目描述：**

给你一个字符串数组，请你将 字母异位词 组合在一起。

**思维引导：**

异位词排序后相等。以排序后的字符串为 Key。

**核心逻辑：**

```go
func groupAnagrams(strs []string) [][]string {
    m := make(map[string][]string)
    for _, s := range strs {
        tmp := []byte(s)
        sort.Slice(tmp, func(i, j int) bool { return tmp[i] < tmp[j] })
        key := string(tmp)
        m[key] = append(m[key], s)
    }
    result := make([][]int, 0, len(m))
    for _, group := range m {
        result = append(result, group)
    }
    return result
}
```

**记忆口诀：** "异位词排序都一样，哈希聚合最方便"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 28

---

#### 128. 最长连续序列（LeetCode 128）- 中等

**题目描述：**

给定一个未排序的整数数组 nums，找出数字连续的最长序列的长度。

**思维引导：**

只从序列的起点开始计数。如果 x-1 存在，则 x 不是起点，跳过。

**核心逻辑：**

```go
func longestConsecutive(nums []int) int {
    has := make(map[int]bool)
    for _, num := range nums {
        has[num] = true
    }
    ans := 0
    for x := range has {
        if has[x-1] {
            continue
        }
        y := x + 1
        for has[y] {
            y++
        }
        ans = max(ans, y-x)
    }
    return ans
}
```

**记忆口诀：** "只从起点开始计，x-1存在就跳过"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

### 3.2 双指针类题目

#### 283. 移动零（LeetCode 283）- 简单

**题目描述：**

给定一个数组 nums，将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

**思维引导：**

快慢指针。快指针找非零元素，慢指针记录存放位置。

**核心逻辑：**

```go
func moveZeroes(nums []int) {
    slow := 0
    for fast := 0; fast < len(nums); fast++ {
        if nums[fast] != 0 {
            nums[slow] = nums[fast]
            slow++
        }
    }
    for i := slow; i < len(nums); i++ {
        nums[i] = 0
    }
}
```

**记忆口诀：** "快指针找非零，慢指针存位置"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 11. 盛最多水的容器（LeetCode 11）- 中等

**题目描述：**

找出两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

**思维引导：**

对撞指针。每次移动短板，因为移动长板面积只会减少。

**核心逻辑：**

```go
func maxArea(height []int) int {
    left, right := 0, len(height)-1
    res := 0
    for left < right {
        area := min(height[left], height[right]) * (right - left)
        res = max(res, area)
        if height[left] < height[right] {
            left++
        } else {
            right--
        }
    }
    return res
}
```

**记忆口诀：** "对撞指针两端开，短边移动求更优"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 15. 三数之和（LeetCode 15）- 中等

**题目描述：**

返回所有和为 0 且不重复的三元组。

**思维引导：**

排序 + 固定 i + 对撞双指针。关键在于去重。

**核心逻辑：**

```go
func threeSum(nums []int) [][]int {
    sort.Ints(nums)
    ans := make([][]int, 0)
    n := len(nums)
    for i := 0; i < n; i++ {
        if nums[i] > 0 {
            break
        }
        if i > 0 && nums[i] == nums[i-1] {
            continue
        }
        k, j := i+1, n-1
        for k < j {
            sum := nums[i] + nums[k] + nums[j]
            if sum < 0 {
                k++
            } else if sum > 0 {
                j--
            } else {
                ans = append(ans, []int{nums[i], nums[k], nums[j]})
                for k++; k < j && nums[k] == nums[k-1]; k++ {}
                for j--; k < j && nums[j] == nums[j+1]; j-- {}
            }
        }
    }
    return ans
}
```

**记忆口诀：** "排序固定第一个，双指针对撞找另外，三重去重不能忘"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 40

---

#### 42. 接雨水（LeetCode 42）- 困难

**题目描述：**

计算柱状图下雨之后能接多少雨水。

**思维引导：**

每个位置能接的水取决于左右两边最大高度的极小值。

**核心逻辑：**

```go
func trap(height []int) int {
    sum := 0
    max_left := 0
    n := len(height)
    max_right := make([]int, n)
    for i := n-2; i >= 0; i-- {
        max_right[i] = max(max_right[i+1], height[i+1])
    }
    for i := 1; i < n-1; i++ {
        max_left = max(max_left, height[i-1])
        minHeight := min(max_left, max_right[i])
        if minHeight > height[i] {
            sum += minHeight - height[i]
        }
    }
    return sum
}
```

**记忆口诀：** "每个位置看两边，两边最大取最小"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

### 3.3 滑动窗口类题目

#### 3. 无重复字符的最长子串（LeetCode 3）- 中等

**题目描述：**

找出不含有重复字符的 最长子串 的长度。

**思维引导：**

同向双指针（窗口）。遇到重复时，左指针跳到重复字符上次出现位置的右边。

**核心逻辑：**

```go
func lengthOfLongestSubstring(s string) int {
    left, right := -1, 0
    maxlength := 0
    dic := make(map[byte]int)
    for right < len(s) {
        if idx, exists := dic[s[right]]; exists {
            if idx > left {
                left = idx
            }
        }
        dic[s[right]] = right
        maxlength = max(maxlength, right-left)
        right++
    }
    return maxlength
}
```

**记忆口诀：** "左右指针滑窗口，遇到重复跳左边"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 438. 找到字符串中所有字母异位词（LeetCode 438）- 中等

**题目描述：**

找到 s 中所有 p 的异位词的子串，返回起始索引。

**思维引导：**

固定窗口。维护 26 位频次数组。

**核心逻辑：**

```go
func findAnagrams(s string, p string) []int {
    cntP := [26]int{}
    cntS := [26]int{}
    for _, c := range p {
        cntP[c-'a']++
    }
    result := []int{}
    for right, c := range s {
        cntS[c-'a']++
        left := right - len(p) + 1
        if left < 0 {
            continue
        }
        if cntS == cntP {
            result = append(result, left)
        }
        cntS[s[left]-'a']--
    }
    return result
}
```

**记忆口诀：** "定长窗口滑滑走，频次比较是核心"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

### 3.4 子串类题目

#### 560. 和为 K 的子数组（LeetCode 560）- 中等

**题目描述：**

统计和为 k 的子数组的个数。

**思维引导：**

前缀和 + 哈希表。核心逻辑：sum[i] - sum[j] == k。

**核心逻辑：**

```go
func subarraySum(nums []int, k int) int {
    cnt := make(map[int]int, len(nums)+1)
    cnt[0] = 1
    s := 0
    ans := 0
    for _, x := range nums {
        s += x
        ans += cnt[s-k]
        cnt[s]++
    }
    return ans
}
```

**记忆口诀：** "前缀和减K，次数加累积"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 239. 滑动窗口最大值（LeetCode 239）- 困难

**题目描述：**

返回滑动窗口中的最大值。

**思维引导：**

单调队列。队列内只保存可能成为最大值的下标，且下标对应的元素单调递减。

**核心逻辑：**

```go
func maxSlidingWindow(nums []int, k int) []int {
    if len(nums) == 0 || k == 0 {
        return []int{}
    }
    deque := []int{}
    result := []int{}

    for i := 0; i < len(nums); i++ {
        // 移除超出窗口的元素
        for len(deque) > 0 && deque[0] <= i-k {
            deque = deque[1:]
        }
        // 移除比当前元素小的
        for len(deque) > 0 && nums[deque[len(deque)-1]] < nums[i] {
            deque = deque[:len(deque)-1]
        }
        deque = append(deque, i)
        if i >= k-1 {
            result = append(result, nums[deque[0]])
        }
    }
    return result
}
```

**记忆口诀：** "双端队列存索引，单调递减保最大"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 76. 最小覆盖子串（LeetCode 76）- 困难

**题目描述：**

返回 s 中的最短窗口子串，使得该子串包含 t 中的每一个字符。

**思维引导：**

变长窗口。不断扩大 R 寻找可行解，然后收缩 L 寻找最优解。

**核心逻辑：**

```go
func minWindow(s, t string) string {
    need := [256]int{}
    window := [256]int{}

    for i := 0; i < len(t); i++ {
        need[t[i]]++
    }

    left, right := 0, 0
    minLen := len(s) + 1
    minStart := 0
    formed := 0
    required := 0

    for _, cnt := range need {
        if cnt > 0 {
            required++
        }
    }

    for right < len(s) {
        c := s[right]
        window[c]++
        if need[c] > 0 && window[c] == need[c] {
            formed++
        }

        for left <= right && formed == required {
            c = s[left]
            if right-left+1 < minLen {
                minLen = right - left + 1
                minStart = left
            }
            window[c]--
            if need[c] > 0 && window[c] < need[c] {
                formed--
            }
            left++
        }
        right++
    }

    if minLen == len(s)+1 {
        return ""
    }
    return s[minStart : minStart+minLen]
}
```

**记忆口诀：** "双哈希表计数，需要种类formed判"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

### 3.5 普通数组类题目

#### 53. 最大子数组和（LeetCode 53）- 中等

**题目描述：**

找出一个具有最大和的连续子数组。

**思维引导：**

贪心/DP。如果前面的和小于 0，则抛弃，从当前开始。

**核心逻辑：**

```go
func maxSubArray(nums []int) int {
    res := nums[0]
    for i := 1; i < len(nums); i++ {
        if nums[i-1] > 0 {
            nums[i] += nums[i-1]
        }
        if nums[i] > res {
            res = nums[i]
        }
    }
    return res
}
```

**记忆口诀：** "负和丢弃重开始，当前最大全局最大"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 56. 合并区间（LeetCode 56）- 中等

**题目描述：**

合并所有重叠的区间。

**思维引导：**

按起点排序。如果当前起点 <= 前一区间终点，则合并。

**核心逻辑：**

```go
func merge(intervals [][]int) [][]int {
    if len(intervals) <= 1 {
        return intervals
    }
    sort.Slice(intervals, func(i, j int) bool {
        return intervals[i][0] < intervals[j][0]
    })
    res := [][]int{intervals[0]}
    for i := 1; i < len(intervals); i++ {
        curr := intervals[i]
        prev := &res[len(res)-1]
        if curr[0] <= (*prev)[1] {
            if curr[1] > (*prev)[1] {
                (*prev)[1] = curr[1]
            }
        } else {
            res = append(res, curr)
        }
    }
    return res
}
```

**记忆口诀：** "排序之后看结束，重叠合并更新值"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 189. 轮转数组（LeetCode 189）- 中等

**题目描述：**

将数组中的元素向右轮转 k 个位置。

**思维引导：**

三步翻转。全翻转 -> 翻转前 k -> 翻转剩余 k。

**核心逻辑：**

```go
func rotate(nums []int, k int) {
    k %= len(nums)
    slices.Reverse(nums)
    slices.Reverse(nums[:k])
    slices.Reverse(nums[k:])
}
```

**记忆口诀：** "整体反转前k个，剩余部分再反转"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

#### 238. 除自身以外数组的乘积（LeetCode 238）- 中等

**题目描述：**

返回数组 answer，其中 answer[i] 等于 nums 中除了 nums[i] 之外其余各元素的乘积。

**思维引导：**

前缀之积 * 后缀之积。不用除法。

**核心逻辑：**

```go
func productExceptSelf(nums []int) []int {
    n := len(nums)
    pre := make([]int, n)
    pre[0] = 1
    for i := 1; i < n; i++ {
        pre[i] = pre[i-1] * nums[i-1]
    }
    suf := make([]int, n)
    suf[n-1] = 1
    for i := n-2; i >= 0; i-- {
        suf[i] = suf[i+1] * nums[i+1]
    }
    ans := make([]int, n)
    for i := 0; i < n; i++ {
        ans[i] = pre[i] * suf[i]
    }
    return ans
}
```

**记忆口诀：** "左边乘积累积，右边乘积合并"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 41. 缺失的第一个正数（LeetCode 41）- 困难

**题目描述：**

找出未排序数组中没有出现的最小的正整数。

**思维引导：**

原地哈希。让数字 i 待在索引 i-1 的位置。

**核心逻辑：**

```go
func firstMissingPositive(nums []int) int {
    for i := 0; i < len(nums); i++ {
        for nums[i] > 0 && nums[i] <= len(nums) && nums[i] != nums[nums[i]-1] {
            nums[i], nums[nums[i]-1] = nums[nums[i]-1], nums[i]
        }
    }
    for i := 0; i < len(nums); i++ {
        if nums[i] != i+1 {
            return i + 1
        }
    }
    return len(nums) + 1
}
```

**记忆口诀：** "原地哈希放位置，不对就换直到对"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

### 3.6 矩阵类题目

#### 73. 矩阵置零（LeetCode 73）- 中等

**题目描述：**

如果元素为 0，则将其所在行和列的所有元素都设置为 0。

**思维引导：**

用矩阵第一行和第一列做标记位。

**核心逻辑：**

```go
func setZeroes(matrix [][]int) {
    m, n := len(matrix), len(matrix[0])
    firstRowZero := false
    firstColZero := false

    for i := 0; i < m; i++ {
        if matrix[i][0] == 0 {
            firstColZero = true
            break
        }
    }
    for j := 0; j < n; j++ {
        if matrix[0][j] == 0 {
            firstRowZero = true
            break
        }
    }

    for i := 1; i < m; i++ {
        for j := 1; j < n; j++ {
            if matrix[i][j] == 0 {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    for i := 1; i < m; i++ {
        if matrix[i][0] == 0 {
            for j := 1; j < n; j++ {
                matrix[i][j] = 0
            }
        }
    }
    for j := 1; j < n; j++ {
        if matrix[0][j] == 0 {
            for i := 1; i < m; i++ {
                matrix[i][j] = 0
            }
        }
    }

    if firstRowZero {
        for j := 0; j < n; j++ {
            matrix[0][j] = 0
        }
    }
    if firstColZero {
        for i := 0; i < m; i++ {
            matrix[i][0] = 0
        }
    }
}
```

**记忆口诀：** "行列标记分开记，最后处理第一行"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

#### 54. 螺旋矩阵（LeetCode 54）- 中等

**题目描述：**

按照顺时针螺旋顺序返回矩阵中的所有元素。

**思维引导：**

维护上下左右四个边界。

**核心逻辑：**

```go
func spiralOrder(matrix [][]int) []int {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return []int{}
    }
    m, n := len(matrix), len(matrix[0])
    l, r := 0, n-1
    t, b := 0, m-1
    ans := []int{}

    for len(ans) < m*n {
        for i := l; i <= r; i++ {
            ans = append(ans, matrix[t][i])
        }
        t++
        if t > b {
            break
        }
        for i := t; i <= b; i++ {
            ans = append(ans, matrix[i][r])
        }
        r--
        if l > r {
            break
        }
        for i := r; i >= l; i-- {
            ans = append(ans, matrix[b][i])
        }
        b--
        if t > b {
            break
        }
        for i := b; i >= t; i-- {
            ans = append(ans, matrix[i][l])
        }
        l++
    }
    return ans
}
```

**记忆口诀：** "四边循环缩边界，顺时针转圈走"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 48. 旋转图像（LeetCode 48）- 中等

**题目描述：**

将图像顺时针旋转 90 度。

**思维引导：**

先水平翻转，再主对角线翻转。

**核心逻辑：**

```go
func rotate(matrix [][]int) {
    n := len(matrix[0])
    for i := 0; i < n/2; i++ {
        for j := 0; j < (n+1)/2; j++ {
            tmp := matrix[i][j]
            matrix[i][j] = matrix[n-1-j][i]
            matrix[n-1-j][i] = matrix[n-1-i][n-1-j]
            matrix[n-1-i][n-1-j] = matrix[j][n-1-i]
            matrix[j][n-1-i] = tmp
        }
    }
}
```

**记忆口诀：** "先水平后对角，90度旋转成"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

#### 240. 搜索二维矩阵 II（LeetCode 240）- 中等

**题目描述：**

在每行每列都递增的矩阵中搜索目标值。

**思维引导：**

从右上角开始，像二叉搜索树一样行走。

**核心逻辑：**

```go
func searchMatrix(matrix [][]int, target int) bool {
    m := len(matrix)
    if m == 0 {
        return false
    }
    n := len(matrix[0])
    i, j := 0, n-1

    for i < m && j >= 0 {
        if matrix[i][j] == target {
            return true
        }
        if matrix[i][j] < target {
            i++
        } else {
            j--
        }
    }
    return false
}
```

**记忆口诀：** "右上角开始搜，大了向左小了走"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

### 3.7 链表类题目

#### 160. 相交链表（LeetCode 160）- 简单

**题目描述：**

返回两个单链表相交的起始节点。

**思维引导：**

双指针法。a + (b - c) = b + (a - c)

**核心逻辑：**

```go
func getIntersectionNode(headA, headB *ListNode) *ListNode {
    A, B := headA, headB
    for A != B {
        if A != nil {
            A = A.Next
        } else {
            A = headB
        }
        if B != nil {
            B = B.Next
        } else {
            B = headA
        }
    }
    return A
}
```

**记忆口诀：** "你走我来换条路，殊途同归在交点"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 206. 反转链表（LeetCode 206）- 简单

**题目描述：**

反转链表并返回反转后的链表。

**思维引导：**

三指针反转。prev, curr, nextTemp。

**核心逻辑：**

```go
func reverseList(head *ListNode) *ListNode {
    var prev *ListNode
    curr := head
    for curr != nil {
        nextTemp := curr.Next
        curr.Next = prev
        prev = curr
        curr = nextTemp
    }
    return prev
}
```

**记忆口诀：** "prev curr next，三指针反转链表"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 141. 环形链表（LeetCode 141）- 简单

**题目描述：**

判断链表中是否有环。

**思维引导：**

快慢指针。快指针每次两步，慢指针每次一步。

**核心逻辑：**

```go
func hasCycle(head *ListNode) bool {
    fast, slow := head, head
    for fast != nil && fast.Next != nil {
        slow = slow.Next
        fast = fast.Next.Next
        if fast == slow {
            return true
        }
    }
    return false
}
```

**记忆口诀：** "快慢指针跑圈赛，相遇就是有环在"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 142. 环形链表 II（LeetCode 142）- 中等

**题目描述：**

返回链表开始入环的第一个节点。

**思维引导：**

快慢指针相遇后，一指针回起点，另一指针不动，同步走，再次相遇即入口。

**核心逻辑：**

```go
func detectCycle(head *ListNode) *ListNode {
    fast, slow := head, head
    for fast != nil && fast.Next != nil {
        fast = fast.Next.Next
        slow = slow.Next
        if fast == slow {
            break
        }
    }
    if fast == nil || fast.Next == nil {
        return nil
    }
    slow = head
    for slow != fast {
        slow = slow.Next
        fast = fast.Next
    }
    return slow
}
```

**记忆口诀：** "快慢相遇不算完，指针重置再相见"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 21. 合并两个有序链表（LeetCode 21）- 简单

**题目描述：**

合并两个升序链表。

**思维引导：**

哨兵节点 + 遍历比较。

**核心逻辑：**

```go
func mergeTwoLists(list1, list2 *ListNode) *ListNode {
    dummy := &ListNode{}
    cur := dummy
    for list1 != nil && list2 != nil {
        if list1.Val < list2.Val {
            cur.Next = list1
            list1 = list1.Next
        } else {
            cur.Next = list2
            list2 = list2.Next
        }
        cur = cur.Next
    }
    if list1 != nil {
        cur.Next = list1
    } else {
        cur.Next = list2
    }
    return dummy.Next
}
```

**记忆口诀：** "哑节点简化边界，遍历拼接两链表"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 2. 两数相加（LeetCode 2）- 中等

**题目描述：**

两个逆序链表表示的数相加，返回逆序链表。

**思维引导：**

对齐然后相加，处理进位。

**核心逻辑：**

```go
func addTwoNumbers(l1, l2 *ListNode) *ListNode {
    dummy := &ListNode{}
    cur := dummy
    carry := 0

    for l1 != nil || l2 != nil || carry > 0 {
        sum := carry
        if l1 != nil {
            sum += l1.Val
            l1 = l1.Next
        }
        if l2 != nil {
            sum += l2.Val
            l2 = l2.Next
        }
        cur.Next = &ListNode{Val: sum % 10}
        cur = cur.Next
        carry = sum / 10
    }
    return dummy.Next
}
```

**记忆口诀：** "逐位相加带进位，最后进位莫忘记"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 19. 删除链表的倒数第 N 个节点（LeetCode 19）- 中等

**题目描述：**

删除链表的倒数第 n 个节点。

**思维引导：**

快指针先走 n+1 步，然后同步移动。

**核心逻辑：**

```go
func removeNthFromEnd(head *ListNode, n int) *ListNode {
    dummy := &ListNode{Next: head}
    fast, slow := dummy, dummy

    for i := 0; i <= n; i++ {
        fast = fast.Next
    }

    for fast != nil {
        fast = fast.Next
        slow = slow.Next
    }

    slow.Next = slow.Next.Next
    return dummy.Next
}
```

**记忆口诀：** "快指针先走n+1，同步移动删倒数"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 234. 回文链表（LeetCode 234）- 简单

**题目描述：**

判断链表是否为回文链表。

**思维引导：**

快慢指针找中点，反转后半部分，比较前后两部分。

**核心逻辑：**

```go
func isPalindrome(head *ListNode) bool {
    if head == nil || head.Next == nil {
        return true
    }

    prev := &ListNode{Next: head}
    slow, fast := head, head

    for fast != nil && fast.Next != nil {
        prev = prev.Next
        slow = slow.Next
        fast = fast.Next.Next
    }

    prev.Next = nil
    right := reverseList(slow)

    left := head
    result := true
    for left != nil && right != nil {
        if left.Val != right.Val {
            result = false
            break
        }
        left = left.Next
        right = right.Next
    }
    return result
}

func reverseList(head *ListNode) *ListNode {
    var prev *ListNode
    for head != nil {
        next := head.Next
        head.Next = prev
        prev = head
        head = next
    }
    return prev
}
```

**记忆口诀：** "快慢找中点，反转后一半"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 146. LRU 缓存（LeetCode 146）- 中等

**题目描述：**

实现 LRU 缓存。

**思维引导：**

哈希表 + 双向链表。哈希提供 O(1) 查找，链表提供 O(1) 移动到头部。

**核心逻辑：**

```go
type Node struct {
    key, value int
    prev, next *Node
}

type LRUCache struct {
    capacity int
    dummy    *Node
    keyToNode map[int]*Node
}

func Constructor(capacity int) LRUCache {
    dummy := &Node{}
    dummy.prev = dummy
    dummy.next = dummy
    return LRUCache{
        capacity:  capacity,
        dummy:     dummy,
        keyToNode: make(map[int]*Node),
    }
}

func (c *LRUCache) Get(key int) int {
    node := c.keyToNode[key]
    if node == nil {
        return -1
    }
    c.moveToHead(node)
    return node.value
}

func (c *LRUCache) Put(key int, value int) {
    node := c.keyToNode[key]
    if node != nil {
        node.value = value
        c.moveToHead(node)
        return
    }
    node = &Node{key: key, value: value}
    c.keyToNode[key] = node
    c.pushFront(node)
    if len(c.keyToNode) > c.capacity {
        backNode := c.dummy.prev
        delete(c.keyToNode, backNode.key)
        c.remove(backNode)
    }
}

func (c *LRUCache) pushFront(x *Node) {
    x.prev = c.dummy
    x.next = c.dummy.next
    x.prev.next = x
    x.next.prev = x
}

func (c *LRUCache) remove(x *Node) {
    x.prev.next = x.next
    x.next.prev = x.prev
}

func (c *LRUCache) moveToHead(x *Node) {
    c.remove(x)
    c.pushFront(x)
}
```

**记忆口诀：** "哈希链表双剑合，移动头部删尾巴"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 28

---

### 3.8 二叉树类题目

#### 94. 二叉树的中序遍历（LeetCode 94）- 简单

**题目描述：**

返回二叉树的中序遍历。

**思维引导：**

左 -> 根 -> 右。

**核心逻辑：**

```go
func inorderTraversal(root *TreeNode) []int {
    res := []int{}
    var dfs func(*TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        res = append(res, node.Val)
        dfs(node.Right)
    }
    dfs(root)
    return res
}
```

**记忆口诀：** "左根右，中序遍历"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 104. 二叉树的最大深度（LeetCode 104）- 简单

**题目描述：**

返回二叉树的最大深度。

**思维引导：**

递归。左右子树比深度，大的加一返回去。

**核心逻辑：**

```go
func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }
    left := maxDepth(root.Left)
    right := maxDepth(root.Right)
    return max(left, right) + 1
}
```

**记忆口诀：** "左右子树比深度，大的加一返回去"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 30

---

#### 226. 翻转二叉树（LeetCode 226）- 简单

**题目描述：**

翻转二叉树。

**思维引导：**

递归交换左右子树。

**核心逻辑：**

```go
func invertTree(root *TreeNode) *TreeNode {
    if root == nil {
        return nil
    }
    left := invertTree(root.Left)
    right := invertTree(root.Right)
    root.Left = right
    root.Right = left
    return root
}
```

**记忆口诀：** "递归翻转左右子树，交换指针完成翻转"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 101. 对称二叉树（LeetCode 101）- 简单

**题目描述：**

检查二叉树是否镜像对称。

**思维引导：**

递归比较左右子树是否对称。

**核心逻辑：**

```go
func isSymmetric(root *TreeNode) bool {
    return isMirror(root.Left, root.Right)
}

func isMirror(t1, t2 *TreeNode) bool {
    if t1 == nil && t2 == nil {
        return true
    }
    if t1 == nil || t2 == nil {
        return false
    }
    if t1.Val != t2.Val {
        return false
    }
    return isMirror(t1.Left, t2.Right) && isMirror(t1.Right, t2.Left)
}
```

**记忆口诀：** "左右互相比，外外内内要对称"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 543. 二叉树的直径（LeetCode 543）- 简单

**题目描述：**

返回二叉树的直径（任意两个节点之间最长路径的长度）。

**思维引导：**

直径等于左右深度的和。

**核心逻辑：**

```go
func diameterOfBinaryTree(root *TreeNode) int {
    maxDiameter := 0

    var depth func(*TreeNode) int
    depth = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        leftDepth := depth(node.Left)
        rightDepth := depth(node.Right)
        maxDiameter = max(maxDiameter, leftDepth+rightDepth)
        return max(leftDepth, rightDepth) + 1
    }

    depth(root)
    return maxDiameter
}
```

**记忆口诀：** "直径等于左右深度的和"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

#### 102. 二叉树的层序遍历（LeetCode 102）- 中等

**题目描述：**

返回二叉树的层序遍历。

**思维引导：**

队列 + 逐层剥离。

**核心逻辑：**

```go
func levelOrder(root *TreeNode) [][]int {
    if root == nil {
        return [][]int{}
    }
    result := [][]int{}
    queue := []*TreeNode{root}

    for len(queue) > 0 {
        levelSize := len(queue)
        level := []int{}
        for i := 0; i < levelSize; i++ {
            node := queue[0]
            queue = queue[1:]
            level = append(level, node.Val)
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
        result = append(result, level)
    }
    return result
}
```

**记忆口诀：** "队列辅助层序走，每层数量先记好"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 108. 将有序数组转换为二叉搜索树（LeetCode 108）- 简单

**题目描述：**

将升序数组转换为高度平衡的二叉搜索树。

**思维引导：**

取中间元素作为根节点，递归构造左右子树。

**核心逻辑：**

```go
func sortedArrayToBST(nums []int) *TreeNode {
    if len(nums) == 0 {
        return nil
    }
    m := len(nums) / 2
    return &TreeNode{
        Val:  nums[m],
        Left: sortedArrayToBST(nums[:m]),
        Right: sortedArrayToBST(nums[m+1:]),
    }
}
```

**记忆口诀：** "中间节点当根，左边左子树，右边右子树"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 16

---

#### 98. 验证二叉搜索树（LeetCode 98）- 中等

**题目描述：**

判断是否为有效的二叉搜索树。

**思维引导：**

中序遍历是递增序列，递归传递上下界。

**核心逻辑：**

```go
func isValidBST(root *TreeNode) bool {
    return validate(root, nil, nil)
}

func validate(node, min, max *TreeNode) bool {
    if node == nil {
        return true
    }
    if min != nil && node.Val <= min.Val {
        return false
    }
    if max != nil && node.Val >= max.Val {
        return false
    }
    return validate(node.Left, min, node) && validate(node.Right, node, max)
}
```

**记忆口诀：** "中序递增有上下界，左小右大要牢记"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 236. 二叉树的最近公共祖先（LeetCode 236）- 中等

**题目描述：**

找到两个指定节点的最近公共祖先。

**思维引导：**

后序遍历。如果左右都找到，返回当前节点。

**核心逻辑：**

```go
func lowestCommonAncestor(root, p, q *TreeNode) *TreeNode {
    if root == nil || root == p || root == q {
        return root
    }
    left := lowestCommonAncestor(root.Left, p, q)
    right := lowestCommonAncestor(root.Right, p, q)

    if left == nil {
        return right
    }
    if right == nil {
        return left
    }
    return root
}
```

**记忆口诀：** "左右子树各查找，都有返回根，独有返回独"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 28

---

#### 124. 二叉树中的最大路径和（LeetCode 124）- 困难

**题目描述：**

返回二叉树中的最大路径和。

**思维引导：**

DFS 返回包含自身的单侧最大路径，同时更新全局 Max。

**核心逻辑：**

```go
func maxPathSum(root *TreeNode) int {
    maxSum := math.MinInt

    var maxGain func(*TreeNode) int
    maxGain = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        leftGain := max(0, maxGain(node.Left))
        rightGain := max(0, maxGain(node.Right))

        priceNewPath := node.Val + leftGain + rightGain
        if priceNewPath > maxSum {
            maxSum = priceNewPath
        }
        return node.Val + max(leftGain, rightGain)
    }

    maxGain(root)
    return maxSum
}
```

**记忆口诀：** "左右贡献加本身，子路径和不小于0"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 15

---

### 3.9 图论与回溯类题目

#### 200. 岛屿数量（LeetCode 200）- 中等

**题目描述：**

计算网格中岛屿的数量。

**思维引导：**

DFS/BFS 蔓延。遇到陆地就计数，沉没四周变水域。

**核心逻辑：**

```go
func numIslands(grid [][]byte) int {
    m, n := len(grid), len(grid[0])
    var ans int
    var dfs func(int, int)
    dfs = func(i, j int) {
        if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != '1' {
            return
        }
        grid[i][j] = '2'
        dfs(i, j-1)
        dfs(i, j+1)
        dfs(i-1, j)
        dfs(i+1, j)
    }

    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == '1' {
                dfs(i, j)
                ans++
            }
        }
    }
    return ans
}
```

**记忆口诀：** "遇到陆地就计数，沉没四周变水域"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 46. 全排列（LeetCode 46）- 中等

**题目描述：**

返回所有可能的全排列。

**思维引导：**

回溯。选择用完就撤销，路径复制记结果。

**核心逻辑：**

```go
func permute(nums []int) [][]int {
    res := [][]int{}
    used := make([]bool, len(nums))
    path := []int{}

    var dfs func()
    dfs = func() {
        if len(path) == len(nums) {
            tmp := make([]int, len(path))
            copy(tmp, path)
            res = append(res, tmp)
            return
        }
        for i := 0; i < len(nums); i++ {
            if used[i] {
                continue
            }
            used[i] = true
            path = append(path, nums[i])
            dfs()
            path = path[:len(path)-1]
            used[i] = false
        }
    }

    dfs()
    return res
}
```

**记忆口诀：** "选择用完就撤销，路径复制记结果"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 40

---

#### 78. 子集（LeetCode 78）- 中等

**题目描述：**

返回数组所有可能的子集。

**思维引导：**

每个元素选或不选，子集收集要趁早。

**核心逻辑：**

```go
func subsets(nums []int) [][]int {
    res := [][]int{}
    path := []int{}

    var dfs func(int)
    dfs = func(start int) {
        tmp := make([]int, len(path))
        copy(tmp, path)
        res = append(res, tmp)

        for i := start; i < len(nums); i++ {
            path = append(path, nums[i])
            dfs(i + 1)
            path = path[:len(path)-1]
        }
    }

    dfs(0)
    return res
}
```

**记忆口诀：** "每个元素选或不选，子集收集要趁早"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 22. 括号生成（LeetCode 22）- 中等

**题目描述：**

生成所有有效的括号组合。

**思维引导：**

回溯。左括号随便加，右括号看左边。

**核心逻辑：**

```go
func generateParenthesis(n int) []string {
    res := []string{}
    path := []byte{}

    var dfs func(int, int)
    dfs = func(left, right int) {
        if left == 0 && right == 0 {
            res = append(res, string(path))
            return
        }
        if left > 0 {
            path = append(path, '(')
            dfs(left-1, right)
            path = path[:len(path)-1]
        }
        if right > left {
            path = append(path, ')')
            dfs(left, right-1)
            path = path[:len(path)-1]
        }
    }

    dfs(n, n)
    return res
}
```

**记忆口诀：** "左括号随便加，右括号看左边"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

### 3.10 二分查找类题目

#### 35. 搜索插入位置（LeetCode 35）- 简单

**题目描述：**

在排序数组中找到目标值或插入位置。

**思维引导：**

标准二分查找模板。

**核心逻辑：**

```go
func searchInsert(nums []int, target int) int {
    left, right := 0, len(nums)-1
    for left <= right {
        mid := left + (right-left)/2
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}
```

**记忆口诀：** "左闭右闭找中间，左移右移看条件"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 34. 在排序数组中查找元素的第一个和最后一个位置（LeetCode 34）- 中等

**题目描述：**

返回目标值的开始位置和结束位置。

**思维引导：**

两次二分查找（下界和上界）。

**核心逻辑：**

```go
func searchRange(nums []int, target int) []int {
    lowerBound := func(nums []int, target int) int {
        left, right := 0, len(nums)-1
        for left <= right {
            mid := left + (right-left)/2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }

    start := lowerBound(nums, target)
    if start == len(nums) || nums[start] != target {
        return []int{-1, -1}
    }
    end := lowerBound(nums, target+1) - 1
    return []int{start, end}
}
```

**记忆口诀：** "下界上界两次查，找不到返回-1"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 33. 搜索旋转排序数组（LeetCode 33）- 中等

**题目描述：**

在旋转排序数组中搜索目标值。

**思维引导：**

二分时总有一边是有序的。

**核心逻辑：**

```go
func search(nums []int, target int) int {
    left, right := 0, len(nums)-1
    for left <= right {
        mid := left + (right-left)/2
        if nums[mid] == target {
            return mid
        }
        if nums[left] <= nums[mid] {
            if nums[left] <= target && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return -1
}
```

**记忆口诀：** "旋转数组二分难，总有一边是有序"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 4. 寻找两个正序数组的中位数（LeetCode 4）- 困难

**题目描述：**

返回两个正序数组的中位数。

**思维引导：**

二分查找划分两个数组。

**核心逻辑：**

```go
func findMedianSortedArrays(nums1, nums2 []int) double {
    m, n := len(nums1), len(nums2)
    total := m + n
    i, j, prev, cur := 0, 0, 0, 0

    for cnt := 0; cnt <= total/2; cnt++ {
        prev = cur
        if i < m && (j >= n || nums1[i] < nums2[j]) {
            cur = nums1[i]
            i++
        } else {
            cur = nums2[j]
            j++
        }
    }

    if total%2 == 1 {
        return float64(cur)
    }
    return (float64(prev) + float64(cur)) / 2.0
}
```

**记忆口诀：** "双数组找第K，两指针并行跑"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 15

---

### 3.11 栈与堆类题目

#### 20. 有效的括号（LeetCode 20）- 简单

**题目描述：**

判断字符串是否包含有效的括号。

**思维引导：**

栈。左括入栈右括弹，匹配失败return false。

**核心逻辑：**

```go
func isValid(s string) bool {
    if len(s)%2 != 0 {
        return false
    }
    mp := map[rune]rune{')': '(', ']': '[', '}': '{'}
    st := []rune{}
    for _, c := range s {
        if mp[c] == 0 {
            st = append(st, c)
        } else {
            if len(st) == 0 || st[len(st)-1] != mp[c] {
                return false
            }
            st = st[:len(st)-1]
        }
    }
    return len(st) == 0
}
```

**记忆口诀：** "左括入栈右括弹，栈空匹配才有效"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 155. 最小栈（LeetCode 155）- 中等

**题目描述：**

设计一个支持 push, pop, top, getMin 的栈。

**思维引导：**

辅助栈存最小值。

**核心逻辑：**

```go
type MinStack struct {
    data   []pair
    minVal []int
}

type pair struct{ val, preMin int }

func Constructor() MinStack {
    return MinStack{
        minVal: []int{math.MaxInt},
    }
}

func (this *MinStack) Push(val int) {
    minVal := val
    if this.GetMin() < val {
        minVal = this.GetMin()
    }
    this.data = append(this.data, pair{val, minVal})
}

func (this *MinStack) Pop() {
    this.data = this.data[:len(this.data)-1]
}

func (this *MinStack) Top() int {
    return this.data[len(this.data)-1].val
}

func (this *MinStack) GetMin() int {
    return this.data[len(this.data)-1].preMin
}
```

**记忆口诀：** "双栈配合不费劲，辅助栈存最小值"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 739. 每日温度（LeetCode 739）- 中等

**题目描述：**

返回下一个更高温度出现在几天后。

**思维引导：**

单调栈。递减栈存储索引。

**核心逻辑：**

```go
func dailyTemperatures(temperatures []int) []int {
    n := len(temperatures)
    res := make([]int, n)
    stack := []int{}

    for i := 0; i < n; i++ {
        for len(stack) > 0 && temperatures[i] > temperatures[stack[len(stack)-1]] {
            t := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            res[t] = i - t
        }
        stack = append(stack, i)
    }
    return res
}
```

**记忆口诀：** "递减栈存索引，比我大的算天数"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 215. 数组中的第 K 个最大元素（LeetCode 215）- 中等

**题目描述：**

返回数组中第 K 大的元素。

**思维引导：**

快速选择算法。

**核心逻辑：**

```go
func findKthLargest(nums []int, k int) int {
    target := len(nums) - k

    left, right := 0, len(nums)-1
    for {
        pivotIndex := partition(nums, left, right)
        if pivotIndex == target {
            return nums[pivotIndex]
        } else if pivotIndex < target {
            left = pivotIndex + 1
        } else {
            right = pivotIndex - 1
        }
    }
}

func partition(nums []int, left, right int) int {
    pivot := nums[right]
    i := left
    for j := left; j < right; j++ {
        if nums[j] <= pivot {
            nums[i], nums[j] = nums[j], nums[i]
            i++
        }
    }
    nums[i], nums[right] = nums[right], nums[i]
    return i
}
```

**记忆口诀：** "快选划分定位置，目标位置见分晓"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 347. 前 K 个高频元素（LeetCode 347）- 中等

**题目描述：**

返回前 K 个高频元素。

**思维引导：**

哈希统计频率，桶排序或堆。

**核心逻辑：**

```go
func topKFrequent(nums []int, k int) []int {
    cnt := make(map[int]int)
    maxCnt := 0
    for _, x := range nums {
        cnt[x]++
        maxCnt = max(maxCnt, cnt[x])
    }

    buckets := make([][]int, maxCnt+1)
    for x, c := range cnt {
        buckets[c] = append(buckets[c], x)
    }

    ans := []int{}
    for i := maxCnt; i > 0 && len(ans) < k; i-- {
        ans = append(ans, buckets[i]...)
    }
    return ans
}
```

**记忆口诀：** "频率统计入桶中，逆序取出前K个"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 295. 数据流的中位数（LeetCode 295）- 困难

**题目描述：**

数据流的中位数。

**思维引导：**

两个堆。大顶堆存左半，小顶堆存右半。

**核心逻辑：**

```go
type MedianFinder struct {
    maxHeap *IntHeap // 大顶堆，存较小的一半
    minHeap *IntHeap // 小顶堆，存较大的一半
}

type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] > h[j] } // 大顶堆
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

func Constructor() MedianFinder {
    return MedianFinder{
        maxHeap: &IntHeap{},
        minHeap: &IntHeap{},
    }
}

func (this *MedianFinder) AddNum(num int) {
    heap.Push(this.maxHeap, num)
    heap.Push(this.minHeap, heap.Pop(this.maxHeap).(int))
    if this.minHeap.Len() > this.maxHeap.Len() {
        heap.Push(this.maxHeap, heap.Pop(this.minHeap).(int))
    }
}

func (this *MedianFinder) FindMedian() float64 {
    if this.maxHeap.Len() > this.minHeap.Len() {
        return float64((*this.maxHeap)[0])
    }
    return (float64((*this.maxHeap)[0]) + float64((*this.minHeap)[0])) / 2.0
}
```

**记忆口诀：** "大小顶堆分两边，平衡维护中位数"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

### 3.12 贪心算法类题目

#### 121. 买卖股票的最佳时机（LeetCode 121）- 简单

**题目描述：**

计算最大利润（只买卖一次）。

**思维引导：**

维护最低价格和最大利润。

**核心逻辑：**

```go
func maxProfit(prices []int) int {
    ans := 0
    minPrice := prices[0]
    for _, x := range prices {
        ans = max(ans, x-minPrice)
        minPrice = min(x, minPrice)
    }
    return ans
}
```

**记忆口诀：** "最低价格记心间，最大利润随时算"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 50

---

#### 122. 买卖股票的最佳时机 II（LeetCode 122）- 中等

**题目描述：**

计算最大利润（可以买卖多次）。

**思维引导：**

累加所有正差值。

**核心逻辑：**

```go
func maxProfit(prices []int) int {
    ans := 0
    for i := 1; i < len(prices); i++ {
        if prices[i] > prices[i-1] {
            ans += prices[i] - prices[i-1]
        }
    }
    return ans
}
```

**记忆口诀：** "正差就累加，负差不操作"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 55. 跳跃游戏（LeetCode 55）- 中等

**题目描述：**

判断是否能到达最后一个下标。

**思维引导：**

维护当前能够到达的最远位置。

**核心逻辑：**

```go
func canJump(nums []int) bool {
    mx := 0
    for i, x := range nums {
        if i > mx {
            return false
        }
        mx = max(mx, i+x)
        if mx >= len(nums)-1 {
            return true
        }
    }
    return true
}
```

**记忆口诀：** "能到最远不断更新，到不了就return false"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 45. 跳跃游戏 II（LeetCode 45）- 中等

**题目描述：**

返回到达终点的最少跳跃次数。

**思维引导：**

在每一步范围内寻找下一跳的最远位置。

**核心逻辑：**

```go
func jump(nums []int) int {
    ans, cur_right, nxt_right := 0, 0, 0
    for i := 0; i < len(nums)-1; i++ {
        nxt_right = max(nxt_right, i+nums[i])
        if i == cur_right {
            cur_right = nxt_right
            ans++
        }
    }
    return ans
}
```

**记忆口诀：** "当前边界选最远，跨出边界加一步"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 763. 划分字母区间（LeetCode 763）- 中等

**题目描述：**

将字符串划分为尽可能多的片段。

**思维引导：**

记录每个字符的最后位置，类似跳跃游戏。

**核心逻辑：**

```go
func partitionLabels(s string) []int {
    n := len(s)
    last := make([]int, 26)
    for i := 0; i < n; i++ {
        last[s[i]-'a'] = i
    }

    res := []int{}
    start, end := 0, 0
    for i := 0; i < n; i++ {
        end = max(end, last[s[i]-'a'])
        if end == i {
            res = append(res, end-start+1)
            start = i + 1
        }
    }
    return res
}
```

**记忆口诀：** "记录最后出现位，区间合并定分割"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

### 3.13 动态规划类题目

#### 70. 爬楼梯（LeetCode 70）- 简单

**题目描述：**

每次爬 1 或 2 阶，有多少种方法爬到楼顶。

**思维引导：**

斐波那契。dp[i] = dp[i-1] + dp[i-2]。

**核心逻辑：**

```go
func climbStairs(n int) int {
    if n <= 2 {
        return n
    }
    prev, curr := 1, 2
    for i := 3; i <= n; i++ {
        prev, curr = curr, prev+curr
    }
    return curr
}
```

**记忆口诀：** "最后一步定来源，两种来源相加来"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 198. 打家劫舍（LeetCode 198）- 中等

**题目描述：**

不能偷相邻的两家，求最大金额。

**思维引导：**

dp[i] = max(dp[i-1], dp[i-2] + nums[i])。

**核心逻辑：**

```go
func rob(nums []int) int {
    n := len(nums)
    if n == 0 {
        return 0
    }
    if n == 1 {
        return nums[0]
    }
    dp := make([]int, n)
    dp[0] = nums[0]
    dp[1] = max(nums[0], nums[1])
    for i := 2; i < n; i++ {
        dp[i] = max(dp[i-1], dp[i-2]+nums[i])
    }
    return dp[n-1]
}
```

**记忆口诀：** "偷和不偷选最大，隔一家加当前"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 24

---

#### 279. 完全平方数（LeetCode 279）- 中等

**题目描述：**

返回和为 n 的完全平方数的最少数量。

**思维引导：**

完全背包问题。物品体积是完全平方数，价值为1。

**核心逻辑：**

```go
func numSquares(n int) int {
    dp := make([]int, n+1)
    for i := 1; i <= n; i++ {
        dp[i] = math.MaxInt
    }
    for i := 1; i*i <= n; i++ {
        for j := i * i; j <= n; j++ {
            dp[j] = min(dp[j], dp[j-i*i]+1)
        }
    }
    return dp[n]
}
```

**记忆口诀：** "完全背包求最值，平方数做物品"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 322. 零钱兑换（LeetCode 322）- 中等

**题目描述：**

返回凑成总金额所需的最少硬币个数。

**思维引导：**

完全背包求最小值。

**核心逻辑：**

```go
func coinChange(coins []int, amount int) int {
    dp := make([]int, amount+1)
    for i := range dp {
        dp[i] = amount + 1
    }
    dp[0] = 0
    for _, coin := range coins {
        for j := coin; j <= amount; j++ {
            dp[j] = min(dp[j], dp[j-coin]+1)
        }
    }
    if dp[amount] > amount {
        return -1
    }
    return dp[amount]
}
```

**记忆口诀：** "背包容量是金额，硬币面值是体积"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 139. 单词拆分（LeetCode 139）- 中等

**题目描述：**

判断是否能用字典中的单词拼接出字符串。

**思维引导：**

dp[i] = OR{ dp[j] && s[j:i] in dict }。

**核心逻辑：**

```go
func wordBreak(s string, wordDict []string) bool {
    wordSet := make(map[string]bool)
    for _, word := range wordDict {
        wordSet[word] = true
    }
    n := len(s)
    dp := make([]bool, n+1)
    dp[0] = true

    for i := 1; i <= n; i++ {
        for j := 0; j < i; j++ {
            if dp[j] && wordSet[s[j:i]] {
                dp[i] = true
                break
            }
        }
    }
    return dp[n]
}
```

**记忆口诀：** "从前向后逐位置，拆得前面再判断"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 300. 最长递增子序列（LeetCode 300）- 中等

**题目描述：**

返回最长严格递增子序列的长度。

**思维引导：**

dp[i] = max(dp[j] + 1) where j < i and nums[j] < nums[i]。

**核心逻辑：**

```go
func lengthOfLIS(nums []int) int {
    n := len(nums)
    dp := make([]int, n)
    ans := 0
    for i := 0; i < n; i++ {
        dp[i] = 1
        for j := 0; j < i; j++ {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
        ans = max(ans, dp[i])
    }
    return ans
}
```

**记忆口诀：** "逐个比较往前找，能接就接最长链"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 28

---

#### 152. 乘积最大子数组（LeetCode 152）- 中等

**题目描述：**

返回乘积最大的连续子数组。

**思维引导：**

维护最大和最小乘积，因为负数会使最小变最大。

**核心逻辑：**

```go
func maxProduct(nums []int) int {
    n := len(nums)
    f_max, f_min := make([]int, n), make([]int, n)
    f_max[0], f_min[0] = nums[0], nums[0]
    ans := nums[0]

    for i := 1; i < n; i++ {
        x := nums[i]
        f_max[i] = max(f_max[i-1]*x, f_min[i-1]*x, x)
        f_min[i] = min(f_max[i-1]*x, f_min[i-1]*x, x)
        ans = max(ans, f_max[i])
    }
    return ans
}
```

**记忆口诀：** "最大最小同步更新，负数翻转要记牢"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 416. 分割等和子集（LeetCode 416）- 中等

**题目描述：**

判断是否可以分割成两个和相等的子集。

**思维引导：**

01背包。背包容量为 sum/2。

**核心逻辑：**

```go
func canPartition(nums []int) bool {
    sum := 0
    for _, x := range nums {
        sum += x
    }
    if sum%2 == 1 {
        return false
    }
    target := sum / 2
    dp := make([]bool, target+1)
    dp[0] = true
    for _, num := range nums {
        for j := target; j >= num; j-- {
            dp[j] = dp[j] || dp[j-num]
        }
    }
    return dp[target]
}
```

**记忆口诀：** "总和对半分背包，能装一半就成功"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 32. 最长有效括号（LeetCode 32）- 困难

**题目描述：**

返回最长有效括号子串的长度。

**思维引导：**

栈或DP。栈记录最后不匹配的位置。

**核心逻辑：**

```go
func longestValidParentheses(s string) int {
    maxAns := 0
    stack := []int{-1}
    for i, c := range s {
        if c == '(' {
            stack = append(stack, i)
        } else {
            stack = stack[:len(stack)-1]
            if len(stack) == 0 {
                stack = append(stack, i)
            } else {
                maxAns = max(maxAns, i-stack[len(stack)-1])
            }
        }
    }
    return maxAns
}
```

**记忆口诀：** "栈存索引不匹配，减去栈顶得长度"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 1143. 最长公共子序列（LeetCode 1143）- 中等

**题目描述：**

返回两个字符串的最长公共子序列长度。

**思维引导：**

dp[i][j] = dp[i-1][j-1] + 1 if s1[i]==s2[j]，否则 max(dp[i-1][j], dp[i][j-1])。

**核心逻辑：**

```go
func longestCommonSubsequence(text1, text2 string) int {
    m, n := len(text1), len(text2)
    dp := make([][]int, m+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
    }

    for i := 1; i <= m; i++ {
        for j := 1; j <= n; j++ {
            if text1[i-1] == text2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
    }
    return dp[m][n]
}
```

**记忆口诀：** "字符相同加一，不同取两边的最大"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 72. 编辑距离（LeetCode 72）- 困难

**题目描述：**

返回将 word1 转换成 word2 的最少操作数。

**思维引导：**

dp[i][j] 表示将 s1[0..i) 转换为 s2[0..j) 的最少步数。

**核心逻辑：**

```go
func minDistance(word1, word2 string) int {
    m, n := len(word1), len(word2)
    dp := make([][]int, m+1)
    for i := range dp {
        dp[i] = make([]int, n+1)
    }

    for i := 1; i <= m; i++ {
        dp[i][0] = i
    }
    for j := 1; j <= n; j++ {
        dp[0][j] = j
    }

    for i := 1; i <= m; i++ {
        for j := 1; j <= n; j++ {
            if word1[i-1] == word2[j-1] {
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
            }
        }
    }
    return dp[m][n]
}
```

**记忆口诀：** "插入删除替换三操作，取最小加一"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐ | **优先级**: 28

---

#### 5. 最长回文子串（LeetCode 5）- 中等

**题目描述：**

返回最长回文子串。

**思维引导：**

中心扩展法。枚举每个中心，向两边扩展。

**核心逻辑：**

```go
func longestPalindrome(s string) string {
    start, end := 0, 0
    for i := 0; i < len(s); i++ {
        left1, right1 := expandAroundCenter(s, i, i)
        left2, right2 := expandAroundCenter(s, i, i+1)
        if right1-left1 > end-start {
            start, end = left1, right1
        }
        if right2-left2 > end-start {
            start, end = left2, right2
        }
    }
    return s[start : end+1]
}

func expandAroundCenter(s string, left, right int) (int, int) {
    for left >= 0 && right < len(s) && s[left] == s[right] {
        left--
        right++
    }
    return left + 1, right - 1
}
```

**记忆口诀：** "中心扩展法，字符相同往两边"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---
没问题，已经为你转换成纯 **Markdown** 格式，方便你直接复制到 Obsidian、Notion 或 GitHub Wiki 中。

---

### 62. 不同路径（LeetCode 62）- 中等

**题目描述：**
一个机器人位于  网格的左上角。机器人每次只能向下或向右移动一步。问总共有多少条不同的路径？

**思维引导：**
使用组合数学解法。从左上角到右下角，总共需要走  步，其中必须有  步向下。因此问题转化为：在总步数位置中，选出  个位置放“向下”指令。

**核心逻辑：**

```text
公式：C(N, K) = N! / (K!(N-K)!)
其中 N = m + n - 2
其中 K = min(m-1, n-1) // 取较小值计算更简便

```

**解题框架：**

```go
func uniquePaths(m int, n int) int {
    // 总步数 N = (m-1) + (n-1)
    // 我们从中选出 K = m-1 步向下走
    N := m + n - 2
    K := m - 1
    if n-1 < K {
        K = n - 1
    }
    
    ans := 1
    // 迭代计算组合数，边乘边除防止溢出
    for i := 1; i <= K; i++ {
        ans = ans * (N - i + 1) / i
    }
    return ans
}

```

**记忆方式：**

```text
口诀："总步定死横纵分，组合公式秒杀人"
关键点：
- 总步数 = (m-1) + (n-1)
- 循环内逻辑：ans = ans * (待选剩余步数) / 当前选择序号

```

---

### 64. 最小路径和（LeetCode 64）- 中等

**题目描述：**
给定一个包含非负整数的  网格 `grid`，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

**思维引导：**
使用动态规划。每个格子的最小路径和只取决于其上方或左方格子的最小路径和。通过“原地更新” `grid` 数组，可以将空间复杂度降至最低。

**核心逻辑：**

```text
dp[i][j] = grid[i][j] + min(dp[i-1][j], dp[i][j-1])
边界处理：
- 起点：保持不变
- 第一行：只能从左边累加
- 第一列：只能从上边累加

```

**解题框架：**

```go
func minPathSum(grid [][]int) int {
    m, n := len(grid), len(grid[0])
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if i == 0 && j == 0 {
                continue // 跳过起点
            } else if i == 0 {
                // 第一行：只能横着走
                grid[i][j] += grid[i][j-1]
            } else if j == 0 {
                // 第一列：只能竖着走
                grid[i][j] += grid[i-1][j]
            } else {
                // 中间区域：取左和上的最小值
                if grid[i-1][j] < grid[i][j-1] {
                    grid[i][j] += grid[i-1][j]
                } else {
                    grid[i][j] += grid[i][j-1]
                }
            }
        }
    }
    return grid[m-1][n-1]
}

```

**记忆方式：**

```text
口诀："左边上边挑个小，累加当前变新表"
关键点：
- 原地修改 grid 节省 O(M*N) 空间
- 逻辑顺序：先处理边界，再处理中心

```

---

这两道题是动态规划的基础模型。如果要继续深入，建议下一题看 **第 63 题（不同路径 II）**，它在路径中加入了“障碍物”，会考察你对 DP 边界条件的精细控制。需要我帮你把 63 题也一并总结了吗？

### 3.14 技巧类题目

#### 136. 只出现一次的数字（LeetCode 136）- 简单

**题目描述：**

找出只出现一次的元素，其他元素都出现两次。

**思维引导：**

异或消消乐。a ^ a = 0, a ^ 0 = a。

**核心逻辑：**

```go
func singleNumber(nums []int) int {
    x := 0
    for _, num := range nums {
        x ^= num
    }
    return x
}
```

**记忆口诀：** "异或消消乐，相同为0不同留"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 45

---

#### 169. 多数元素（LeetCode 169）- 简单

**题目描述：**

找出出现次数超过 n/2 的元素。

**思维引导：**

摩尔投票。票数归零换候选，相同加一不同减。

**核心逻辑：**

```go
func majorityElement(nums []int) int {
    hp := 0
    var ans int
    for _, x := range nums {
        if hp == 0 {
            ans, hp = x, 1
        } else if x == ans {
            hp++
        } else {
            hp--
        }
    }
    return ans
}
```

**记忆口诀：** "票数归零换候选，相同加一不同减"

**掌握程度**: ⭐⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐⭐⭐ | **优先级**: 35

---

#### 75. 颜色分类（LeetCode 75）- 中等

**题目描述：**

原地排序，只包含 0、1、2。

**思维引导：**

三指针。p0 分界 0 和 1，p1 分界 1 和 2。

**核心逻辑：**

```go
func sortColors(nums []int) {
    p0, p1 := 0, 0
    for i := 0; i < len(nums); i++ {
        x := nums[i]
        nums[i] = 2
        if x <= 1 {
            nums[p1] = 1
            p1++
        }
        if x == 0 {
            nums[p0] = 0
            p0++
        }
    }
}
```

**记忆口诀：** "三指针分三区，0左1中2右"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

#### 287. 寻找重复数（LeetCode 287）- 中等

**题目描述：**

找出数组中的重复数。

**思维引导：**

链表环检测。快慢指针找环入口。

**核心逻辑：**

```go
func findDuplicate(nums []int) int {
    slow, fast := 0, 0
    for {
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast {
            break
        }
    }
    head := 0
    for slow != head {
        slow = nums[slow]
        head = nums[head]
    }
    return slow
}
```

**记忆口诀：** "数组映射成链表，环入口是重复"

**掌握程度**: ⭐⭐⭐ | **考频**: ⭐⭐⭐⭐ | **优先级**: 12

---

#### 31. 下一个排列（LeetCode 31）- 中等

**题目描述：**

返回下一个字典序更大的排列。

**思维引导：**

找转折点 -> 找右侧较大者交换 -> 翻转后段。

**核心逻辑：**

```go
func nextPermutation(nums []int) {
    n := len(nums)
    i := n - 2
    for i >= 0 && nums[i] >= nums[i+1] {
        i--
    }
    if i >= 0 {
        j := n - 1
        for nums[j] <= nums[i] {
            j--
        }
        nums[i], nums[j] = nums[j], nums[i]
    }
    slices.Reverse(nums[i+1:])
}
```

**记忆口诀：** "找转折点换右边，翻转后段变最小"

**掌握程度**: ⭐⭐⭐⭐ | **考频**: ⭐⭐⭐⭐⭐ | **优先级**: 20

---

## 第四部分：算法思维导图

### 4.1 题目类型快速识别

```
看到题目，先问自己三个问题：

1. 数据是否有序？
   是 → 考虑二分查找、双指针
   否 → 考虑哈希表、暴力优化

2. 是找最值还是找方案？
   最值 → 贪心、DP
   方案 → 回溯、BFS

3. 约束条件是什么？
   时间O(1) → 哈希表
   时间O(log n) → 二分查找
   时间O(n) → 滑动窗口、哈希表
   时间O(n²) → 暴力优化
```

### 4.2 数据结构选择指南

```
需要O(1)查找 → map
需要有序数据 → 排序 + 二分
需要FIFO → 队列/切片
需要LIFO → 栈/切片
需要优先级 → 堆
需要去重 → map/set
```

### 4.3 经典问题速查

```
两数之和 → map存储差值
三数之和 → 排序 + 双指针
接雨水 → 单调栈或左右最大
最大子数组 → 贪心/DP
爬楼梯 → DP（斐波那契）
股票买卖 → 贪心/DP
岛屿数量 → DFS/BFS
括号匹配 → 栈
LRU缓存 → 哈希表+双向链表
```

---

## 第五部分：面试必背口诀汇总

### 5.1 数据结构口诀

**哈希表：**
```
"空间换时间，遍历存差值"
```

**双指针：**
```
"快慢指针滑窗口，对撞指针两端开"
```

**栈：**
```
"左括入栈右括弹，匹配失败return false"
```

**队列：**
```
"先进先出FIFO，层序遍历要用它"
```

### 5.2 算法口诀

**二分查找：**
```
"左闭右闭找中间，左移右移看条件"
```

**回溯：**
```
"选择递归撤销三步走，路径记得要复制"
```

**动态规划：**
```
"定义状态推方程，初始条件不能忘"
```

**贪心：**
```
"局部最优换全局，无后效性是前提"
```

**滑动窗口：**
```
"窗口大小随条件变，右扩左缩不停歇"
```

### 5.3 边界处理口诀

**空指针：**
```
"指针先用再访问，nil判断不能忘"
```

**切片越界：**
```
"左闭右开要记清，长度容量分得明"
```

**map查找：**
```
"双返判断存在性，ok变量辨分明"
```

---

## 复习建议

### 按优先级排序的复习计划

**Day 1（最高优先级，优先级≥30）：**
- 两数之和 (50)
- 买卖股票的最佳时机 (50)
- 无重复字符的最长子串 (45)
- 最大子数组和 (45)
- 爬楼梯 (45)
- 有效的括号 (45)
- 只出现一次的数字 (45)
- 反转链表 (45)

**Day 2（优先级 20-30）：**
- 三数之和、全排列、子集、二叉树层序遍历、LRU缓存、买卖股票II、跳跃游戏、最近公共祖先、最长递增子序列等

**Day 3（优先级 10-20）：**
- 合并区间、环形链表、每日温度、验证BST、第K大元素等

**Day 4（剩余题目）：**
- 困难题目：接雨水、最小覆盖子串、编辑距离、最大路径和等

---

## 结语

**预祝面试顺利！加油！💪**

> **记住**：面试不仅考算法，也考表达。边写边说，让面试官了解你的思路。

---

*文档生成时间：2024*
*作者：Matrix Agent*
