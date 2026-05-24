---
AIGC:
    ContentProducer: Minimax Agent AI
    ContentPropagator: Minimax Agent AI
    Label: AIGC
    ProduceID: 810e60e75a84c3e6c367cda412b4a50f
    PropagateID: 810e60e75a84c3e6c367cda412b4a50f
    ReservedCode1: 30460221009afb1ee91a5e01d1015bd2592968d8e478882ae74e1c2c6c3c69e5ac94d932fb022100d2e94908b58d03419dd51235453dd617433c624be745243c71aad58c1ecfe83e
    ReservedCode2: 3045022100d69d9a0f0cdc860e1935c95320872e35fc2e0ab840858e9f00210d0e3d82d103022046e2dd4a58481f82fcbd25aff9fa1ddd52fcee06dc420162d7398e8fa74ff6c7
---

# LeetCode Hot 100 面试快速复习手册（Go语言版）

> **复习目标**：在面试前掌握核心思维模型、常用语法工具、标准代码框架
> **复习方法**：背诵思维引导 → 数据结构 → 代码实现的闭环
> **作者**：Matrix Agent

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
- [1. 两数之和](#1-两数之和leetcode-1---简单)
- [49. 字母异位词分组](#49-字母异位词分组leetcode-49---中等)
- [128. 最长连续序列](#128-最长连续序列leetcode-128---中等)

#### 3.2 双指针类题目
- [283. 移动零](#283-移动零leetcode-283---简单)
- [11. 盛最多水的容器](#11-盛最多水的容器leetcode-11---中等)
- [15. 三数之和](#15-三数之和leetcode-15---中等)
- [42. 接雨水](#42-接雨水leetcode-42---困难)

#### 3.3 滑动窗口类题目
- [3. 无重复字符的最长子串](#3-无重复字符的最长子串leetcode-3---中等)
- [438. 找到字符串中所有字母异位词](#438-找到字符串中所有字母异位词leetcode-438---中等)

#### 3.4 子串类题目
- [560. 和为 K 的子数组](#560-和为-k-的子数组leetcode-560---中等)
- [239. 滑动窗口最大值](#239-滑动窗口最大值leetcode-239---困难)
- [76. 最小覆盖子串](#76-最小覆盖子串leetcode-76---困难)

#### 3.5 普通数组类题目
- [53. 最大子数组和](#53-最大子数组和leetcode-53---中等)
- [56. 合并区间](#56-合并区间leetcode-56---中等)
- [189. 轮转数组](#189-轮转数组leetcode-189---中等)
- [238. 除自身以外数组的乘积](#238-除自身以外数组的乘积leetcode-238---中等)
- [41. 缺失的第一个正数](#41-缺失的第一个正数leetcode-41---困难)

#### 3.6 矩阵类题目
- [73. 矩阵置零](#73-矩阵置零leetcode-73---中等)
- [54. 螺旋矩阵](#54-螺旋矩阵leetcode-54---中等)
- [48. 旋转图像](#48-旋转图像leetcode-48---中等)
- [240. 搜索二维矩阵 II](#240-搜索二维矩阵-iileetcode-240---中等)

#### 3.7 链表类题目
- [160. 相交链表](#160-相交链表leetcode-160---简单)
- [206. 反转链表](#206-反转链表leetcode-206---简单)
- [141. 环形链表](#141-环形链表leetcode-141---简单)
- [142. 环形链表 II](#142-环形链表-iileetcode-142---中等)
- [21. 合并两个有序链表](#21-合并两个有序链表leetcode-21---简单)
- [2. 两数相加](#2-两数相加leetcode-2---中等)
- [19. 删除链表的倒数第 N 个节点](#19-删除链表的倒数第-n-个节点leetcode-19---中等)
- [24. 两两交换节点](#24-两两交换节点leetcode-24---中等)
- [25. K 个一组翻转链表](#25-k-个一组翻转链表leetcode-25---困难)
- [138. 随机链表的复制](#138-随机链表的复制leetcode-138---中等)
- [148. 排序链表](#148-排序链表leetcode-148---中等)
- [23. 合并 K 个升序链表](#23-合并-k-个升序链表leetcode-23---困难)
- [146. LRU 缓存](#146-lru-缓存leetcode-146---中等)

#### 3.8 二叉树类题目
- [94. 二叉树的中序遍历](#94-二叉树的中序遍历leetcode-94---简单)
- [104. 二叉树的最大深度](#104-二叉树的最大深度leetcode-104---简单)
- [226. 翻转二叉树](#226-翻转二叉树leetcode-226---简单)
- [101. 对称二叉树](#101-对称二叉树leetcode-101---简单)
- [543. 二叉树的直径](#543-二叉树的直径leetcode-543---简单)
- [102. 二叉树的层序遍历](#102-二叉树的层序遍历leetcode-102---中等)
- [108. 将有序数组转换为二叉搜索树](#108-将有序数组转换为二叉搜索树leetcode-108---简单)
- [98. 验证二叉搜索树](#98-验证二叉搜索树leetcode-98---中等)
- [230. 二叉搜索树中第 K 小的元素](#230-二叉搜索树中第-k-小的元素leetcode-230---中等)
- [199. 二叉树的右视图](#199-二叉树的右视图leetcode-199---中等)
- [114. 扁平化二叉树为链表](#114-扁平化二叉树为链表leetcode-114---中等)
- [105. 从前序和中序遍历序列构造二叉树](#105-从前序和中序遍历序列构造二叉树leetcode-105---中等)
- [437. 路径总和 III](#437-路径总和-iiileetcode-437---中等)
- [236. 二叉树的最近公共祖先](#236-二叉树的最近公共祖先leetcode-236---中等)
- [124. 二叉树中的最大路径和](#124-二叉树中的最大路径和leetcode-124---困难)

#### 3.9 图论与回溯类题目
- [200. 岛屿数量](#200-岛屿数量leetcode-200---中等)
- [994. 腐烂的橘子](#994-腐烂的橘子leetcode-994---中等)
- [46. 全排列](#46-全排列leetcode-46---中等)
- [78. 子集](#78-子集leetcode-78---中等)
- [17. 电话号码的字母组合](#17-电话号码的字母组合leetcode-17---中等)
- [39. 组合总和](#39-组合总和leetcode-39---中等)
- [22. 括号生成](#22-括号生成leetcode-22---中等)
- [79. 单词搜索](#79-单词搜索leetcode-79---中等)
- [131. 分割回文串](#131-分割回文串leetcode-131---中等)
- [51. N 皇后](#51-n-皇后leetcode-51---困难)

#### 3.10 二分查找类题目
- [35. 搜索插入位置](#35-搜索插入位置leetcode-35---简单)
- [74. 搜索二维矩阵](#74-搜索二维矩阵leetcode-74---中等)
- [34. 在排序数组中查找元素的第一个和最后一个位置](#34-在排序数组中查找元素的第一个和最后一个位置leetcode-34---中等)
- [33. 搜索旋转排序数组](#33-搜索旋转排序数组leetcode-33---中等)
- [153. 寻找旋转排序数组中的最小值](#153-寻找旋转排序数组中的最小值leetcode-153---中等)
- [4. 寻找两个正序数组的中位数](#4-寻找两个正序数组的中位数leetcode-4---困难)

#### 3.11 栈与堆类题目
- [20. 有效的括号](#20-有效的括号leetcode-20---简单)
- [155. 最小栈](#155-最小栈leetcode-155---中等)
- [394. 字符串解码](#394-字符串解码leetcode-394---中等)
- [739. 每日温度](#739-每日温度leetcode-739---中等)
- [84. 柱状图中最大的矩形](#84-柱状图中最大的矩形leetcode-84---困难)
- [215. 数组中的第 K 个最大元素](#215-数组中的第-k-个最大元素leetcode-215---中等)

#### 3.12 堆类题目
- [347. 前 K 个高频元素](#347-前-k-个高频元素leetcode-347---中等)
- [295. 数据流的中位数](#295-数据流的中位数leetcode-295---困难)

#### 3.13 贪心算法类题目
- [121. 买卖股票的最佳时机](#121-买卖股票的最佳时机leetcode-121---简单)
- [122. 买卖股票的最佳时机 II](#122-买卖股票的最佳时机-iileetcode-122---中等)
- [55. 跳跃游戏](#55-跳跃游戏leetcode-55---中等)
- [45. 跳跃游戏 II](#45-跳跃游戏-iileetcode-45---中等)
- [763. 划分字母区间](#763-划分字母区间leetcode-763---中等)

#### 3.14 动态规划类题目
- [70. 爬楼梯](#70-爬楼梯leetcode-70---简单)
- [53. 最大子数组和](#53-最大子数组和leetcode-53---中等)
- [198. 打家劫舍](#198-打家劫舍leetcode-198---中等)
- [279. 完全平方数](#279-完全平方数leetcode-279---中等)
- [322. 零钱兑换](#322-零钱兑换leetcode-322---中等)
- [139. 单词拆分](#139-单词拆分leetcode-139---中等)
- [300. 最长递增子序列](#300-最长递增子序列leetcode-300---中等)
- [152. 乘积最大子数组](#152-乘积最大子数组leetcode-152---中等)
- [416. 分割等和子集](#416-分割等和子集leetcode-416---中等)
- [32. 最长有效括号](#32-最长有效括号leetcode-32---困难)
- [1143. 最长公共子序列](#1143-最长公共子序列leetcode-1143---中等)
- [72. 编辑距离](#72-编辑距离leetcode-72---困难)
- [5. 最长回文子串](#5-最长回文子串leetcode-5---中等)
- [124. 二叉树中的最大路径和](#124-二叉树中的最大路径和leetcode-124---困难)

#### 3.15 技巧类题目
- [136. 只出现一次的数字](#136-只出现一次的数字leetcode-136---简单)
- [169. 多数元素](#169-多数元素leetcode-169---简单)
- [75. 颜色分类](#75-颜色分类leetcode-75---中等)
- [287. 寻找重复数](#287-寻找重复数leetcode-287---中等)
- [31. 下一个排列](#31-下一个排列leetcode-31---中等)

### 第四部分：算法思维导图
- [4.1 题目类型快速识别](#41-题目类型快速识别)
- [4.2 数据结构选择指南](#42-数据结构选择指南)
- [4.3 经典问题速查](#43-经典问题速查)

### 第五部分：面试必背口诀汇总
- [5.1 数据结构口诀](#51-数据结构口诀)
- [5.2 算法口诀](#52-算法口诀)
- [5.3 边界处理口诀](#53-边界处理口诀)

---

## 第一部分：Go语言面试核心语法速查

在开始刷题之前，先掌握Go语言在算法面试中最常用的语法和模式。这些语法工具将贯穿整个复习过程，建议在使用具体题目练习之前熟练掌握。

### 1.1 数组与切片（Slice）

切片是Go中最常用的数据结构，几乎每个题目都会用到。理解切片的底层实现对于写出高效代码至关重要。

**初始化方式对比：**

```go
// 方式1：声明并初始化
s := []int{1, 2, 3, 4, 5}

// 方式2：使用make创建指定长度和容量的切片
s := make([]int, 0, 10)  // 长度0，容量10

// 方式3：make创建固定长度切片（零值）
s := make([]int, 5)  // 长度5，容量5，初始值为[0 0 0 0 0]

// 方式4：从数组或切片截取
arr := [5]int{1, 2, 3, 4, 5}
s := arr[1:3]  // [2 3]，左闭右开区间
```

**核心操作方法：**

```go
// 追加元素（返回新切片）
s = append(s, 6)           // 追加单个元素
s = append(s, 7, 8, 9)     // 追加多个元素
s = append(s, t...)        // 追加另一个切片的所有元素

// 复制切片
copy(dest, src)             // 返回实际复制的元素个数

// 子切片
sub := s[2:5]               // 从索引2到5-1=4的子切片

// 排序
sort.Ints(s)                // 对int切片升序排序
sort.Sort(sort.Reverse(sort.IntSlice(s)))  // 降序排序

// 自定义排序
sort.Slice(s, func(i, j int) bool {
    return s[i] < s[j]     // 升序
})

// 查找元素位置
sort.SearchInts(s, 5)       // 返回5应该插入的位置（已存在则返回位置）
sort.Search(len(s), func(i int) bool {
    return s[i] >= 5        // 返回第一个>=5的位置
})

// 长度和容量
len(s)                      // 当前元素个数
cap(s)                      // 底层数组容量
```

**切片作为函数参数的传递特性：**

```go
// 重要：切片是引用类型，但底层是结构体
// 函数内修改切片元素会影响原切片
func modifySlice(s []int) {
    s[0] = 100  // 会修改原切片的第一个元素
}

// 但重新赋值切片参数不会影响原切片
func reassignSlice(s []int) {
    s = append(s, 99)  // 这不会影响原切片
}

// 正确做法：如果需要修改切片本身，需要返回新切片
func addElement(s []int, v int) []int {
    return append(s, v)
}
```

**面试高频考点：**

- **切片的扩容机制**：当容量不足时，Go会创建新的底层数组（通常是原容量的2倍），这会导致O(n)的时间复杂度。在算法题中，如果需要频繁追加元素，建议预先分配足够的容量。
- **切片截取与原数组共享底层数组**：这意味着修改子切片会影响原数组，在某些场景下需要特别注意。
- **nil切片与空切片的区别**：nil切片长度为0但没有底层数组，空切片有底层数组但长度为0。

### 1.2 哈希表（Map）

哈希表是算法题中使用最频繁的数据结构之一，提供了O(1)时间复杂度的查找、插入和删除操作。

**初始化与基本操作：**

```go
// 初始化
m := make(map[int]int)              // int->int的映射
m := make(map[string][]int)         // string->切片数组的映射
m := map[string]int{"a": 1, "b": 2} // 字面量初始化

// 插入/更新
m[key] = value

// 查找（Go独特的两返回值语法）
val, ok := m[key]                   // ok为true表示key存在
if val, ok := m[key]; ok {
    // key存在，使用val
}

// 删除
delete(m, key)                      // 如果key不存在，什么都不发生

// 遍历
for key, val := range m {
    // 遍历顺序随机
}

// 仅遍历key
for key := range m {

}

// 仅遍历value
for _, val := range m {

}
```

**并发安全问题（面试常考）：**

```go
// Go的map不是并发安全的
// 常见解决方案1：使用sync.Map（Go 1.9+）
var m sync.Map
m.Store(key, value)      // 存储
m.Load(key)              // 读取，返回(value, ok)
m.LoadOrStore(key, val)  // 读取或存储
m.Delete(key)            // 删除
m.Range(func(k, v interface{}) bool {
    // 遍历
    return true
})

// 常见解决方案2：使用互斥锁保护普通map
type SafeMap struct {
    mu sync.Mutex
    m  map[int]int
}

func (sm *SafeMap) Get(key int) (int, bool) {
    sm.mu.Lock()
    defer sm.mu.Unlock()
    val, ok := sm.m[key]
    return val, ok
}

func (sm *SafeMap) Set(key, val int) {
    sm.mu.Lock()
    defer sm.mu.Unlock()
    sm.m[key] = val
}
```

**Go Map的内部实现（了解有助于面试）：**

- Go使用哈希表和链表结合的开放寻址法
- 负载因子超过6.5时会触发扩容
- 扩容过程是渐进式的，不会阻塞所有操作
- key和value的内存布局有优化，会把value的体积较小的map优化为value和key存在同一个bucket中

### 1.3 队列与栈

Go标准库没有提供队列和栈的实现，通常使用切片模拟。

**切片模拟栈（后进先出）：**

```go
// 入栈
stack = append(stack, element)

// 出栈
element = stack[len(stack)-1]
stack = stack[:len(stack)-1]

// 查看栈顶（不出栈）
element = stack[len(stack)-1]

// 判断栈空
len(stack) == 0

// 完整栈实现示例
type Stack struct {
    data []int
}

func (s *Stack) Push(x int) {
    s.data = append(s.data, x)
}

func (s *Stack) Pop() int {
    if len(s.data) == 0 {
        return 0 // 需要处理空栈情况
    }
    x := s.data[len(s.data)-1]
    s.data = s.data[:len(s.data)-1]
    return x
}

func (s *Stack) Top() int {
    if len(s.data) == 0 {
        return 0
    }
    return s.data[len(s.data)-1]
}

func (s *Stack) Empty() bool {
    return len(s.data) == 0
}
```

**切片模拟队列（先进先出）：**

```go
// 使用切片头部的效率问题
// 出队：queue = queue[1:] 会导致O(n)的时间复杂度

// 优化方案1：环形缓冲区
type CircleQueue struct {
    data   []int
    head   int
    tail   int
    cap    int
}

func NewCircleQueue(cap int) *CircleQueue {
    return &CircleQueue{
        data: make([]int, cap),
        cap:  cap,
    }
}

func (q *CircleQueue) Push(x int) bool {
    if (q.tail+1)%q.cap == q.head {
        return false // 队满
    }
    q.data[q.tail] = x
    q.tail = (q.tail + 1) % q.cap
    return true
}

func (q *CircleQueue) Pop() (int, bool) {
    if q.head == q.tail {
        return 0, false // 队空
    }
    x := q.data[q.head]
    q.head = (q.head + 1) % q.cap
    return x, true
}

// 优化方案2：两个栈实现队列（经典面试题）
type MyQueue struct {
    in, out []int
}

func (q *MyQueue) Push(x int) {
    q.in = append(q.in, x)
}

func (q *MyQueue) Pop() int {
    if len(q.out) == 0 {
        for len(q.in) > 0 {
            q.out = append(q.out, q.in[len(q.in)-1])
            q.in = q.in[:len(q.in)-1]
        }
    }
    if len(q.out) == 0 {
        return 0
    }
    x := q.out[len(q.out)-1]
    q.out = q.out[:len(q.out)-1]
    return x
}
```

### 1.4 常用标准库函数

Go标准库提供了很多实用的辅助函数，在算法题中能大幅提高编码效率。

**字符串操作：**

```go
import "strings"

// 分割
fields := strings.Fields("a b c")           // ["a", "b", "c"]
split := strings.Split("a,b,c", ",")       // ["a", "b", "c"]

// 连接
join := strings.Join([]string{"a", "b"}, "-") // "a-b"

// 包含
strings.Contains("hello", "ll")             // true
strings.HasPrefix("hello", "he")            // true
strings.HasSuffix("hello", "lo")            // true

// 查找
idx := strings.Index("hello", "ll")         // 2，返回第一个匹配位置
idx = strings.LastIndex("hello", "l")       // 3，返回最后一个匹配位置

// 重复与替换
rep := strings.Repeat("ab", 3)              // "ababab"
rep = strings.Replace("aaa", "a", "b", 2)   // "bba"（替换前2个）

// 大小写转换
upper := strings.ToUpper("hello")           // "HELLO"
lower := strings.ToLower("HELLO")           // "hello"

// 去除空白
trim := strings.TrimSpace("  hello  ")      // "hello"
```

**字节操作：**

```go
import "bytes"

// 字节切片比较
bytes.Equal([]byte("a"), []byte("a"))      // true

// 字节切片连接
buf := new(bytes.Buffer)
buf.WriteString("hello")
buf.Write([]byte(" world"))
result := buf.String()                     // "hello world"

// 字节切片查找
idx := bytes.Index([]byte("hello"), []byte("ll")) // 2

// 字节切片是否包含
bytes.Contains([]byte("hello"), []byte("ll"))    // true
```

**数学函数：**

```go
import "math"

// 最大最小值（注意：math.Max/min的参数是float64）
max := math.Max(1.0, 2.0)                   // 2.0（返回float64）
min := math.Min(1.0, 2.0)                   // 1.0

// 对于int，使用标准方式
max := a
if b > max {
    max = b
}

// Go 1.21+ 内置min/max函数
max := max(a, b, c)
min := min(a, b, c)

// 绝对值
abs := math.Abs(-3.14)                     // 3.14（float64）
// 对于int，需要自己实现或使用math.Abs后转换
func absInt(n int) int {
    if n < 0 {
        return -n
    }
    return n
}

// 开方与幂
sqrt := math.Sqrt(16)                      // 4.0
pow := math.Pow(2, 3)                      // 8.0

// 向下/向上取整
floor := math.Floor(3.9)                   // 3.0
ceil := math.Ceil(3.1)                     // 4.0
//最大值最小值
maxInt := math.MaxInt32                    // 2147483647
minInt := math.MinInt32                    // -2147483648
```

**容器堆（Heap）：**

```go
import "container/heap"

// 使用堆实现优先队列
type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] } // 小顶堆
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *IntHeap) Push(x interface{}) {
    *h = append(*h, x.(int))
}
func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

// 使用示例
h := &IntHeap{2, 1, 5}
heap.Init(h)
heap.Push(h, 3)
for h.Len() > 0 {
    fmt.Println(heap.Pop(h))
}
```

### 1.5 递归与匿名函数

Go语言支持递归和匿名函数，这些在回溯和分治算法中非常重要。

**匿名函数定义与调用：**

```go
// 匿名函数定义
f := func(x int) int {
    return x * 2
}
result := f(5)                            // 10

// 立即执行
result := func(x int) int {
    return x * 2
}(5)                                      // 10

// 作为参数传递
numbers := []int{1, 2, 3, 4, 5}
even := filter(numbers, func(x int) bool {
    return x%2 == 0
})

func filter(numbers []int, predicate func(int) bool) []int {
    result := []int{}
    for _, n := range numbers {
        if predicate(n) {
            result = append(result, n)
        }
    }
    return result
}
```

**递归函数：**

```go
// 经典斐波那契数列
func fib(n int) int {
    if n <= 1 {
        return n
    }
    return fib(n-1) + fib(n-2)
}

// 带记忆化的递归（自顶向下DP）
func fibWithMemo(n int) int {
    memo := make([]int, n+1)
    for i := range memo {
        memo[i] = -1
    }
    var dfs func(int) int
    dfs = func(i int) int {
        if i <= 1 {
            return i
        }
        if memo[i] != -1 {
            return memo[i]
        }
        memo[i] = dfs(i-1) + dfs(i-2)
        return memo[i]
    }
    return dfs(n)
}

// 互相递归
func isEven(n int) bool {
    if n == 0 {
        return true
    }
    return isOdd(n - 1)
}

func isOdd(n int) bool {
    if n == 0 {
        return false
    }
    return isEven(n - 1)
}
```

**闭包捕获外部变量：**

```go
// 闭包捕获变量示例
func counter() func() int {
    count := 0
    return func() int {
        count++
        return count
    }
}

// 使用
c := counter()
fmt.Println(c()) // 1
fmt.Println(c()) // 2

// 在回溯算法中常见的使用模式
func findPaths(nums []int, target int) [][]int {
    res := [][]int{}
    path := []int{}

    var dfs func(int)
    dfs = func(idx int) {
        // 可以访问res和path
        if len(path) == target {
            // 复制切片
            tmp := make([]int, len(path))
            copy(tmp, path)
            res = append(res, tmp)
            return
        }
        for i := idx; i < len(nums); i++ {
            path = append(path, nums[i])
            dfs(i + 1)
            path = path[:len(path)-1]
        }
    }

    dfs(0)
    return res
}
```

### 1.6 指针与结构体

在链表和树结构中，指针和结构体的使用非常频繁。

**结构体定义与使用：**

```go
// 链表节点定义
type ListNode struct {
    Val  int
    Next *ListNode
}

// 树节点定义
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}

// 创建节点
node := &ListNode{Val: 1, Next: nil}
node := ListNode{Val: 1}  // 值类型

// 访问字段
fmt.Println(node.Val)
node.Next = &ListNode{Val: 2}
```

**方法接收者：**

```go
// 值接收者（不会修改原对象）
func (node ListNode) GetValue() int {
    return node.Val
}

// 指针接收者（可以修改原对象）
func (node *ListNode) SetValue(v int) {
    node.Val = v
}

// 面试考点：何时使用值接收者vs指针接收者？
// - 如果方法需要修改接收者，使用指针接收者
// - 如果接收者是切片或map，使用指针接收者（因为它们是引用类型，但本身是结构体）
// - 如果不确定，使用指针接收者（更通用）
```

**空指针判断：**

```go
if node == nil {
    // 处理空节点
}

// 访问nil指针的字段会panic
// 所以必须先判断是否为nil
```

---

## 第二部分：核心算法框架

本部分提炼了面试中最常用的算法框架，每个框架都有明确的适用场景、使用模板和变体。

### 2.1 二分查找框架

二分查找是面试中出现频率最高的算法之一，必须熟练掌握。

**标准二分查找模板：**

```go
// 查找目标值，返回索引或-1
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

**下界查找（第一个>=target的位置）：**

```go
func lowerBound(nums []int, target int) int {
    left, right := 0, len(nums)-1
    for left <= right {
        mid := left + (right-left)/2
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left  // 可能等于len(nums)
}
```

**上界查找（第一个>target的位置）：**

```go
func upperBound(nums []int, target int) int {
    left, right := 0, len(nums)-1
    for left <= right {
        mid := left + (right-left)/2
        if nums[mid] <= target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}
```

**查找第一个和最后一个位置（34题）：**

```go
func searchRange(nums []int, target int) []int {
    start := lowerBound(nums, target)
    if start == len(nums) || nums[start] != target {
        return []int{-1, -1}
    }
    end := upperBound(nums, target) - 1
    return []int{start, end}
}
```

**二分查找框架的记忆方式：**

```
核心口诀："左闭右闭，中间开花"
- 循环条件：left <= right
- 中间计算：left + (right-left)/2
- 左移条件：nums[mid] < target → left = mid + 1
- 右移条件：nums[mid] > target → right = mid - 1
- 返回值：left（或right+1）
```

**适用场景：**
- 在有序数组中查找特定值
- 查找插入位置
- 查找第一个/最后一个满足条件的元素
- 在旋转数组中查找（需要先找转折点）

### 2.2 双指针框架

双指针技巧广泛应用于数组和链表的处理，是必会技能。

**快慢指针（同向双指针）：**

```go
// 框架：两个指针从同一方向出发
// 用途：原地修改数组、查找满足条件的子数组

// 示例：移动零（283）
func moveZeroes(nums []int) {
    slow := 0
    for fast := 0; fast < len(nums); fast++ {
        if nums[fast] != 0 {
            nums[slow] = nums[fast]
            slow++
        }
    }
    // 剩余位置补零
    for i := slow; i < len(nums); i++ {
        nums[i] = 0
    }
}
```

**对撞指针（相向双指针）：**

```go
// 框架：两个指针从两端向中间移动
// 用途：两数之和、三数之和、盛最多水

// 示例：盛最多水的容器（11）
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

**滑动窗口（变长窗口）：**

```go
// 框架：维护一个窗口[l, r]，根据条件调整窗口大小
// 用途：无重复字符最长子串、最小覆盖子串

// 示例：无重复字符最长子串（3）
func lengthOfLongestSubstring(s string) int {
    charPos := make(map[byte]int)
    left, maxLen := -1, 0
    for right, c := range []byte(s) {
        if pos, ok := charPos[c]; ok && pos > left {
            left = pos  // 收缩左边界
        }
        charPos[c] = right
        maxLen = max(maxLen, right-left)
    }
    return maxLen
}

// 固定窗口大小
func findAnagrams(s, p string) []int {
    if len(s) < len(p) {
        return nil
    }
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
        if left > 0 {
            cntS[s[left-1]-'a']--  // 移出窗口
        }
        if cntS == cntP {
            result = append(result, left)
        }
    }
    return result
}
```

**双指针框架的记忆方式：**

```
快慢指针（同向）：
- 快指针负责探索，慢指针负责定位
- 典型模式：for fast, for if nums[fast] != 0 { nums[slow] = nums[fast]; slow++ }

对撞指针（相向）：
- 从两端开始，相向而行
- 典型模式：left, right := 0, len-1; for left < right { ... if cond { left++ } else { right-- } }

滑动窗口：
- 窗口大小可变，核心是收缩和扩展的条件
- 典型模式：for right { add(right); for cond { remove(left); left++ }; update(ans) }
```

### 2.3 回溯框架

回溯算法用于解决排列组合类问题，是面试中的高频考点。

**通用回溯模板：**

```go
func backtrack(路径, 选择列表) {
    if 满足结束条件 {
        记录结果
        return
    }
    for 选择 in 选择列表 {
        做选择
        backtrack(新路径, 新选择列表)
        撤销选择
    }
}
```

**排列问题（46）：**

```go
func permute(nums []int) [][]int {
    res := [][]int{}
    used := make([]bool, len(nums))
    path := make([]int, 0, len(nums))

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

**组合问题（78/39）：**

```go
func combinations(nums []int, target int) [][]int {
    res := [][]int{}
    path := []int{}

    var dfs func(start, remaining int)
    dfs = func(start, remaining int) {
        if remaining == 0 {
            tmp := make([]int, len(path))
            copy(tmp, path)
            res = append(res, tmp)
            return
        }
        for i := start; i < len(nums); i++ {
            if nums[i] > remaining {
                break  // 剪枝：有序数组时
            }
            path = append(path, nums[i])
            dfs(i+1, remaining-nums[i])  // 组合：不重复选，i+1
            // dfs(i, remaining-nums[i])   // 排列：重复选，i不变
            path = path[:len(path)-1]
        }
    }

    dfs(0, target)
    return res
}
```

**回溯框架的记忆方式：**

```
核心三要素：
1. 路径：已经做出的选择
2. 选择列表：当前可以做的选择
3. 结束条件：到达决策树底层，无法再做选择

模板口诀：
"选择-递归-撤销，三个步骤不能忘"
"路径记录要复制，防止引用出问题"
```

### 2.4 动态规划框架

动态规划是算法面试中最难也最重要的部分，需要大量练习。

**一维DP模板：**

```go
// 最值型DP
func dp1D(nums []int) int {
    n := len(nums)
    dp := make([]int, n)
    // 初始化
    dp[0] = nums[0]

    for i := 1; i < n; i++ {
        // 状态转移方程
        dp[i] = max(dp[i-1]+nums[i], nums[i])
    }
    return dp[n-1]
}

// 空间优化版本
func dp1DOptimized(nums []int) int {
    prev := nums[0]
    curr := prev
    for i := 1; i < len(nums); i++ {
        curr = max(prev+nums[i], nums[i])
        prev = curr
    }
    return curr
}
```

**二维DP模板：**

```go
// 背包问题
func knapSack(weights, values []int, capacity int) int {
    n := len(weights)
    dp := make([][]int, n+1)
    for i := range dp {
        dp[i] = make([]int, capacity+1)
    }

    for i := 1; i <= n; i++ {
        for j := 1; j <= capacity; j++ {
            if weights[i-1] <= j {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-weights[i-1]]+values[i-1])
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
    return dp[n][capacity]
}
```

**DP框架的记忆方式：**

```
解题四步骤：
1. 定义状态：dp[i]表示什么？
2. 状态初始化：dp[0]、dp[1]等初始值
3. 状态转移：dp[i] = ? dp[i-1], dp[i-2]...
4. 结果返回：dp[n] 或 dp的max/min

空间优化技巧：
- 只用到dp[i-1]和dp[i-2] → 优化为O(1)空间
- 只用到dp[i-1] → 优化为一维数组
```

### 2.5 BFS/DFS框架

图的遍历和树的遍历是面试基础。

**BFS框架：**

```go
// 层序遍历
func levelOrder(root *TreeNode) [][]int {
    if root == nil {
        return nil
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

**DFS框架：**

```go
// 递归DFS（先序）
func preorderTraversal(root *TreeNode) []int {
    result := []int{}
    var dfs func(node *TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        result = append(result, node.Val)  // 访问节点
        dfs(node.Left)
        dfs(node.Right)
    }
    dfs(root)
    return result
}
// 递归DFS（中序）
func inorderTraversal(root *TreeNode) []int {
    result := []int{}
    var dfs func(node *TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        result = append(result, node.Val)  // 访问节点
        dfs(node.Right)
    }
    dfs(root)
    return result
}
// 递归DFS（后序）
func postorderTraversal(root *TreeNode) []int {
    result := []int{}
    var dfs func(node *TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        dfs(node.Right)
        result = append(result, node.Val)  // 访问节点
    }
    dfs(root)
    return result
}

// 迭代DFS（使用栈）
func preorderIterative(root *TreeNode) []int {
    if root == nil {
        return nil
    }
    result := []int{}
    stack := []*TreeNode{root}

    for len(stack) > 0 {
        node := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        result = append(result, node.Val)
        // 右子树先入栈，保证左子树先被访问
        if node.Right != nil {
            stack = append(stack, node.Right)
        }
        if node.Left != nil {
            stack = append(stack, node.Left)
        }
    }
    return result
}
```

### 2.6 单调栈框架

单调栈用于解决"下一个更大/更小元素"类问题。

**单调递增栈：**

```go
// 找下一个更大的元素
func nextGreaterElement(nums []int) []int {
    n := len(nums)
    result := make([]int, n)
    stack := []int{}  // 存储索引，单调递增

    for i := n - 1; i >= 0; i-- {
        // 弹出所有小于等于当前元素的索引
        for len(stack) > 0 && nums[stack[len(stack)-1]] <= nums[i] {
            stack = stack[:len(stack)-1]
        }
        // 栈为空说明没有更大的元素
        if len(stack) == 0 {
            result[i] = -1
        } else {
            result[i] = nums[stack[len(stack)-1]]
        }
        // 当前索引入栈
        stack = append(stack, i)
    }
    return result
}
```

**单调递减栈：**

```go
// 每日温度（739）
func dailyTemperatures(temperatures []int) []int {
    n := len(temperatures)
    result := make([]int, n)
    stack := []int{}  // 存储索引，单调递减

    for i := 0; i < n; i++ {
        // 遇到比栈顶大的温度，弹出并计算天数
        for len(stack) > 0 && temperatures[i] > temperatures[stack[len(stack)-1]] {
            prevDay := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            result[prevDay] = i - prevDay
        }
        stack = append(stack, i)
    }
    // 剩余的栈中索引对应位置保持0
    return result
}
```

**单调栈框架的记忆方式：**

```
核心思想：栈中元素保持单调性
- 递增栈：用于找下一个更大的元素
- 递减栈：用于找下一个更小的元素

遍历方向：
- 从左到右：通常配合递减栈
- 从右到左：通常配合递增栈

处理逻辑：
"当前元素vs栈顶"：
- 如果当前更"大"：弹出栈顶并处理（找到了下一个更大）
- 入栈当前元素
```

---

## 第三部分：Hot 100 题目详细整理

本部分按照题型分类整理，每道题目包含：题目描述、思维引导、核心逻辑、解题框架、记忆方式和Go代码实现。

### 3.1 哈希表类题目

哈希表是最基础也最重要的数据结构，几乎每个题目都会用到。

---

#### 1. 两数之和（LeetCode 1）- 简单

**题目描述：**

给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target 的那 两个 整数，并返回它们的数组下标。你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。

**思维引导：**

这是一道经典的空间换时间题目。如果使用暴力枚举，时间复杂度是O(n²)。我们可以遍历数组一次，在遍历的过程中，用哈希表记录已经遍历过的元素及其索引。当遍历到当前元素 nums[i] 时，需要判断 target - nums[i] 是否在哈希表中。如果在，直接返回两个元素的索引。这种方法的时间复杂度是O(n)，空间复杂度是O(n)。

**核心逻辑：**

```
1. 创建空哈希表：map[int]int，key是元素值，value是索引
2. 遍历数组：
   - 计算 complement = target - nums[i]
   - 如果 complement 在哈希表中，直接返回两个索引
   - 否则将当前元素存入哈希表
3. 遍历结束无结果，返回空（题目保证有解）
```

**解题框架：**

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

**记忆方式：**

```
口诀："遍历查询两不误，边存边查效率高"
关键点：
- 一边遍历一边存入哈希表
- 不是先存再查，而是边存边查
- 这样可以保证不会使用同一个元素两次
```

**Go语法要点：**

- `m, ok := m[key]` 的两返回值语法
- 循环中使用 `range` 同时获取索引和值

---

#### 49. 字母异位词分组（LeetCode 49）- 中等

**题目描述：**

给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。字母异位词 是由重新排列源单词的所有字母得到的单词。

**思维引导：**

字母异位词的核心特征是：它们包含的字母完全相同，只是顺序不同。因此，如果我们把每个字符串中的字母排序，得到的标准化字符串就是相同的。例如："eat"、"ate"、"tea" 排序后都是 "aet"。我们可以利用这个特性，用排序后的字符串作为哈希表的key，将所有异位词聚合在一起。

**核心逻辑：**

```
1. 遍历字符串数组
2. 对每个字符串：
   - 转换为字符切片
   - 对字符切片排序
   - 将排序后的切片转为字符串作为key
3. 使用map[string][]string存储结果
4. 返回map的所有value
```

**解题框架：**

```go
func groupAnagrams(strs []string) [][]string {
    groups := make(map[string][]string)
    for _, s := range strs {
        // 转换为字节切片并排序
        bytes := []byte(s)
        sort.Slice(bytes, func(i, j int) bool {
            return bytes[i] < bytes[j]
        })
        key := string(bytes)
        groups[key] = append(groups[key], s)
    }

    // 提取结果
    result := make([][]int, 0, len(groups))
    for _, group := range groups {
        result = append(result, group)
    }
    return result
}
```

**记忆方式：**

```
口诀："异位词排序都一样，哈希聚合最方便"
关键点：
- 排序是核心，排序后的表示作为key
- map的value是切片数组，用于聚合
```

**Go语法要点：**

- `sort.Slice` 对字节切片排序
- `string([]byte{})` 字节切片转字符串

---

#### 128. 最长连续序列（LeetCode 128）- 中等

**题目描述：**

给定一个未排序的整数数组 nums，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。要求时间复杂度为 O(n)。

**思维引导：**

如果使用排序后遍历的方法，时间复杂度是 O(nlogn)，不符合要求。我们需要 O(n) 的解法。关键洞察是：对于一个连续序列，只有序列的第一个元素（最小值）才应该作为起点开始计数。如果 x-1 存在于数组中，那么 x 就不是起点。实现上，我们先用哈希表记录所有元素（O(n)），然后遍历哈希表，对于每个元素，如果 x-1 不存在，就从 x 开始向后找最长的连续序列。

**核心逻辑：**

```
1. 将所有元素存入哈希表（O(n)）
2. 遍历哈希表中的每个元素：
   - 如果 x-1 存在，跳过（x 不是起点）
   - 如果 x-1 不存在，从 x 开始向后找 y=x+1, y=x+2...
   - 更新最长长度
3. 返回最长长度
```

**解题框架：**

```go
func longestConsecutive(nums []int) int {
    if len(nums) == 0 {
        return 0
    }

    numSet := make(map[int]bool)
    for _, num := range nums {
        numSet[num] = true
    }

    longest := 0
    for num := range numSet {
        // 如果 num-1 存在，跳过（不是起点）
        if numSet[num-1] {
            continue
        }

        current := num
        length := 1
        for numSet[current+1] {
            current++
            length++
        }
        longest = max(longest, length)
    }

    return longest
}
```

**记忆方式：**

```
口诀："只从起点开始计，x-1存在就跳过"
关键点：
- 利用"只计起点"避免重复计算
- 先全部存入哈希表，O(n)构建
- 起点判断：x-1 是否存在
```

**Go语法要点：**

- `map[int]bool` 用于集合操作
- `for num := range numSet` 遍历map

---

### 3.2 双指针类题目

双指针技巧在数组类题目中应用广泛。

---

#### 283. 移动零（LeetCode 283）- 简单

**题目描述：**

给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。必须在不复制数组的情况下原地对数组进行操作。

**思维引导：**

使用快慢指针（同向双指针）。快指针遍历整个数组，慢指针指向下一个非零元素应该存放的位置。当快指针遇到非零元素时，将其赋值给慢指针位置，然后慢指针后移。最后，将慢指针之后的所有位置设为0。

**核心逻辑：**

```
1. 慢指针slow指向0位置
2. 快指针fast遍历数组：
   - 如果nums[fast] != 0：
     - nums[slow] = nums[fast]
     - slow++
3. slow之后的位置全部设为0
4. slow指针再这个过程中是被动的移动，fast指针是主动的移动
```

**解题框架：**

```go
func moveZeroes(nums []int) {
    slow := 0
    for fast := 0; fast < len(nums); fast++ {
        if nums[fast] != 0 {
            nums[slow] = nums[fast]
            slow++
        }
    }
    // 将剩余位置设为0
    for i := slow; i < len(nums); i++ {
        nums[i] = 0
    }
}
```

**记忆方式：**

```
口诀："快指针找非零，慢指针存位置"
关键点：
- 快指针负责遍历，慢指针负责定位
- 先移动非零元素，再补零
```

---

#### 11. 盛最多水的容器（LeetCode 11）- 中等

**题目描述：**

给定一个长度为 n 的整数数组 height。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i])。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。返回容器可以储存的最大水量。

**思维引导：**

使用对撞指针（相向双指针）。初始时左右指针分别在两端，每次移动较短边的指针。关键证明：如果移动较长的边，宽度减少而高度不会增加（因为受限于较短的边），面积一定减少；如果移动较短的边，虽然宽度减少，但高度可能增加，面积可能变大。因此每次移动较短的边是正确策略。

**核心逻辑：**

```
1. 左右指针分别指向两端
2. 循环直到左右指针相遇：
   - 计算当前面积：min(height[l], height[r]) * (r-l)
   - 更新最大面积
   - 移动较短的边的指针
```

**解题框架：**

```go
func maxArea(height []int) int {
    left, right := 0, len(height)-1
    maxArea := 0

    for left < right {
        // 计算面积
        area := min(height[left], height[right]) * (right - left)
        maxArea = max(maxArea, area)

        // 移动较短的边的指针
        if height[left] < height[right] {
            left++
        } else {
            right--
        }
    }

    return maxArea
}
```

**记忆方式：**

```
口诀："对撞指针两端开，短边移动求更优"
关键点：
- 每次移动较短的边
- 面积取决于较短的边的高度
```

---

#### 15. 三数之和（LeetCode 15）- 中等

**题目描述：**

给你一个整数数组 nums，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k，同时满足 nums[i] + nums[j] + nums[k] == 0。返回所有和为 0 且不重复的三元组。答案中不可以包含重复的三元组。

**思维引导：**

固定一个数，转换为两数之和问题。先对数组排序，然后固定第一个数 nums[i]，在剩余部分使用双指针寻找和为 -nums[i] 的两个数。关键是去重：跳过相同的 nums[i]，以及在找到结果后跳过相同的 nums[left] 和 nums[right]。

**核心逻辑：**

```
1. 排序数组
2. 遍历i从0到n-3：
   - 如果nums[i] > 0，直接break（后面都更大）
   - 如果i>0且nums[i]==nums[i-1]，continue（去重）
   - left = i+1, right = n-1
   - while left < right：
     - 如果三数之和为0，收集结果
     - 跳过相同的left和right
     - 否则移动指针
```

**解题框架：**

```go
func threeSum(nums []int) [][]int {
    //[排序]
    slices.Sort(nums)
    //初始化结果
    ans := make([][]int,0)
    n := len(nums)
    //遍历然后讨论情况
    for i:=0;i<n;i++{
        if nums[i]>0{
            break
        }
        if i>0 && nums[i-1]==nums[i]{
            continue
        }
        k,j := i+1,n-1
        for k < j {
            sum := nums[i] + nums[k] +nums[j]
            if sum < 0{
                k++
            }else if sum > 0 {
                j--
            }else{
                ans = append(ans,[]int{nums[i],nums[k],nums[j]})
                for k++;k<j && nums[k-1] == nums[k];k++{
                }
                for j--;k<j && nums[j+1] == nums[j];j--{
                }
            }
        }
    }
    return ans
}
```

**记忆方式：**

```
口诀："排序固定第一个，双指针对撞找另外"
关键点：
- 排序是前提
- 固定i，双指针找j和k
- 三重去重：i、left、right
```
**Go语法要点：**

- ` ans := make([][]int,0)` 用于存储结果,需要两个参数
- `sort.Ints(nums)` 对数组进行排序
- `slice.Sort(nums)` 对切片进行排序

---

#### 42. 接雨水（LeetCode 42）- 困难

**题目描述：**

给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

**思维引导：**

每个位置能接的雨水取决于它左右两边最高柱子的最小值（决定了水面高度）。有三种解法：1）预处理左右最大数组；2）双指针同步维护；3）单调栈。这里介绍前两种最常用的方法。主要是维护左右最大数组，然后遍历每个位置，计算它能接的雨水。

**核心逻辑（方法1 - 预处理）：**

```
1. 计算leftMax[i]：i位置左侧的最大高度
2. 计算rightMax[i]：i位置右侧的最大高度
3. 每个位置接水量：max(0, min(leftMax[i], rightMax[i]) - height[i])
```

**解题框架（方法1）：**

```go
func trap(height []int) int {
    sum := 0
    max_left :=0
    n := len(height)
    max_right := make([]int , n)
    for i := n-2;i>=0;i--{
        max_right[i]=max(max_right[i+1],height[i+1])
    }
    for i := 1;i < n-1;i++{
        max_left = max(max_left,height[i-1])
        minHeight := min(max_left,max_right[i])
        if minHeight > height[i]{
            sum += minHeight - height[i]
        }
    }
    return sum
}

```

**记忆方式：**

```
口诀："每个位置看两边，两边最大取最小"
关键点：
- 当前位置能接水 = min(左最大, 右最大) - 当前高度
- 预处理法：O(n)空间，O(n)时间
- 双指针法：O(1)空间
```

---
### 3.3 滑动窗口类题目

#### 3. 无重复字符的最长子串（LeetCode 3）- 中等

**题目描述：**

找出不含有重复字符的 最长子串 的长度。

**思维引导：**
哈希表存储此时的哈希表必须使用byte而不是rune，因为有非ASCII字符。
非固定窗口，循环直到遍历完成字符串，在遍历的过程中维护一个窗口，窗口内的字符不重复。
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
1. 初始化：cntP 统计 p 中字符频次，cntS 统计当前窗口字符频次
2. 滑动窗口：阶段1大小小于p的长度先持续扩张 阶段2右指针扩展窗口，左指针收缩窗口
3. 比较频次：如果 cntS == cntP，记录当前窗口起始索引所以需要left
**代码框架：**

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


### 3.4 子串类题目

子串类问题通常需要用到前缀和或滑动窗口技巧，是面试中的高频考点。

---

#### 560. 和为 K 的子数组（LeetCode 560）- 中等(需要加强记忆和理解)

**题目描述：**

给你一个整数数组 nums 和一个整数 k，请你统计并返回 该数组中和为 k 的连续子数组的个数。

**思维引导：**

使用前缀和 + 哈希表。遍历数组，计算当前位置的前缀和 pre[i]。对于当前位置，需要找之前的前缀和中是否存在 pre[i] - k 的值，因为 pre[i] - (pre[i] - k) = k。

**核心逻辑：**

```
1. 创建哈希表：key是前缀和，value是出现次数
2. 初始化：pre=0出现1次（空子数组）
3. 遍历数组：
   - 更新前缀和
   - 如果 pre - k 在哈希表中，累加出现次数
   - 更新 pre 的出现次数
4. 有点点类似于两数之和，但是这里是连续子数组，所以需要前缀和。在哈希表中找 pre[i] - k 是否存在，存在则累加出现次数。
```

**解题框架：**

```go
func subarraySum(nums []int, k int) int {
    count := 0
    pre := 0
    preCount := make(map[int]int)
    preCount[0] = 1

    for _, num := range nums {
        pre += num
        if cnt, ok := preCount[pre-k]; ok {
            count += cnt
        }
        preCount[pre]++
    }

    return count
}
```

**记忆方式：**

```
口诀："前缀和减K，次数加累积"
关键点：
- preCount[0] = 1初始化
- 核心公式：pre[i] - pre[j] = k → pre[j] = pre[i] - k
```

---

#### 239. 滑动窗口最大值（LeetCode 239）- 困难

**题目描述：**

给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到最右侧。你只需要返回每个滑动窗口的最大值。

**思维引导：**

使用单调递减队列（双端队列）。队列中存储数组索引，保证队列中的值递减。这样队首始终是当前窗口的最大值。

**核心逻辑：**

```
1. 创建双端队列deque
2. 遍历数组：
   - 移除队列中超出窗口范围的索引
   - 移除队列中比当前元素小的值（因为它们永远不会成为最大值）
   - 将当前元素索引加入队列
   - 当i >= k-1时，收集队首元素作为结果
```

**解题框架：**

```go
func maxSlidingWindow(nums []int, k int) []int {
    if len(nums) == 0 {
        return nil
    }

    result := []int{}
    deque := []int{}  // 存储索引

    for i := 0; i < len(nums); i++ {
        // 移除超出窗口范围的元素
        for len(deque) > 0 && deque[0] <= i-k {
            deque = deque[1:]
        }

        // 移除比当前元素小的元素
        for len(deque) > 0 && nums[deque[len(deque)-1]] < nums[i] {
            deque = deque[:len(deque)-1]
        }

        // 加入当前元素
        deque = append(deque, i)

        // 收集结果
        if i >= k-1 {
            result = append(result, nums[deque[0]])
        }
    }

    return result
}
```

**记忆方式：**

```
口诀："双端队列存索引，单调递减保最大"
关键点：
- 队首是最大值
- 每次移除：超范围的、比当前小的
```

---

#### 76. 最小覆盖子串（LeetCode 76）- 困难

**题目描述：**

给你一个字符串 s 和一个字符串 t。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，返回空字符串 ""。

**思维引导：**

使用滑动窗口 + 哈希表。维护窗口内字符计数，当窗口包含所有t的字符时，收缩左边界寻找最小窗口。

**核心逻辑：**

```
1. 统计t中各字符的数量 need[256]
2. 初始化windowCount[256]
3. 滑动窗口right从0到n-1：
   - 扩大窗口：将s[right]加入windowCount
   - 收缩窗口：当窗口包含所有字符时
     - 更新最小窗口和起始位置
     - 尝试左移left收缩窗口
4. 返回最小窗口（如果存在）
```

**解题框架：**

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
    formed := 0  // 窗口中满足条件的字符种类数
    required := 0 // 需要满足的字符种类数

    // 统计需要多少种字符
    for _, cnt := range need {
        if cnt > 0 {
            required++
        }
    }

    for right < len(s) {
        c := s[right]
        window[c]++

        // 如果当前字符满足需求
        if need[c] > 0 && window[c] == need[c] {
            formed++
        }

        // 当窗口包含所有字符时，收缩左边界
        for left <= right && formed == required {
            c := s[left]

            // 更新最小窗口
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

**记忆方式：**

```
口诀："双哈希表计数，需要种类formed判"
关键点：
- 需要统计：need类型数、formed已满足数
- 扩大右边界，缩小左边界
```

---

### 3.5 普通数组类题目

普通数组类题目涵盖数组的基本操作和常见技巧。

---
### 53. 最大子数组和
**题目描述**
给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
子数组是数组中的一个连续部分。
**思维引导：**
使用动态规划。定义dp[i]为以nums[i]结尾的最大子数组和。
状态转移方程为：dp[i] = max(nums[i], dp[i-1] + nums[i])
**核心逻辑：**

```
1. res = nums[0]
2. 遍历nums：
    - 如果nums[i-1]>0：nums[i] += nums[i-1]
    - 如果nums[i]>res：res = nums[i]
3. 返回res

```

**解题框架：**

```go
func maxSubArray(nums []int) int {
    res := nums[0]
    for i := 1;i<len(nums);i++{
        if nums[i-1]>0{
            nums[i] += nums[i-1];
        }
        if nums[i]>res {
            res = nums[i]
        }
    }
    return res
}
```

---

#### 56. 合并区间（LeetCode 56）- 中等

**题目描述：**

以数组 intervals 表示若干个区间的集合，其中每个区间 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。

**思维引导：**

先按区间的起始位置排序，然后遍历合并。

**核心逻辑：**

```
1. 按起始位置排序
2. 创建结果数组
3. 遍历每个区间：
   - 如果结果为空或当前区间与结果最后一个区间不重叠，添加当前区间
   - 否则合并：更新结果最后一个区间的结束位置
```

**解题框架：**

```go
func merge(intervals [][]int) [][]int {
    if len(intervals) == 0 {
        return nil
    }

    // 按起始位置排序
    sort.Slice(intervals, func(i, j int) bool {
        return intervals[i][0] < intervals[j][0]
    })

    result := [][]int{}
    for _, interval := range intervals {
        if len(result) == 0 || interval[0] > result[len(result)-1][1] {
            // 不重叠，添加新区间
            result = append(result, interval)
        } else {
            // 重叠，合并
            result[len(result)-1][1] = max(result[len(result)-1][1], interval[1])
        }
    }

    return result
}
```

**记忆方式：**

```
口诀："排序之后看结束，重叠合并更新值"
关键点：
- 按起始位置排序
- 当前起始 > 上一个结束 → 不重叠
```

---

#### 189. 轮转数组（LeetCode 189）- 中等

**题目描述：**

给定一个数组，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

**思维引导：**

使用三次反转。整体反转 → 反转前k个 → 反转剩余部分。

**核心逻辑：**

```
1. k %= n（取模）
2. 反转整个数组
3. 反转前k个元素
4. 反转剩余n-k个元素
```

**解题框架：**

```go
func rotate(nums []int, k int) {
    n := len(nums)
    k %= n
    if k == 0 {
        return
    }

    reverse(nums, 0, n-1)
    reverse(nums, 0, k-1)
    reverse(nums, k, n-1)
}

func reverse(nums []int, left, right int) {
    for left < right {
        nums[left], nums[right] = nums[right], nums[left]
        left++
        right--
    }
}
```

**记忆方式：**

```
口诀："整体反转前k个，剩余部分再反转"
关键点：
- k要取模
- 三次反转的顺序很重要
```

---

#### 238. 除自身以外数组的乘积（LeetCode 238）- 中等

**题目描述：**

给你一个整数数组 nums，返回一个数组 answer，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。请不要使用除法，且在 O(n) 时间复杂度内完成。

**思维引导：**

使用左右乘积数组。先计算每个位置左边所有元素的乘积，再计算右边所有元素的乘积，最后相乘。

**核心逻辑：**

```
1. 创建结果数组res
2. 第一遍遍历：左乘积数组pre[i] = pre[i-1] * nums[i-1] 初始化pre[0] = 1
3. 第二遍遍历：右乘积数组suf[i] = suf[i+1] * nums[i+1] 初始化suf[n-1] = 1
4. 第三遍遍历pre：ans[i] *= p*suf[i]
```

**解题框架：**

```go
//左右乘积数组，先做两步骤操作
func productExceptSelf(nums []int) []int {
    n := len(nums)
    pre := [n]int{}
    pre[0] = 1
    for i := 1;i<n;i++{
        pre[i]=pre[i-1]*nums[i-1]
    }
    suf := make([]int,n)
    suf [n-1] = 1
    for i := n-2;i >0 ; i--{
        suf[i]=suf[i+1]*nums[i+1]
    }
    ans := make([]int,n)
    for i , p := range pre{
        ans[i] = p*suf[i]
    }
    return ans
}
```

**记忆方式：**

```
口诀："左边乘积累积，右边乘积合并"
关键点：
- 两遍遍历
- product从右边开始累积
```

---

#### 41. 缺失的第一个正数（LeetCode 41）- 困难

**题目描述：**

给你一个未排序的整数数组 nums，请你找出其中没有出现的最小的正整数。要求时间复杂度 O(n) 和空间复杂度 O(1)。

**思维引导：**

利用原地哈希。将数字i放在位置i-1处，然后遍历找到第一个不在正确位置的数字。

**核心逻辑：**

```
1. 遍历一次，将所有在[1, n]范围内的数放到正确的位置
2. 再次遍历，找到第一个位置i不满足 nums[i] == i+1
3. 如果都满足，返回 n+1
```

**解题框架：**

```go
func firstMissingPositive(nums []int) int {
    n := len(nums)

    // 第一步：将所有在[1, n]范围内的数放到正确的位置
    for i := 0; i < n; i++ {
        // 注意：要在nums[i]在范围内且不在正确位置时才交换
        for nums[i] > 0 && nums[i] <= n && nums[nums[i]-1] != nums[i] {
            nums[i], nums[nums[i]-1] = nums[nums[i]-1], nums[i]
        }
    }

    // 第二步：找到第一个不在正确位置的数
    for i := 0; i < n; i++ {
        if nums[i] != i+1 {
            return i + 1
        }
    }

    return n + 1
}
```

**记忆方式：**

```
口诀："原地哈希放位置，不对就换直到对"
关键点：
- 只处理[1, n]范围内的数
- 循环交换直到该位置正确
```

---

### 3.6 矩阵类题目

矩阵类题目涉及二维数组的遍历和操作。

---

#### 73. 矩阵置零（LeetCode 73）- 中等

**题目描述：**

给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设置为 0。要求使用原地算法。

**思维引导：**

使用第一行和第一列作为标记，记录哪些行和列需要置零。先处理其他区域，最后处理第一行和第一列。

**核心逻辑：**

```
1. 标记第一行和第一列是否需要置零
2. 使用第一行和第一列标记其他区域
3. 根据标记置零其他区域
4. 根据标记置零第一行和第一列
```

**解题框架：**

```go
func setZeroes(matrix [][]int) {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return
    }

    m, n := len(matrix), len(matrix[0])
    firstRowZero := false
    firstColZero := false

    // 标记第一行和第一列
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

    // 使用第一行和第一列标记其他区域
    for i := 1; i < m; i++ {
        for j := 1; j < n; j++ {
            if matrix[i][j] == 0 {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    // 根据标记置零其他区域
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

    // 处理第一行和第一列
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

**记忆方式：**

```
口诀："行列标记分开记，最后处理第一行"
关键点：
- 先标记行列，再置零
- 最后处理第一行和第一列
```

---

#### 54. 螺旋矩阵（LeetCode 54）- 中等

**题目描述：**

给你一个 m 行 n 列的矩阵 matrix，按照顺时针螺旋顺序，返回矩阵中的所有元素。

**思维引导：**

模拟遍历过程。使用四个边界：上、下、左、右，每次按右→下→左→上的顺序遍历，缩小边界。

**核心逻辑：**

```
1. 初始化四个边界：top, bottom, left, right
2. while top <= bottom && left <= right：
   - 从左到右遍历上边界，top++
   - 从上到下遍历右边界，right--
   - 如果top <= bottom，从右到左遍历下边界，bottom--
   - 如果left <= right，从下到上遍历左边界，left++
```

**解题框架：**

```go
func spiralOrder(matrix [][]int) []int {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return nil
    }

    m, n := len(matrix), len(matrix[0])
    result := []int{}
    top, bottom := 0, m-1
    left, right := 0, n-1

    for top <= bottom && left <= right {
        // 左到右
        for j := left; j <= right; j++ {
            result = append(result, matrix[top][j])
        }
        top++

        // 上到下
        for i := top; i <= bottom; i++ {
            result = append(result, matrix[i][right])
        }
        right--

        // 右到左
        if top <= bottom {
            for j := right; j >= left; j-- {
                result = append(result, matrix[bottom][j])
            }
            bottom--
        }

        // 下到上
        if left <= right {
            for i := bottom; i >= top; i-- {
                result = append(result, matrix[i][left])
            }
            left++
        }
    }

    return result
}
```

**记忆方式：**

```
口诀："四边循环缩边界，顺时针转圈走"
关键点：
- 四步遍历：右、下、左、上
- 每步后缩小对应边界
- 注意边界条件检查
```

---

#### 48. 旋转图像（LeetCode 48）- 中等

**题目描述：**

给定一个 n × n 的二维矩阵 matrix 表示一个图像，请你将图像顺时针旋转 90 度。要求原地修改。

**思维引导：**

找到数字变化的规律，四个角对换一个tmp值作为中间，换完外面一圈换里面。做好映射处理

**核心逻辑：**

```
1. 两层遍历i，j，分别表示行和列
2. 水平翻转（上下翻转）：swap(matrix[i][j], matrix[n-1-i][j])
3. 主对角线翻转（左上到右下）：swap(matrix[i][j], matrix[j][i])
```

**解题框架：**

```go
//当时我记得绞尽脑汁做出来过，主要是找数字变化的规律，四个角对换一个tmp值作为中间，换完外面一圈换里面
func rotate(matrix [][]int)  {
    n := len(matrix[0])
    for i := 0;i<n/2;i++{
        for j := 0;j<(n+1)/2;j++{
            tmp := matrix[i][j]
            matrix[i][j] = matrix[n-1-j][i]
            matrix[n-1-j][i]=matrix[n-1-i][n-1-j]
            matrix[n-1-i][n-1-j] = matrix[j][n-1-i]
            matrix[j][n-1-i]=tmp
        }
    }
}
```

**记忆方式：**

```
口诀："先水平后对角，90度旋转成"
关键点：
- 水平翻转：swap(matrix[i][j], matrix[n-1-i][j])
- 对角翻转：swap(matrix[i][j], matrix[j][i])
```

---

#### 240. 搜索二维矩阵 II（LeCode 240）- 中等

**题目描述：**

编写一个高效的算法，从一个 n x m 的二维矩阵 matrix 中搜索目标值 target。该矩阵具有以下特性：每行的元素从左到右升序排列，每列的元素从上到下升序排列。

**思维引导：**

从右上角开始搜索。如果当前值大于target，向左移动；如果当前值小于target，向下移动。

**核心逻辑：**

```
1. 从右上角开始
2. while i在范围内且j >= 0：
   - 如果matrix[i][j] == target，返回true
   - 如果matrix[i][j] > target，j--
   - 如果matrix[i][j] < target，i++
3. 返回false
```

**解题框架：**

```go
func searchMatrix(matrix [][]int, target int) bool {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return false
    }

    m, n := len(matrix), len(matrix[0])
    i, j := 0, n-1  // 从右上角开始

    for i < m && j >= 0 {
        if matrix[i][j] == target {
            return true
        }
        if matrix[i][j] > target {
            j--
        } else {
            i++
        }
    }

    return false
}
```

**记忆方式：**

```
口诀："右上角开始搜，大了向左小了走"
关键点：
- 利用行递增、列递减的性质
- 每次排除一行或一列
```

---

### 3.7 链表类题目

链表题目需要熟练掌握指针操作。

---

#### 160. 相交链表（LeetCode 160）- 简单

**题目描述：**

给你两个单链表 headA 和 head，请你找出并返回两个单链表相交的起始节点。如果两个链表没有相交，则返回 null。

**思维引导：**

让两个指针分别遍历两个链表，当一方到达末尾时跳到另一条链表继续遍历。如果有交点，两个指针会在交点相遇。

**核心逻辑：**

```
1. pA遍历A，然后跳到B
2. pB遍历B，然后跳到A
3. 如果有交点，pA和pB会在交点相遇
4. 如果没有交点，两个指针都会变成nil
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func getIntersectionNode(headA, headB *ListNode) *ListNode {
    pA, pB := headA, headB

    for pA != pB {
        if pA != nil {
            pA = pA.Next
        } else {
            pA = headB
        }
        if pB != nil {
            pB = pB.Next
        } else {
            pB = headA
        }
    }

    return pA
}
```

**记忆方式：**

```
口诀："你走我来换条路，殊途同归在交点"
关键点：
- 两个指针都遍历两条链表
- 长度相等时同时到达终点或交点
```

---
#### 206. 反转链表（LeetCode 206）- 简单

**题目描述：**

反转链表并返回反转后的链表。

**思维引导：**

三指针反转。prev, curr, nextTemp。
和K个一组反转链表类似，只是每次反转的范围是整个链表。

**核心逻辑：**


**解题框架：**

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

---
#### 234. 回文链表（LeetCode 234）- 简单

**题目描述：**

给你一个单链表，判断该链表是否为回文链表。

**思维引导：**

使用快慢指针找到中点，然后反转后半部分，比较前后两部分。

**核心逻辑：**

```
1. 快慢指针找到中点
2. 反转后半部分链表
3. 比较前半部分和反转后的后半部分
4. 恢复链表（可选）
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func isPalindrome(head *ListNode) bool {
    if head == nil || head.Next == nil {
        return true
    }

    // 找到中点
    prev := &ListNode{Next: head}
    slow, fast := head, head
    for fast != nil && fast.Next != nil {
        prev = prev.Next
        slow = slow.Next
        fast = fast.Next.Next
    }

    // 反转后半部分
    prev.Next = nil
    right := reverseList(slow)

    // 比较
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

**记忆方式：**

```
口诀："快慢找中点，反转后一半"
关键点：
- 快慢指针找中点
- 反转后比较
```

---

#### 24. 两两交换链表中的节点（LeetCode 24）- 中等

**题目描述：**

给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

**思维引导：**

使用递归或迭代。迭代需要维护一个虚拟头节点，然后每次处理两个节点。

**核心逻辑（迭代）：**

```
1. dummy指向head
2. while还有两个节点需要交换：
   - 取出三个节点：prev, first, second
   - 交换：prev.Next = second, first.Next = second.Next, second.Next = first
   - prev移动到first位置
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func swapPairs(head *ListNode) *ListNode {
    dummy := &ListNode{Next: head}
    prev := dummy

    for prev.Next != nil && prev.Next.Next != nil {
        first := prev.Next
        second := first.Next

        // 交换
        prev.Next = second
        first.Next = second.Next
        second.Next = first

        // 移动prev
        prev = first
    }

    return dummy.Next
}
```

**记忆方式：**

```
口诀："dummy头结点，三个节点换位置"
关键点：
- 维护prev指针
- 每次处理一对节点
```

---

#### 25. K 个一组翻转链表（LeetCode 25）- 困难

**题目描述：**

给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。如果链表中的节点数不是 k 的整数倍，则最后剩余的节点保持原样。

**思维引导：**

递归或迭代。每次翻转k个节点，然后递归处理剩余部分。

**核心逻辑：**

```
1. 统计链表节点数量n
2. 初始化dummy头节点，和pre指针指向dummy，pre指针用来指向当前分组的前一个节点
3. 分层分组进行循环
4. 内层核心代码逻辑，进行翻转操作
        for j :=0;j < k-1 ;j++{
            //翻转k-1次
            // 1 2 3
            nxt := cur.Next
            cur.Next = cur.Next.Next
            nxt.Next = pre.Next
            pre.Next = nxt
        }
        //pre移动到当前分组的最后一个节点
        pre = cur
        //cur移动到下一个分组的第一个节点
        cur = cur.Next
5. 返回dummy.Next
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
//先写框架练手
//
func reverseKGroup(head *ListNode, k int) *ListNode {
    //1、统计数量便于分组
    cur := head 
    n := 0
    for cur != nil {
        cur = cur.Next
        n++
    }
    //涉及翻转所需的
    dummy := &ListNode{Next: head}
    pre := dummy
    cur = head
    //根据k进行分组
    for i := 0; i<n/k ; i++ {
        for j :=0;j < k-1 ;j++{
            //翻转k-1次
            // 1 2 3
            nxt := cur.Next
            cur.Next = cur.Next.Next
            nxt.Next = pre.Next
            pre.Next = nxt
        }
        pre = cur
        cur = cur.Next
    }
    return dummy.Next
}
```

**记忆方式：**

```
口诀："检查k个先翻转，递归处理后半段"
关键点：
- 先检查是否够k个
- 递归返回新头节点
```

---

#### 138. 随机链表的复制（LeetCode 138）- 中等

**题目描述：**

给定一个链表，每个节点包含一个随机指针，可以指向链表中的任意节点或空。深拷贝这个链表。

**思维引导：**

使用哈希表存储原节点到新节点的映射。第一遍创建新节点并建立映射，第二遍设置新节点的next和random指针。

**核心逻辑：**

```
1. 第一遍：遍历原链表，创建新节点，建立映射
2. 第二遍：设置新节点的next和random指针
```

**解题框架：**

```go
/**
 * Definition for a Node.
 * type Node struct {
 *     Val int
 *     Next *Node
 *     Random *Node
 * }
 */
func copyRandomList(head *Node) *Node {
    if head == nil {
        return nil
    }

    // 第一遍：创建新节点，建立映射
    cur := head
    mapping := make(map[*Node]*Node)
    for cur != nil {
        mapping[cur] = &Node{Val: cur.Val}
        cur = cur.Next
    }

    // 第二遍：设置next和random
    cur = head
    for cur != nil {
        if mapping[cur].Next = mapping[cur.Next]; mapping[cur.Next] != nil {
            mapping[cur].Next = mapping[cur.Next]
        }
        if mapping[cur].Random = mapping[cur.Random]; mapping[cur.Random] != nil {
            mapping[cur].Random = mapping[cur.Random]
        }
        cur = cur.Next
    }

    return mapping[head]
}
```

**记忆方式：**

```
口诀："哈希映射两遍历，创建设置分两边"
关键点：
- map存储原节点到新节点的映射
- 两遍遍历：创建+设置
```

---

#### 148. 排序链表（LeetCode 148）- 中等

**题目描述：**

给你链表的头节点 head，请按 升序 排列并返回排序后的链表。必须在 O(n log n) 时间复杂度和常数级空间复杂度下解决这个问题。

**思维引导：**

使用归并排序。自顶向下递归分割链表，自底向上合并排序。

**核心逻辑：**

```
1. 找到中点断开链表
2. 递归排序左右两部分
3. 合并两个排序好的链表
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func sortList(head *ListNode) *ListNode {
    if head == nil || head.Next == nil {
        return head
    }

    // 找到中点
    slow, fast := head, head.Next
    for fast != nil && fast.Next != nil {
        slow = slow.Next
        fast = fast.Next.Next
    }

    // 断开链表
    mid := slow.Next
    slow.Next = nil

    // 递归排序
    left := sortList(head)
    right := sortList(mid)

    // 合并
    return mergeTwoLists(left, right)
}

func mergeTwoLists(l1, l2 *ListNode) *ListNode {
    dummy := &ListNode{}
    cur := dummy

    for l1 != nil && l2 != nil {
        if l1.Val < l2.Val {
            cur.Next = l1
            l1 = l1.Next
        } else {
            cur.Next = l2
            l2 = l2.Next
        }
        cur = cur.Next
    }

    if l1 != nil {
        cur.Next = l1
    } else {
        cur.Next = l2
    }

    return dummy.Next
}
```

**记忆方式：**

```
口诀："找中点断开，递归排两边，归并合并好"
关键点：
- 快慢指针找中点
- 归并排序的链表实现
```

---

#### 23. 合并 K 个升序链表（LeetCode 23）- 困难

**题目描述：**

给你一个链表数组，每个链表都已经按升序排列。将所有链表合并成一个升序链表并返回。

**思维引导：**

使用最小堆（优先队列）合并。堆中保存每个链表的头节点，每次取出最小的节点。

**核心逻辑：**

```
1. 将所有链表头节点放入最小堆
2. 每次从堆中取出最小节点，接到结果链表
3. 将该链表的下一个节点放入堆中
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
type MinHeap []ListNode

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i].Val < h[j].Val }
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *MinHeap) Push(x interface{}) {
    *h = append(*h, x.(ListNode))
}
func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

func mergeKLists(lists []*ListNode) *ListNode {
    h := &MinHeap{}
    heap.Init(h)

    for _, list := range lists {
        if list != nil {
            heap.Push(h, *list)
        }
    }

    dummy := &ListNode{}
    cur := dummy

    for h.Len() > 0 {
        node := heap.Pop(h).(*ListNode)
        cur.Next = node
        cur = cur.Next
        if node.Next != nil {
            heap.Push(h, *node.Next)
        }
    }

    return dummy.Next
}
```

**记忆方式：**

```
口诀："堆放所有头，弹小接后面"
关键点：
- 最小堆维护当前最小节点
- 每次弹出最小的并加入下一个节点
```

---

#### 146. LRU 缓存（LeetCode 146）- 中等

**题目描述：**

请你设计并实现一个满足 LRU (最近最少使用) 缓存约束的数据结构。实现 LRUCache 类：get(key) 和 put(key, value) 操作。

**思维引导：**

使用哈希表 + 双向链表。哈希表提供 O(1) 查找，双向链表维护访问顺序。

**核心逻辑：**

```
1. 哈希表：key -> Node
2. 双向链表：维护访问顺序，头部是最近使用的，尾部是最久未使用的
3. get：返回value，将节点移到头部
4. put：插入或更新，将节点移到头部，超过容量时删除尾部
```

**解题框架：**

```go
type LRUCache struct {
    capacity int
    cache    map[int]*DLinkedNode
    head     *DLinkedNode
    tail     *DLinkedNode
}

type DLinkedNode struct {
    key, val  int
    prev, next *DLinkedNode
}

func Constructor(capacity int) LRUCache {
    lru := LRUCache{
        capacity: capacity,
        cache:    make(map[int]*DLinkedNode),
        head:     &DLinkedNode{},
        tail:     &DLinkedNode{},
    }
    lru.head.next = lru.tail
    lru.tail.prev = lru.head
    return lru
}

func (this *LRUCache) Get(key int) int {
    if node, ok := this.cache[key]; ok {
        this.moveToHead(node)
        return node.val
    }
    return -1
}

func (this *LRUCache) Put(key int, value int) {
    if node, ok := this.cache[key]; ok {
        node.val = value
        this.moveToHead(node)
    } else {
        newNode := &DLinkedNode{key: key, val: value}
        this.cache[key] = newNode
        this.addToHead(newNode)
        if len(this.cache) > this.capacity {
            removed := this.removeTail()
            delete(this.cache, removed.key)
        }
    }
}

func (this *LRUCache) addToHead(node *DLinkedNode) {
    node.prev = this.head
    node.next = this.head.next
    this.head.next.prev = node
    this.head.next = node
}

func (this *LRUCache) removeNode(node *DLinkedNode) {
    node.prev.next = node.next
    node.next.prev = node.prev
}

func (this *LRUCache) moveToHead(node *DLinkedNode) {
    this.removeNode(node)
    this.addToHead(node)
}

func (this *LRUCache) removeTail() *DLinkedNode {
    node := this.tail.prev
    this.removeNode(node)
    return node
}
```

**记忆方式：**

```
口诀："哈希链表双剑合，移动头部删尾巴"
关键点：
- 双向链表维护顺序
- 哈希表O(1)查找
```

---

### 3.8 二叉树类题目

二叉树是面试中的重点，需要熟练掌握DFS和BFS。

---

#### 101. 对称二叉树（LeetCode 101）- 简单

**题目描述：**

给你一个二叉树的根节点 root，检查它是否镜像对称。

**思维引导：**

递归比较左右子树是否对称：左子树的左和右子树的右比较，左子树的右和右子树的左比较。

**核心逻辑：**

```
isSymmetric(left, right):
  if left == nil && right == nil: return true
  if left == nil || right == nil: return false
  if left.Val != right.Val: return false
  return isSymmetric(left.Left, right.Right) && isSymmetric(left.Right, right.Left)
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isSymmetric(root *TreeNode) bool {
    return isMirror(root, root)
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

**记忆方式：**

```
口诀："左右互相比，外外内内要对称"
关键点：
- 递归比较：左的左vs右的右，左的右vs右的左
```

---

#### 543. 二叉树的直径（LeetCode 543）- 简单

**题目描述：**

给定一棵二叉树，返回这棵二叉树的直径长度。二叉树的直径是树中任意两个节点之间最长路径的长度。

**思维引导：**

直径 = 左子树最大深度 + 右子树最大深度。递归计算每个节点的左右子树深度，更新最大直径。

**核心逻辑：**

```
diameter(node):
  if node == nil: return 0, 0
  leftDepth, leftDiameter = diameter(node.Left)
  rightDepth, rightDiameter = diameter(node.Right)
  currentDiameter = leftDepth + rightDepth
  return max(leftDepth, rightDepth) + 1, max(currentDiameter, leftDiameter, rightDiameter)
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func diameterOfBinaryTree(root *TreeNode) int {
    maxDiameter := 0

    var depth func(node *TreeNode) int
    depth = func(node *TreeNode) int {
        if node == nil {
            return 0
        }

        leftDepth := depth(node.Left)
        rightDepth := depth(node.Right)

        // 更新最大直径（左子树深度 + 右子树深度）
        maxDiameter = max(maxDiameter, leftDepth+rightDepth)

        return max(leftDepth, rightDepth) + 1
    }

    depth(root)
    return maxDiameter
}
```

**记忆方式：**

```
口诀："直径等于左右深度的和"
关键点：
- 后序遍历
- 实时更新最大直径
```

---

#### 108. 将有序数组转换为二叉搜索树（LeetCode 108）- 简单

**题目描述：**

给你一个升序整数数组 nums，将其转换为高度平衡的二叉搜索树（BST）。

**思维引导：**

取中间元素作为根节点，递归构造左右子树。保证高度平衡。

**核心逻辑：**

```
1. 取中间元素作为根节点
2. 递归构造左右子树
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func sortedArrayToBST(nums []int) *TreeNode {
    return helper(nums, 0, len(nums)-1)
}

func helper(nums []int, left, right int) *TreeNode {
    if left > right {
        return nil
    }

    mid := (left + right) / 2
    node := &TreeNode{Val: nums[mid]}
    node.Left = helper(nums, left, mid-1)
    node.Right = helper(nums, mid+1, right)

    return node
}
```

**记忆方式：**

```
口诀："中间节点当根，左边左子树，右边右子树"
关键点：
- 取中间位置
- 递归构造
```

---

#### 98. 验证二叉搜索树（LeetCode 98）- 中等

**题目描述：**

给你一个二叉树的根节点 root，判断其是否是一个有效的二叉搜索树（BST）。

**思维引导：**

BST的中序遍历是递增序列。在递归验证时维护上下界。

**核心逻辑：**

```
isValid(node, min, max):
  if node == nil: return true
  if (min != nil && node.Val <= min.Val) || (max != nil && node.Val >= max.Val):
    return false
  return isValid(node.Left, min, node) && isValid(node.Right, node, max)
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
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

**记忆方式：**

```
口诀："中序递增有上下界，左小右大要牢记"
关键点：
- 递归传递上下界
- 左子树上界是当前节点，右子树下界是当前节点
```

---

#### 230. 二叉搜索树中第 K 小的元素（LeetCode 230）- 中等

**题目描述：**

给定一个二叉搜索树 root，返回树中第 k 小的元素。

**思维引导：**

利用BST中序遍历是递增序列的性质。使用计数器记录已访问的节点数。

**核心逻辑：**

```
中序遍历，计数到k时返回
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func kthSmallest(root *TreeNode, k int) int {
    count := 0
    result := 0

    var dfs func(node *TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        count++
        if count == k {
            result = node.Val
            return
        }
        dfs(node.Right)
    }

    dfs(root)
    return result
}
```

**记忆方式：**

```
口诀："中序遍历数一数，数到k就返回"
关键点：
- 中序遍历的k个节点就是第k小
```

---

#### 199. 二叉树的右视图（LeetCode 199）- 中等

**题目描述：**

给定一个二叉树，想象你站在它的右侧，返回你能看到的节点值列表。

**思维引导：**

层序遍历，每层只取最后一个节点。

**核心逻辑：**

```
BFS层序遍历，每层最后一个节点就是右视图
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func rightSideView(root *TreeNode) []int {
    if root == nil {
        return nil
    }

    result := []int{}
    queue := []*TreeNode{root}

    for len(queue) > 0 {
        levelSize := len(queue)
        for i := 0; i < levelSize; i++ {
            node := queue[0]
            queue = queue[1:]

            if i == levelSize-1 {
                result = append(result, node.Val)
            }
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
    }

    return result
}
```

**记忆方式：**

```
口诀："层序遍历只取每层最后"
关键点：
- BFS遍历
- 每层最后一个节点
```

---

#### 114. 扁平化二叉树为链表（LeetCode 114）- 中等

**题目描述：**

给你一个二叉树，原地将其展开为链表。展开后的链表应该遵循二叉树的前序遍历的顺序。

**思维引导：**

使用右指针作为next指针。前序遍历后，右子树应该接到左子树最右节点的后面。

**核心逻辑：**

```
1. 前序遍历：右左根
2. 递归处理左子树，将其展开为链表
3. 递归处理右子树，将其展开为链表
4. 将左子树链表接到根节点的右指针后面
5. 将右子树链表接到左子树链表的最后面
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func flatten(root *TreeNode) {
    if root == nil {
        return
    }
    var head *TreeNode
    // 后序遍历
    var dfs func(node *TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        dfs(node.Right)
        node.Left = nil
        node.Right = head
        head = node
    }
    dfs(root)
}
```

**记忆方式：**

```
口诀："左子树移到右边，右子树接左子树末尾"
关键点：
- 后序遍历处理
- 找到左子树最右节点
```

---

#### 105. 从前序和中序遍历序列构造二叉树（LeetCode 105）- 中等

**题目描述：**

给定两个整数数组 preorder 和 inorder，请从前序和中序遍历序列构造二叉树。

**思维引导：**

前序的第一个元素是根节点。在中序中找到根节点，左边是左子树，右边是右子树。递归构建。

**核心逻辑：**

```
build(preStart, preEnd, inStart, inEnd):
  if preStart > preEnd: return nil
  rootVal = preorder[preStart]
  root = new TreeNode(rootVal)
  idx = inorder中rootVal的位置
  leftSize = idx - inStart
  root.Left = build(preStart+1, preStart+leftSize, inStart, idx-1)
  root.Right = build(preStart+leftSize+1, preEnd, idx+1, inEnd)
  return root
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func buildTree(preorder, inorder []int) *TreeNode {
    if len(preorder) == 0 {
        return nil
    }

    // 建立中序值到索引的映射
    inMap := make(map[int]int)
    for i, v := range inorder {
        inMap[v] = i
    }

    var helper func(preStart, preEnd, inStart, inEnd int) *TreeNode
    helper = func(preStart, preEnd, inStart, inEnd int) *TreeNode {
        if preStart > preEnd {
            return nil
        }

        rootVal := preorder[preStart]
        root := &TreeNode{Val: rootVal}
        idx := inMap[rootVal]
        leftSize := idx - inStart

        root.Left = helper(preStart+1, preStart+leftSize, inStart, idx-1)
        root.Right = helper(preStart+leftSize+1, preEnd, idx+1, inEnd)

        return root
    }

    return helper(0, len(preorder)-1, 0, len(inorder)-1)
}
```

**记忆方式：**

```
口诀："前序首元素是根，中序左右分两边"
关键点：
- 前序确定根
- 中序确定左右子树范围
```

---

#### 437. 路径总和 III（LeetCode 437）- 中等

**题目描述：**

给定一个二叉树的根节点 root 和一个整数 targetSum，返回路径和等于 targetSum 的路径的数目。路径不需要从根节点开始，也不需要在叶子节点结束，但路径方向必须是向下的。

**思维引导：**

使用前缀和 + 哈希表。前缀和是从根到当前节点的路径和。对于每个节点，需要找之前的前缀和中是否存在 currSum - target。

**核心逻辑：**

```
DFS遍历，维护当前路径和
使用map记录前缀和出现的次数
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func pathSum(root *TreeNode, targetSum int) int {
    preSum := make(map[int]int)
    preSum[0] = 1

    var dfs func(node *TreeNode, currSum int) int
    dfs = func(node *TreeNode, currSum int) int {
        if node == nil {
            return 0
        }

        currSum += node.Val
        count := preSum[currSum-targetSum]
        preSum[currSum]++
        count += dfs(node.Left, currSum)
        count += dfs(node.Right, currSum)
        preSum[currSum]--

        return count
    }

    return dfs(root, 0)
}
```

**记忆方式：**

```
口诀："前缀和减目标，次数累加记得回"
关键点：
- 前缀和概念
- 递归前后维护哈希表
```

---

#### 124. 二叉树中的最大路径和（LeetCode 124）- 困难

**题目描述：**

二叉树中的路径 被定义为一条节点序列，序列中每对相邻节点之间都有一条边相连。路径至少包含一个节点，且不一定经过根节点。返回最大的路径和。

**思维引导：**

后序遍历。对于每个节点，最大贡献值 = max(0, 左贡献 + 节点值, 右贡献 + 节点值)。路径和 = 左贡献 + 节点值 + 右贡献。

**核心逻辑：**

```
maxPathSum(node):
  if node == nil: return 0
  leftGain = max(0, maxPathSum(node.Left))
  rightGain = max(0, maxPathSum(node.Right))
  currentPath = node.Val + leftGain + rightGain
  update global max
  return node.Val + max(leftGain, rightGain)
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxPathSum(root *TreeNode) int {
    maxSum := math.MinInt

    var maxGain func(node *TreeNode) int
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

**记忆方式：**

```
口诀："左右贡献加本身，子路径和不小于0"
关键点：
- 贡献值要>=0
- 左右都可以贡献
```

---

### 3.9 图论与回溯类题目

图论与回溯类题目涉及图的遍历和搜索问题。

---

#### 200. 岛屿数量（LeetCode 200）- 中等

**题目描述：**

给你一个由 '1'（陆地）和 '0'（水）组成的二维网格，请你计算网格中岛屿的数量。岛屿总是被水包围，并且每座岛屿只能由水平方向或垂直方向上相邻的陆地连接。

**思维引导：**

使用DFS或BFS遍历网格。每遇到一个'1'，就将其周围相连的陆地都标记为已访问（改为'0'），岛屿数量加一。

**核心逻辑：**

```
遍历每个格子：
  如果是'1'：
    岛屿数量++
    将该岛屿的所有陆地标记为'0'（DFS/BFS）
```

**解题框架：**

```go
func numIslands(grid [][]byte) int {
    if len(grid) == 0 || len(grid[0]) == 0 {
        return 0
    }

    m, n := len(grid), len(grid[0])
    count := 0

    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == '1' {
                count++
                dfs(grid, i, j, m, n)
            }
        }
    }

    return count
}

func dfs(grid [][]byte, i, j, m, n int) {
    if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != '1' {
        return
    }

    grid[i][j] = '0'
    dfs(grid, i+1, j, m, n)
    dfs(grid, i-1, j, m, n)
    dfs(grid, i, j+1, m, n)
    dfs(grid, i, j-1, m, n)
}
```

**记忆方式：**

```
口诀："遇到陆地就计数，沉没四周变水域"
关键点：
- 标记已访问
- 四个方向DFS
```

---

#### 994. 腐烂的橘子（LeetCode 994）- 中等

**题目描述：**

在给定的网格中，每个单元格可以处于三种状态之一：空单元格为0，新鲜橘子为1，腐烂橘子为2。每分钟，腐烂的橘子会腐烂其相邻（上下左右）的新鲜橘子。返回直到没有新鲜橘子为止所需的最少分钟数。

**思维引导：**

使用BFS多源扩散。将所有腐烂橘子加入队列，模拟扩散过程，记录时间和层数。

**核心逻辑：**

```
1. 将所有腐烂橘子加入队列，记录层数
2. BFS遍历：
和二叉树的层序遍历类似，但是需要维护一个队列，每次取出当前层的所有橘子，然后腐烂其相邻的新鲜橘子。
在此处的当前层指的是还有能力腐烂别的橘子的层。因为一次四个方向腐烂完之后，当前橙子已经没有新的可以腐烂的橘子了。
   - 队列非空且新鲜橘子存在
   - 取出当前层所有橘子
   - 腐烂周围的新鲜橘子
   - 层数++
3. 记录分钟数
```

**解题框架：**

```go
func orangesRotting(grid [][]int) int {
    m, n := len(grid), len(grid[0])
    queue := [][2]int{}
    fresh := 0

    // 初始化：找到所有腐烂橘子
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 2 {
                queue = append(queue, [2]int{i, j})
            } else if grid[i][j] == 1 {
                fresh++
            }
        }
    }

    minutes := 0
    directions := [][2]int{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}

    // BFS
    for len(queue) > 0 && fresh > 0 {
        levelSize := len(queue)
        for i := 0; i < levelSize; i++ {
            cur := queue[0]
            queue = queue[1:] // 取出当前层的所有橘子 避免重复处理浪费

            for _, d := range directions {
                ni, nj := cur[0]+d[0], cur[1]+d[1]
                if ni >= 0 && ni < m && nj >= 0 && nj < n && grid[ni][nj] == 1 {
                    grid[ni][nj] = 2
                    fresh--
                    queue = append(queue, [2]int{ni, nj})
                }
            }
        }
        minutes++
    }

    if fresh > 0 {
        return -1
    }
    return minutes
}
```

**记忆方式：**

```
口诀："多源BFS层遍历，层层腐烂计时间"
关键点：
- 多源BFS
- 按层处理
```

---

#### 46. 全排列（LeetCode 46）- 中等

**题目描述：**

给定一个不含重复数字的数组 nums，返回其所有可能的全排列。

**思维引导：**

使用回溯算法。维护路径和已使用标记，遍历所有可能的排列。

**核心逻辑：**

```
backtrack(path, used):
  if len(path) == len(nums):
    记录结果
    return
  for i in range(len(nums)):
    if used[i]: continue
    used[i] = true
    path.push(nums[i])
    backtrack(path, used)
    path.pop()
    used[i] = false
```

**解题框架：**

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

**记忆方式：**

```
口诀："选择用完就撤销，路径复制记结果"
关键点：
- 标记已使用
- 路径要复制
```

---

#### 78. 子集（LeetCode 78）- 中等

**题目描述：**

给你一个整数数组 nums，返回该数组所有可能的子集（幂集）。

**思维引导：**

每个元素都有选或不选两种状态，共2^n种子集。使用回溯或位运算。

**核心逻辑：**

```
backtrack(start, path):
  记录path
  for i from start to n-1:
    path.push(nums[i])
    backtrack(i+1, path)
    path.pop()
```

**解题框架：**

```go
func subsets(nums []int) [][]int {
    res := [][]int{}
    path := []int{}

    var dfs func(int)
    dfs = func(start int) {
        // 记录当前子集
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

**记忆方式：**

```
口诀："每个元素选或不选，子集收集要趁早"
关键点：
- 先收集当前子集
- 再递归后续元素
```

---

#### 17. 电话号码的字母组合（LeetCode 17）- 中等

**题目描述：**

给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。映射关系类似于电话按键。

**思维引导：**

回溯遍历每个数字的字母组合。

**核心逻辑：**

```
backtrack(index, path):
  if index == len(digits):
    记录结果
    return
  for c in letters[digits[index]]:
    path.push(c)
    backtrack(index+1, path)
    path.pop()
```

**解题框架：**

```go
func letterCombinations(digits string) []string {
    if len(digits) == 0 {
        return nil
    }

    phone := map[byte]string{
        '2': "abc", '3': "def", '4': "ghi", '5': "jkl",
        '6': "mno", '7': "pqrs", '8': "tuv", '9': "wxyz",
    }

    res := []string{}
    path := []byte{}

    var dfs func(int)
    dfs = func(index int) {
        if index == len(digits) {
            res = append(res, string(path))
            return
        }

        for _, c := range phone[digits[index]] {
            path = append(path, byte(c))
            dfs(index + 1)
            path = path[:len(path)-1]
        }
    }

    dfs(0)
    return res
}
```

**记忆方式：**

```
口诀："数字对应字母串，层层组合终成型"
关键点：
- 映射表
- 递归组合
```

---

#### 39. 组合总和（LeetCode 39）- 中等

**题目描述：**

给定一个无重复元素的数组 candidates 和一个目标数 target，找出 candidates 中所有可以使数字和为 target 的组合。candidates 中的数字可以无限制重复使用。

**思维引导：**

回溯。排序后，从当前索引开始，可以重复选同一元素。

**核心逻辑：**

```
backtrack(start, remaining):
  if remaining == 0:
    记录结果
    return
  for i from start to len(candidates):
    if candidates[i] > remaining: break
    path.push(candidates[i])
    backtrack(i, remaining - candidates[i])
    path.pop()
```

**解题框架：**

```go
func combinationSum(candidates []int, target int) [][]int {
    sort.Ints(candidates)
    res := [][]int{}
    path := []int{}

    var dfs func(int, int)
    dfs = func(start, remaining int) {
        if remaining == 0 {
            tmp := make([]int, len(path))
            copy(tmp, path)
            res = append(res, tmp)
            return
        }

        for i := start; i < len(candidates); i++ {
            if candidates[i] > remaining {
                break
            }
            path = append(path, candidates[i])
            dfs(i, remaining-candidates[i])
            path = path[:len(path)-1]
        }
    }

    dfs(0, target)
    return res
}
```

**记忆方式：**

```
口诀："排序剪枝去重复，组合可以重复选"
关键点：
- 排序
- 可重复选所以传i
```

---

#### 22. 括号生成（LeetCode 22）- 中等

**题目描述：**

给定 n 对括号，生成所有有效且不重复的括号组合。

**思维引导：**

回溯。跟踪左右括号的数量，保证左括号数始终>=右括号数。

**核心逻辑：**

```
backtrack(left, right, path):
  if left == 0 && right == 0:
    记录结果
    return
  if left > 0:
    path.push('(')
    backtrack(left-1, right, path)
    path.pop()
  if right > left:
    path.push(')')
    backtrack(left, right-1, path)
    path.pop()
```

**解题框架：**

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

**记忆方式：**

```
口诀："左括号随便加，右括号看左边"
关键点：
- 左始终可以加
- 右只能在左>0时加
```

---
---

#### 79.单词搜索（LeetCode 79）- 中等

**题目描述：**

给定一个 m x n 二维字符网格 board 和一个字符串单词 word。如果 word 存在于网格中，返回 true；否则，返回 false。

**思维引导：**

回溯。从每个单元格开始，向四个方向递归搜索。
优化：
- 倒序搜索，先找匹配的再递归
- 边界检查
- 已访问标记

**核心逻辑：**

```
backtrack(left, right, path):
  if left == 0 && right == 0:
    记录结果
    return
  if left > 0:
    path.push('(')
    backtrack(left-1, right, path)
    path.pop()
  if right > left:
    path.push(')')
    backtrack(left, right-1, path)
    path.pop()
```

**解题框架：**

```go
//动态规划
//优化方式就开始寻找的字母
//看起来像是
var DIR = [4][2]int{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}
func exist(board [][]byte, word string) bool {
	m, n := len(board), len(board[0])
	
	// 优化一：字符计数预检
	// 如果 board 中的某个字符数量少于 word 所需，直接返回 false
	cnt := make(map[byte]int)
	for i := 0; i < m; i++ {
		for j := 0; j < n; j++ {
			cnt[board[i][j]]++
		}
	}
	
	wordCnt := make(map[byte]int)
	for i := 0; i < len(word); i++ {
		wordCnt[word[i]]++
		if wordCnt[word[i]] > cnt[word[i]] {
			return false
		}
	}

	// 优化二：从稀有字符一端开始搜索
	// 如果 word 尾部字符在棋盘中更少，反转字符串以减少搜索分支
	wordBytes := []byte(word)
	if cnt[wordBytes[len(wordBytes)-1]] < cnt[wordBytes[0]] {
		slices.Reverse(wordBytes)
	}

    //核心逻辑部分
	// DFS 深度优先搜索
    //参数：i,j,k 分别表示当前搜索的单元格坐标和 word 中匹配的字符索引
    //case 1: 如果当前单元格字符不匹配 word[k]，直接返回 false
    //case 2: 如果 k 等于 word 长度减一，说明所有字符都匹配，返回 true
	var dfs func(i, j, k int) bool
	dfs = func(i, j, k int) bool {
		if board[i][j] != wordBytes[k] {
			return false
		}
		if k == len(wordBytes)-1 {
			return true
		}
		// 标记已访问（回溯法）
		temp := board[i][j]
		board[i][j] = 0 // 标记为已访问
		// 递归搜索四个方向，偏向于模板类操作，
		// 先判断是否越界，再判断是否匹配，最后递归，遍历四个方向类似的题目有岛屿数量、腐烂橘子、
		for _, d := range DIR {
			x, y := i+d[0], j+d[1]
			if x >= 0 && x < m && y >= 0 && y < n {
				if dfs(x, y, k+1) {
					return true
				}
			}
		}
		
		// 还原状态
		board[i][j] = temp
		return false
	}

	// 遍历起点，从每个单元格开始搜索
	for i := 0; i < m; i++ {
		for j := 0; j < n; j++ {
			if dfs(i, j, 0) {
				return true
			}
		}
	}

	return false
}

```
口诀：
**口诀：**  
“字符计数先预检，稀有端头倒序搜；四向 DFS 标记访，回溯还原莫遗忘。”

**语法知识小结：**  
1. 预检优化：  
   `cnt := make(map[byte]int)`  // 哈希表 O(1) 查/增  
   遍历 board 填表，再遍历 word 做差，不足直接 `return false`。

2. 倒序搜索：  
   `wordBytes := []byte(word)`  
   `if cnt[wordBytes[len(wordBytes)-1]] < cnt[wordBytes[0]] { slices.Reverse(wordBytes) }`  
   利用标准库 `slices.Reverse` 减少分支，注意仅当尾字符更稀少才反转。

3. 四向 DFS：  
   `var DIR = [4][2]int{{0,1},{0,-1},{1,0},{-1,0}}`  // 方向数组模板  
   边界条件一句判断：  
   `if x >= 0 && x < m && y >= 0 && y < n { ... }`

4. 回溯状态还原：  
   临时占位 `board[i][j] = 0` 表示已访问，递归后必须 `board[i][j] = temp` 回写，防止污染其他分支。

5. 提前剪枝：  
   字符频次不足或越界立即剪枝，保证平均复杂度接近 O(M×N×4^L)。

```
**语法知识小结：**  
1. slices.Reverse：  
   标准库 `slices.Reverse` 可以在 O(n) 时间内反转切片，非常方便。
2. wordBytes := []byte(word)  
   将字符串转换为字节切片，方便后续操作。
3. 四向 DFS 模板：  
   `for _, d := range DIR { x, y := i+d[0], j+d[1]; if ... { ... } }`  
   遍历四个方向，判断是否越界和匹配，是则递归。

---

### 3.10 二分查找类题目
1. left, right = -1, 0（初始化）
2. 用map记录字符最后出现的位置
3. 遍历right：
   - 如果字符已存在且位置 > left：
     left = 字符上次出现的位置
   - 更新字符位置
   - 更新最大长度
```

**解题框架：**

```go
func lengthOfLongestSubstring(s string) int {
    charPos := make(map[byte]int)
    left, maxLen := -1, 0

    for right := 0; right < len(s); right++ {
        c := s[right]
        // 如果字符在窗口内出现过，收缩左边界
        if pos, ok := charPos[c]; ok && pos > left {
            left = pos
        }
        // 更新字符位置
        charPos[c] = right
        // 更新最大长度
        maxLen = max(maxLen, right-left)
    }

    return maxLen
}
```

**记忆方式：**

```
口诀："左右指针滑窗口，遇到重复跳左边"
关键点：
- left初始化为-1
- 遇到重复时，left跳到上次位置+1
- maxLen = right - left
```

---

#### 438. 找到字符串中所有字母异位词（LeetCode 438）- 中等
和无重复字符的最长子串（LeetCode 3）- 中等 类似差点给我搞混了
**题目描述：**

给定两个字符串 s 和 p，找到 s 中所有 p 的异位词的子串，返回这些子串的起始索引。

**思维引导：**

固定大小的滑动窗口。由于异位词包含的字母及数量完全相同，我们可以维护一个长度为26的计数数组，对比窗口内的字母频次和p的字母频次是否相同。由于是定长窗口（len(p)），我们可以优化为滑动时只更新首尾字符的计数。

**核心逻辑：**

```
1. 统计p的字母频次：cntP[26]
2. 初始化s的前len(p)个字符的频次：cntS[26]
3. 如果cntS == cntP，添加起始位置0
4. 滑动窗口，每次：
   - 加入新字符（右端）
   - 移除旧字符（左端）
   - 比较频次，相等则添加位置
```

**解题框架：**

```go
// 滑动窗口和字符串还有哈希（用数组进行优化）
func findAnagrams(s string, p string) []int {
    cntP := [26]int{}
    cntS := [26]int{}
    for _,c := range p {
        cntP[c-'a']++
    }
    ans := []int{}
    for right ,c := range s {
        cntS[c-'a']++
        left := right - len(p) + 1
        if left < 0 {   
            continue
        }
        if cntS == cntP {
            ans = append(ans,left)
        }
        cntS[s[left]-'a']--
    }
    return ans
}
```

**记忆方式：**

```
口诀："定长窗口滑滑走，频次比较是核心"
关键点：
- 窗口大小固定为len(p)
- 26个字母用数组计数
- Go中数组可以直接比较
```

---

### 3.4 链表类题目

链表题目需要熟练掌握指针操作。

---

#### 206. 反转链表（LeetCode 206）- 简单

**题目描述：**

给你单链表的头节点 head，请反转链表，并返回反转后的链表。

**思维引导：**

使用迭代法反转链表。核心是改变每个节点的next指针指向其前一个节点。需要三个指针：prev（指向前一个节点）、curr（当前节点）、nextTemp（保存下一个节点）。

**核心逻辑：**

```
1. prev = nil, curr = head
2. while curr != nil：
   - nextTemp = curr.next
   - curr.next = prev
   - prev = curr
   - curr = nextTemp
3. 返回prev（新的头节点）
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
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

**记忆方式：**

```
口诀："prev curr next，三指针反转链表"
关键点：
- nextTemp保存下一个节点
- curr.Next指向prev（反转）
- 三个指针同步后移
```

---

#### 141. 环形链表（LeetCode 141）- 简单

**题目描述：**

给你一个链表的头节点 head，判断链表中是否有环。如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。

**思维引导：**

使用快慢指针（Floyd判圈算法）。慢指针每次走一步，快指针每次走两步。如果链表中存在环，快慢指针一定会在环内相遇。如果不存在环，快指针会先到达链表末尾。

**核心逻辑：**

```
1. 循环的判断条件是 fast != nil && fast.Next != nil 判断快指针是否到达链表末尾
2. 如果快指针先到达末尾，说明链表无环
3. 如果快指针和慢指针相遇，说明链表有环
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func hasCycle(head *ListNode) bool {
    slow, fast := head, head

    for fast != nil && fast.Next != nil {
        slow = slow.Next
        fast = fast.Next.Next

        if slow == fast {
            return true
        }
    }

    return false
}
```

**记忆方式：**

```
口诀："快慢指针跑圈赛，相遇就是有环在"
关键点：
- 快指针每次两步，慢指针每次一步
- 循环条件：快指针和快指针的下一个都不为空
```

---

#### 142. 环形链表 II（LeetCode 142）- 中等

**题目描述：**

给定一个链表的头节点 head，返回链表开始入环的第一个节点。如果链表无环，则返回 null。

**思维引导：**

使用Floyd判圈算法的第二阶段。当快慢指针在环内相遇后，将其中一个指针移回链表头部，然后两个指针都以每次一步的速度前进，再次相遇的位置就是环的入口。

**核心逻辑：**

```
1. 第一阶段：快慢指针找到相遇点
2. 第二阶段：
   - slow移回head
   - slow和fast都以每次一步前进
   - 再次相遇的位置就是环入口
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func detectCycle(head *ListNode) *ListNode {
    slow, fast := head, head

    // 第一阶段：找到相遇点
    for fast != nil && fast.Next != nil {
        slow = slow.Next
        fast = fast.Next.Next
        if slow == fast {
            break
        }
    }

    // 无环
    if fast == nil || fast.Next == nil {
        return nil
    }

    // 第二阶段：找到环入口
    slow = head
    for slow != fast {
        slow = slow.Next
        fast = fast.Next
    }

    return slow
}
```

**记忆方式：**

```
口诀："快慢相遇不算完，指针重置再相见"
关键点：
- 第一阶段找到相遇点
- 第二阶段slow重置，两者同步前进
- 再次相遇即为入口
```

---

#### 21. 合并两个有序链表（LeetCode 21）- 简单

**题目描述：**

将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

**思维引导：**

使用哑节点（dummy node）简化边界处理。创建一个哑节点，遍历两个链表，将较小的节点接到哑节点后面。最后处理剩余部分。

**核心逻辑：**

```
1. 创建dummy节点
2. cur指向dummy
3. while l1 != nil && l2 != nil：
   - 将较小节点接到cur后面
   - cur后移，被接链表后移
4. 处理剩余链表
5. 返回dummy.Next
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeTwoLists(l1, l2 *ListNode) *ListNode {
    dummy := &ListNode{}
    cur := dummy

    for l1 != nil && l2 != nil {
        if l1.Val < l2.Val {
            cur.Next = l1
            l1 = l1.Next
        } else {
            cur.Next = l2
            l2 = l2.Next
        }
        cur = cur.Next
    }

    // 处理剩余部分
    if l1 != nil {
        cur.Next = l1
    } else {
        cur.Next = l2
    }

    return dummy.Next
}
```

**记忆方式：**

```
口诀："哑节点简化边界，遍历拼接两链表"
关键点：
- dummy.Next是结果链表的头
- cur始终指向当前尾部
- 处理剩余节点直接拼接
```

---

#### 2. 两数相加（LeetCode 2）- 中等

**题目描述：**

给你两个 非空 链表，表示两个非负整数。位数按 逆序 方式存储，每个节点只能存储一位数字。将这两个数相加并以相同形式返回。

**思维引导：**

模拟加法过程。从链表头部开始，对应位置相加，考虑进位。注意遍历结束后的进位处理。

**核心逻辑：**

```
1. 创建dummy节点
2. 遍历两个链表：
   - 相加：l1.Val + l2.Val + carry
   - 新节点值 = sum % 10
   - 进位 = sum / 10
   - 移动指针
3. 处理最后的进位
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
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

**记忆方式：**

```
口诀："逐位相加带进位，最后进位莫忘记"
关键点：
- 循环条件：l1、l2或carry任一非空
- 新节点值 = sum % 10
- 进位 = sum / 10
```

---

#### 19. 删除链表的倒数第 N 个节点（LeetCode 19）- 中等

**题目描述：**

给你一个链表，删除链表的倒数第 n 个节点，并且返回链表的头节点。

**思维引导：**

使用快慢指针的变体。让快指针先走 n+1 步，然后快慢指针同步移动。当快指针到达末尾时，慢指针正好在倒数第 n 个节点的前一个位置。

**核心逻辑：**

```
1. 创建dummy节点，指向head
2. fast = dummy, slow = dummy
3. fast先走n+1步
4. fast和slow同步移动直到fast为nil
5. slow.Next = slow.Next.Next删除节点
```

**解题框架：**

```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func removeNthFromEnd(head *ListNode, n int) *ListNode {
    dummy := &ListNode{Next: head}
    fast, slow := dummy, dummy

    // fast先走n+1步
    for i := 0; i <= n; i++ {
        fast = fast.Next
    }

    // 同步移动
    for fast != nil {
        fast = fast.Next
        slow = slow.Next
    }

    // 删除节点
    slow.Next = slow.Next.Next

    return dummy.Next
}
```

**记忆方式：**

```
口诀："快指针先走n+1，同步移动删倒数"
关键点：
- dummy节点处理边界情况
- fast先走n+1步
- slow停在待删节点的前一个
```

---

### 3.5 二叉树类题目

二叉树是面试中的重点，需要熟练掌握DFS和BFS。

---

#### 94. 二叉树的中序遍历（LeetCode 94）- 简单

**题目描述：**

给定一个二叉树的根节点 root，返回 它的 中序 遍历。

**思维引导：**

中序遍历的顺序是：左子树 → 根节点 → 右子树。可以使用递归或迭代（使用栈）实现。

**核心逻辑（递归）：**

```
1. 递归遍历左子树
2. 访问根节点
3. 递归遍历右子树
```

**解题框架（递归）：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func inorderTraversal(root *TreeNode) []int {
    result := []int{}

    var dfs func(node *TreeNode)
    dfs = func(node *TreeNode) {
        if node == nil {
            return
        }
        dfs(node.Left)
        result = append(result, node.Val)
        dfs(node.Right)
    }

    dfs(root)
    return result
}
```

**记忆方式：**

```
口诀："左根右，中序遍历"
其他遍历：
- 先序：根左右
- 后序：左右根
```

---

#### 104. 二叉树的最大深度（LeetCode 104）- 简单

**题目描述：**

给定一个二叉树 root，返回其最大深度。二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。

**思维引导：**

递归计算左右子树的深度，取最大值并加1（当前节点）。

**核心逻辑：**

```
maxDepth(node) =
    0, if node == nil
    max(maxDepth(node.Left), maxDepth(node.Right)) + 1, otherwise
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }

    leftDepth := maxDepth(root.Left)
    rightDepth := maxDepth(root.Right)

    return max(leftDepth, rightDepth) + 1
}
```

**记忆方式：**

```
口诀："左右子树比深度，大的加一返回去"
关键点：
- 空节点返回0
- 返回值 = max(左深度, 右深度) + 1
```

---

#### 226. 翻转二叉树（LeetCode 226）- 简单

**题目描述：**

给你一棵二叉树的根节点 root，翻转这棵二叉树，并返回其根节点。

**思维引导：**

递归交换左右子树。可以先交换当前节点的左右子树，再递归翻转左右子树（后序遍历）。也可以先递归翻转左右子树，再交换（先序遍历）。

**核心逻辑：**

```
翻转(node) =
    nil, if node == nil
    左 = 翻转(node.Left)
    右 = 翻转(node.Right)
    交换 node.Left 和 node.Right
    返回 node
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
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

**记忆方式：**

```
口诀："递归翻转左右子树，交换指针完成翻转"
关键点：
- 后序遍历（左右子树先翻转）
- 交换左右指针
```

---

#### 102. 二叉树的层序遍历（LeetCode 102）- 中等

**题目描述：**

给定一个二叉树的根节点 root，返回其节点值的 层序遍历 （即逐层地，从左到右访问所有节点）。

**思维引导：**

使用BFS（广度优先搜索），借助队列实现。关键是在每一层开始前记录队列的长度，然后只处理这一层的节点。

**核心逻辑：**

```
1. 创建空队列，放入root
2. while队列不为空：
   - 记录当前层大小
   - 遍历这一层的所有节点
   - 将子节点入队
   - 保存当前层结果
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func levelOrder(root *TreeNode) [][]int {
    if root == nil {
        return nil
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

**记忆方式：**

```
口诀："队列辅助层序走，每层数量先记好"
关键点：
- 先记录当前层大小
- 再处理这一层的所有节点
```

---

#### 236. 二叉树的最近公共祖先（LeetCode 236）- 中等

**题目描述：**

给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

**思维引导：**

递归后序遍历。如果当前节点是p或q，或者左右子树分别找到了p和q，则当前节点就是最近公共祖先。

**核心逻辑：**

```
最近公共祖先(node, p, q) =
    nil, if node == nil
    p or q, if node == p or node == q
    左 = 最近公共祖先(node.Left, p, q)
    右 = 最近公共祖先(node.Right, p, q)
    if 左 != nil && 右 != nil: return node
    if 左 != nil: return 左
    if 右 != nil: return 右
    return nil
```

**解题框架：**

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func lowestCommonAncestor(root, p, q *TreeNode) *TreeNode {
    if root == nil || root == p || root == q {
        return root
    }

    left := lowestCommonAncestor(root.Left, p, q)
    right := lowestCommonAncestor(root.Right, p, q)

    if left != nil && right != nil {
        return root  // 左右都找到，root是LCA
    }
    if left != nil {
        return left
    }
    if right != nil {
        return right
    }

    return nil
}
```

**记忆方式：**

```
口诀："左右子树各查找，都有返回根，独有返回独"
关键点：
- 递归后序遍历
- 左右都找到 = 当前是LCA
- 只找到一边 = 那一边继续找
```

---

### 3.6 动态规划类题目

动态规划是算法面试中最难的部分。

---

#### 70. 爬楼梯（LeetCode 70）- 简单

**题目描述：**

假设你正在爬楼梯。需要 n 阶你才能到达楼顶。每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

**思维引导：**

到达第n阶的最后一步可能是从n-1阶爬1阶上来，也可能是从n-2阶爬2阶上来。因此：dp[n] = dp[n-1] + dp[n-2]。这就是斐波那契数列。

**核心逻辑：**

```
dp[i] = 爬到第i阶的方法数
dp[0] = 1（或者dp[1] = 1, dp[2] = 2）
dp[i] = dp[i-1] + dp[i-2]
```

**解题框架：**

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

**记忆方式：**

```
口诀："最后一步定来源，两种来源相加来"
关键点：
- dp[n] = dp[n-1] + dp[n-2]
- 空间优化：只用两个变量
```

---

#### 53. 最大子数组和（LeetCode 53）- 中等

**题目描述：**

给你一个整数数组 nums，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

**思维引导：**

使用贪心策略。如果前面的和是负数，那么加上它只会让后面的和更小，因此应该重新从当前元素开始。

**核心逻辑：**

```
dp[i] = 以i结尾的最大子数组和
dp[i] = max(nums[i], dp[i-1] + nums[i])
答案 = max(dp[i])
```

**解题框架：**

```go
func maxSubArray(nums []int) int {
    maxSum := nums[0]
    currSum := nums[0]

    for i := 1; i < len(nums); i++ {
        currSum = max(nums[i], currSum+nums[i])
        maxSum = max(maxSum, currSum)
    }

    return maxSum
}
```

**记忆方式：**

```
口诀："负和丢弃重开始，当前最大全局最大"
关键点：
- 如果当前和是负数，重新开始
- 维护当前和与全局最大
```

---

#### 300. 最长递增子序列（LeetCode 300）- 中等

**题目描述：**

给你一个整数数组 nums，找到其中最长严格递增子序列的长度。

**思维引导：**

定义dp[i]为以nums[i]结尾的最长递增子序列长度。对于每个i，遍历j < i，如果nums[j] < nums[i]，则dp[i] = max(dp[i], dp[j] + 1)。

**核心逻辑：**

```
dp[i] = 以i结尾的LIS长度
比较nums[i]与nums[j]，如果nums[j] < nums[i]，则dp[i] = max(dp[i], dp[j] + 1)
答案 = max(dp[i])
```

**解题框架：**

```go
func lengthOfLIS(nums []int) int {
    f := make([]int,len(nums))
    for i,x := range nums{
        for j,y := range nums[:i]{
            if y < x {
                f[i] = max(f[i],f[j])
            }
        }
        f[i]++
    }
    return slices.Max(f)
}
```

**记忆方式：**

```
口诀："逐个比较往前找，能接就接最长链"
关键点：
- O(n²)基础解法
- 优化：二分查找 + patience sorting
```

---

#### 139. 单词拆分（LeetCode 139）- 中等

**题目描述：**

给你一个字符串 s 和一个字符串列表 wordDict 作为字典。如果可以利用字典中出现的一个或多个单词拼接出 s 则返回 true。

**思维引导：**

使用DP。dp[i]表示s[:i]能否被拆分。对于每个位置i，遍历所有可能的j（j < i），如果dp[j]为true且s[j:i]在字典中，则dp[i]为true。

**核心逻辑：**

```
dp[i] = 是否能拆分成字典单词
dp[0] = true
dp[i] = OR{dp[j] && s[j:i] in wordDict} for all j < i
```

**解题框架：**

```go
func wordBreak(s string, wordDict []string) bool {
    wordSet := make(map[string]bool)
    for _, word := range wordDict {
        wordSet[word] = true
    }

    n := len(s)
    dp := make([]bool, n+1)
    dp[0] = true

    maxLen := 0
    for _, word := range wordDict {
        if len(word) > maxLen {
            maxLen = len(word)
        }
    }

    for i := 1; i <= n; i++ {
        for j := max(0, i-maxLen); j < i; j++ {
            if dp[j] && wordSet[s[j:i]] {
                dp[i] = true
                break
            }
        }
    }

    return dp[n]
}
```

**记忆方式：**

```
口诀："从前向后逐位置，拆得前面再判断"
关键点：
- dp[0] = true是基础
- 剪枝：只检查长度范围内的j
```

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


### 3.7 栈与堆类题目

---

#### 20. 有效的括号（LeetCode 20）- 简单

**题目描述：**

给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s，判断字符串是否有效。

**思维引导：**

使用栈。遍历字符串，遇到左括号入栈，遇到右括号时检查栈顶是否是对应的左括号。遍历结束后栈应为空。

**核心逻辑：**

```
1. 创建栈
2. 遍历字符串：
   - 左括号入栈
   - 右括号：栈空或栈顶不匹配 → 无效
   - 匹配则弹出栈顶
3. 栈空 → 有效；栈不空 → 无效
```

**解题框架：**

```go
func isValid(s string) bool {
    if len(s)%2 != 0 {
        return false
    }

    stack := []rune{}
    pairs := map[rune]rune{')': '(', '}': '{', ']': '['}

    for _, c := range s {
        if pairs[c] == 0 {
            // 左括号，入栈
            stack = append(stack, c)
        } else {
            // 右括号，检查匹配
            if len(stack) == 0 || stack[len(stack)-1] != pairs[c] {
                return false
            }
            stack = stack[:len(stack)-1]
        }
    }

    return len(stack) == 0
}
```

**记忆方式：**

```
口诀："左括号入栈，右括号匹配弹"
关键点：
- 右括号检查栈顶
- 最终栈空才有效
```

---

#### 155. 最小栈（LeetCode 155）- 中等

**题目描述：**

设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

**思维引导：**

使用辅助栈（单调栈）。主栈正常存储元素，辅助栈存储当前的最小值。每次push时，将当前最小值入辅助栈；每次pop时，两个栈同步弹出。

**核心逻辑：**

```
minStack:
  data: 主栈，存储所有元素
  minStack: 辅助栈，存储每个位置的最小值

push(x):
  data.push(x)
  minVal = min(x, minStack.top())
  minStack.push(minVal)

pop():
  data.pop()
  minStack.pop()

top():
  return data.top()

getMin():
  return minStack.top()
```

**解题框架：**

```go
type MinStack struct {
    data []int
    minStack []int
}

func Constructor() MinStack {
    return MinStack{
        minStack: []int{math.MaxInt},
    }
}

func (this *MinStack) Push(val int) {
    this.data = append(this.data, val)
    minVal := val
    if this.minStack[len(this.minStack)-1] < minVal {
        minVal = this.minStack[len(this.minStack)-1]
    }
    this.minStack = append(this.minStack, minVal)
}

func (this *MinStack) Pop() {
    this.data = this.data[:len(this.data)-1]
    this.minStack = this.minStack[:len(this.minStack)-1]
}

func (this *MinStack) Top() int {
    return this.data[len(this.data)-1]
}

func (this *MinStack) GetMin() int {
    return this.minStack[len(this.minStack)-1]
}
```

**记忆方式：**

```
口诀："双栈配合不费劲，辅助栈存最小值"
关键点：
- 辅助栈和主栈同步长度
- 辅助栈顶永远是当前最小值
```

---

#### 215. 数组中的第 K 个最大元素（LeetCode 215）- 中等

**题目描述：**

给定整数数组 nums 和整数 k，返回数组中第 k 个最大的元素。

**思维引导：**

使用快速选择算法（Quickselect），基于快速排序的划分操作，平均时间复杂度O(n)，最坏O(n²)。

**核心逻辑：**

```
1. 随机选择pivot
2. 划分数组为小于、等于、大于pivot三部分
3. 如果k <= 大于部分的大小：在大于部分查找
   如果k <= 大于+等于部分：在等于部分找到
   否则：在小于部分查找（k - 大于 - 等于）
```

**解题框架：**

```go
func findKthLargest(nums []int, k int) int {
    target := len(nums) - k  // 转换为第target小的元素

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

**记忆方式：**

```
口诀："快选划分定位置，目标位置见分晓"
关键点：
- 转换为找第target小
- 基于pivot划分
- 目标位置决定搜索方向
```

---

### 3.8 贪心算法类题目

---

#### 121. 买卖股票的最佳时机（LeetCode 121）- 简单

**题目描述：**

给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。返回你可以从这笔交易中获取的最大利润。

**思维引导：**

维护当前最低价格和最大利润。遍历数组，对于每个价格，更新最低价格，并计算当前价格与最低价格的差作为潜在利润，更新最大利润。

**核心逻辑：**

```
minPrice = 无穷大
maxProfit = 0
遍历价格：
  minPrice = min(minPrice, price)
  maxProfit = max(maxProfit, price - minPrice)
```

**解题框架：**

```go
func maxProfit(prices []int) int {
    minPrice := math.MaxInt
    maxProfit := 0

    for _, price := range prices {
        if price < minPrice {
            minPrice = price
        }
        profit := price - minPrice
        if profit > maxProfit {
            maxProfit = profit
        }
    }

    return maxProfit
}
```

**记忆方式：**

```
口诀："最低价格记心间，最大利润随时算"
关键点：
- 单次遍历
- 实时更新最低价和最大利润
```

---

#### 55. 跳跃游戏（LeetCode 55）- 中等

**题目描述：**

给你一个非负整数数组 nums，你最初位于数组的第一个下标。数组中的每个元素代表你在该位置可以跳跃的最大长度。判断你是否能够到达最后一个下标。

**思维引导：**

维护当前能够到达的最远位置。如果当前位置超过了最远位置，说明无法到达。最后检查最远位置是否 >= 最后一个下标。

**核心逻辑：**

```
maxReach = 0
遍历i从0到n-1：
  如果i > maxReach：返回false
  maxReach = max(maxReach, i + nums[i])
返回 maxReach >= n-1
```

**解题框架：**

```go
func canJump(nums []int) bool {
    maxReach := 0
    n := len(nums)

    for i := 0; i < n; i++ {
        if i > maxReach {
            return false  // 当前位置不可达
        }
        maxReach = max(maxReach, i+nums[i])
        if maxReach >= n-1 {
            return true  // 已能到达最后
        }
    }

    return maxReach >= n-1
}
```

**记忆方式：**

```
口诀："能到最远不断更新，到不了就return false"
关键点：
- 当前位置不可达时直接失败
- 实时更新最远可达位置
```

---

### 3.9 技巧类题目

---

#### 136. 只出现一次的数字（LeetCode 136）- 简单

**题目描述：**

给你一个 非空 整数数组 nums，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

**思维引导：**

使用异或运算的性质：a ^ a = 0，a ^ 0 = a，异或满足交换律和结合律。将所有元素异或一遍，结果就是只出现一次的元素。

**核心逻辑：**

```
result = 0
for each num in nums:
  result = result ^ num
return result
```

**解题框架：**

```go
func singleNumber(nums []int) int {
    result := 0
    for _, num := range nums {
        result ^= num
    }
    return result
}
```

**记忆方式：**

```
口诀："异或消消乐，相同为0不同留"
关键点：
- 异或的性质：x ^ x = 0, x ^ 0 = x
- 顺序无关
```

---

#### 169. 多数元素（LeetCode 169）- 简单

**题目描述：**

给定一个大小为 n 的数组 nums，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

**思维引导：**

使用摩尔投票法。维护一个候选人和票数。遍历数组，如果票数为0，将当前元素设为候选人；如果当前元素等于候选人，票数加1，否则票数减1。最后的候选人就是多数元素。

**核心逻辑：**

```
candidate = nil
count = 0
for each num in nums:
  if count == 0:
    candidate = num
  if num == candidate:
    count++
  else:
    count--
return candidate
```

**解题框架：**

```go
func majorityElement(nums []int) int {
    candidate := 0
    count := 0

    for _, num := range nums {
        if count == 0 {
            candidate = num
        }
        if num == candidate {
            count++
        } else {
            count--
        }
    }

    return candidate
}
```

**记忆方式：**

```
口诀："票数归零换候选，相同加一不同减"
关键点：
- 票数归零时换候选人
- 相同加分，不同减分
- 最终候选人就是答案
```

---

#### 75. 颜色分类（LeetCode 75）- 中等

**题目描述：**

给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。必须使用 O(1) 额外空间。

**思维引导：**

使用三指针。p0指向0的最右边界，p1指向1的最右边界（同时处理0和1），i遍历数组。当遇到0时，与p0交换；当遇到1时，与p1交换（需要处理0和1的边界情况）。

**核心逻辑：**

```
p0 = 0, p1 = 0
遍历i从0到n-1：
  如果nums[i] == 0：
    交换nums[i]和nums[p1]
    交换nums[p1]和nums[p0]
    p0++, p1++
  如果nums[i] == 1：
    交换nums[i]和nums[p1]
    p1++
```

**解题框架：**

```go
func sortColors(nums []int) {
    p0, p1 := 0, 0
    for i := 0; i < len(nums); i++ {
        if nums[i] == 0 {
            nums[i], nums[p1] = nums[p1], nums[i]
            nums[p1], nums[p0] = nums[p0], nums[p1]
            p0++
            p1++
        } else if nums[i] == 1 {
            nums[i], nums[p1] = nums[p1], nums[i]
            p1++
        }
    }
}
```

**记忆方式：**

```
口诀："三指针分三区，0左1中2右"
关键点：
- p0分界0和1，p1分界1和2
- 0的处理涉及两次交换
```

---

## 第四部分：算法思维导图

本部分提供面试时的快速思考路径。

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
   时间O(n²) → 暴力优化（哈希表）
   时间O(n³) → 考虑DP或图算法
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

本部分汇总了各题型的记忆口诀。

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

## 结语

本手册涵盖了LeetCode Hot 100中的核心题目，建议按照以下方式使用：

1. **先理解后记忆**：先理解每道题的思路，再记忆口诀和框架
2. **边学边练**：每学习一类题目，就找几道相关题目练习
3. **定期复习**：面试前反复过一遍本手册
4. **模拟面试**：找朋友模拟面试场景，限时答题

祝面试顺利！
