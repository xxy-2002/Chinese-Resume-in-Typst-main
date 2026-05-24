---
AIGC:
    ContentProducer: Minimax Agent AI
    ContentPropagator: Minimax Agent AI
    Label: AIGC
    ProduceID: f0a54010591128bbe5ed1ca19427e4b6
    PropagateID: f0a54010591128bbe5ed1ca19427e4b6
    ReservedCode1: 3045022100a2874fe4a5dfddcf5b2e5b46cc1d520787f426495ed28b6587106fa51e6347dc022056ed3a574bdd7ce875bc731cfca350f147739217247753a6aaccb4991782ed74
    ReservedCode2: 3046022100ee6e78e7500c74575e55a619b53c75c02c7c0f82d9ef72c56a325699f745c1e70221008526fea8aec44001c1371b6d10d991d49cf1e07fc28c3445e9c0023122883e8e
---

# LeetCode Hot 100 面试快速复习手册（Go语言版）

> **复习目标**：在面试前掌握核心思维模型、常用语法工具、标准代码框架
> **复习方法**：背诵思维引导 → 数据结构 → 代码实现的闭环
> **作者**：Matrix Agent

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
    sort.Ints(nums)
    n := len(nums)
    result := [][]int{}

    for i := 0; i < n-2; i++ {
        // 剪枝：最小的数已经大于0
        if nums[i] > 0 {
            break
        }
        // 去重：跳过相同的nums[i]
        if i > 0 && nums[i] == nums[i-1] {
            continue
        }

        left, right := i+1, n-1
        for left < right {
            sum := nums[i] + nums[left] + nums[right]
            if sum == 0 {
                result = append(result, []int{nums[i], nums[left], nums[right]})
                // 去重：跳过相同的left
                for left < right && nums[left] == nums[left+1] {
                    left++
                }
                // 去重：跳过相同的right
                for left < right && nums[right] == nums[right-1] {
                    right--
                }
                left++
                right--
            } else if sum < 0 {
                left++
            } else {
                right--
            }
        }
    }

    return result
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

---

#### 42. 接雨水（LeetCode 42）- 困难

**题目描述：**

给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

**思维引导：**

每个位置能接的雨水取决于它左右两边最高柱子的最小值（决定了水面高度）。有三种解法：1）预处理左右最大数组；2）双指针同步维护；3）单调栈。这里介绍前两种最常用的方法。

**核心逻辑（方法1 - 预处理）：**

```
1. 计算leftMax[i]：i位置左侧的最大高度
2. 计算rightMax[i]：i位置右侧的最大高度
3. 每个位置接水量：max(0, min(leftMax[i], rightMax[i]) - height[i])
```

**解题框架（方法1）：**

```go
func trap(height []int) int {
    n := len(height)
    if n == 0 {
        return 0
    }

    // 预处理右侧最大高度
    rightMax := make([]int, n)
    rightMax[n-1] = height[n-1]
    for i := n - 2; i >= 0; i-- {
        rightMax[i] = max(rightMax[i+1], height[i])
    }

    leftMax := 0
    water := 0

    for i := 0; i < n; i++ {
        leftMax = max(leftMax, height[i])
        minHeight := min(leftMax, rightMax[i])
        if minHeight > height[i] {
            water += minHeight - height[i]
        }
    }

    return water
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

滑动窗口是处理子串/子数组问题的利器。

---

#### 3. 无重复字符的最长子串（LeetCode 3）- 中等

**题目描述：**

给定一个字符串 s，请你找出其中不含有重复字符的 最长子串 的长度。

**思维引导：**

使用滑动窗口（同向双指针）维护一个窗口 [left, right]，保证窗口内字符不重复。右指针扩展窗口，如果遇到重复字符，左指针收缩直到窗口内无重复。关键是用哈希表记录字符最后出现的位置，当遇到重复时，左指针直接跳到重复字符的下一位。

**核心逻辑：**

```
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
func findAnagrams(s, p string) []int {
    if len(s) < len(p) {
        return nil
    }

    cntP := [26]int{}
    cntS := [26]int{}

    for _, c := range p {
        cntP[c-'a']++
    }

    for i := 0; i < len(p); i++ {
        cntS[s[i]-'a']++
    }

    result := []int{}
    if cntP == cntS {
        result = append(result, 0)
    }

    for i := len(p); i < len(s); i++ {
        cntS[s[i]-'a']++
        cntS[s[i-len(p)]-'a']--
        if cntP == cntS {
            result = append(result, i-len(p)+1)
        }
    }

    return result
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
1. slow = head, fast = head
2. while fast != nil && fast.Next != nil：
   - slow = slow.Next
   - fast = fast.Next.Next
   - 如果slow == fast，返回true
3. 返回false
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
dp[i] = 1 + max(dp[j]) where j < i and nums[j] < nums[i]
答案 = max(dp[i])
```

**解题框架：**

```go
func lengthOfLIS(nums []int) int {
    n := len(nums)
    if n == 0 {
        return 0
    }

    dp := make([]int, n)
    maxLen := 1

    for i := 0; i < n; i++ {
        dp[i] = 1
        for j := 0; j < i; j++ {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
        maxLen = max(maxLen, dp[i])
    }

    return maxLen
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
