# Interview Preparation: LeetCode Hot 100 快速复习手册 (Go Edition)

> **复习目标**：在周一前掌握核心思维模型、常用语法工具、标准代码框架。
> **复习方法**：背诵思维引导 -> 数据结构 -> 代码实现的闭环。

---

##  复习进度表
- [ ] 哈希 / 双指针 / 滑动窗口 / 子串 (Day 1)
- [ ] 普通数组 / 矩阵 / 链表 (Day 2)
- [ ] 二叉树 / 图论 / 回溯 (Day 3)
- [ ] 二分查找 / 栈 / 堆 / 贪心 (Day 4)
- [ ] 动态规划 / 多维 DP / 技巧 (Day 5)

---

##  Go 语言面试备忘录

### 1. 数组与切片 (Slice)
- **初始化**: `s := make([]int, 0, capacity)`
- **主要操作**: `append(s, val)`, `copy(dest, src)`, `s[low:high]`
- **排序**: `sort.Ints(nums)`, `sort.Slice(s, func(i, j int) bool { return s[i] < s[j] })`

### 2. 哈希表 (Map)
- **初始化**: `m := make(map[K]V)`
- **判断存在**: `val, ok := m[key]`
- **删除**: `delete(m, key)`
- **注意**: Go 的 map 并发不安全（面试常考 `sync.Map` 或加锁）。

### 3. 标准算法框架
#### 二分搜索
```go
func binarySearch(nums []int, target int) int {
    l, r := 0, len(nums)-1
    for l <= r {
        mid := l + (r - l) / 2
        if nums[mid] == target { return mid }
        if nums[mid] < target { l = mid + 1 } else { r = mid - 1 }
    }
    return -1
}
```

#### 回溯 (全排列为例)
```go
func backtrack(nums []int, path []int, used []bool, res *[][]int) {
    if len(path) == len(nums) {
        p := make([]int, len(path)); copy(p, path)
        *res = append(*res, p); return
    }
    for i := 0; i < len(nums); i++ {
        if used[i] { continue }
        used[i] = true
        path = append(path, nums[i])
        backtrack(nums, path, used, res)
        path = path[:len(path)-1]
        used[i] = false
    }
}
```

---

##  核心题型整理 (LeetCode Hot 100)

### 一、哈希 (Hash Table)
#### 1. 两数之和 (Two Sum) - 简单
- **思维引导**: 空间换时间。遍历时查询目标值与当前值的差值是否在哈希中。
- **语法工具**: `map[int]int` 存储 `value -> index`。
- **核心逻辑**: `if idx, ok := m[target-v]; ok { return []int{idx, i} }`
给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。
代码：
func twoSum(nums []int, target int) []int {
    m := make(map[int]int)
    for i, v := range nums {
        if idx, ok := m[target - v]; ok {
            return []int{idx, i}
        }
        m[v] = i
    }
    return nil
}

#### 49. 字母异位词分组 - 中等

- **思维引导**: 异位词排序后相等。以排序后的字符串为 Key。
- **语法工具**: `sort.Slice` 处理 `[]byte`，`map[string][]string` 聚合。
- **框架**: 遍历 -> 转 byte -> 排序 -> 转 string -> 存入 map。
给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
func groupAnagrams(strs []string) [][]string {
    m := make(map[string][]string)
    for _,s := range strs{
        tmp := []byte(s)
        slices.Sort(tmp)
        sortedS := string(tmp)
        m[sortedS] = append(m[sortedS],s)
    }
    return slices.Collect(maps.Values(m))
}
//先判断是不是字母异味词
func isAnagrams(s string ,t string) bool{
    if len(s) != len(t){
        return false
    }
    sCnt := [26]int{}//虽然 make([]int, 26) 的确分配了一块能存放 26 个整数的连续内存，但它返回给你的那个变量（Header），其身份依然是切片。
    tCnt := [26]int{}
    for i,v := range s{
        sCnt[v-'a']++
        tCnt[t[i]-'a']++
    }
    if sCnt == tCnt {
        return true
    }else {
        return false
    }
}
#### 128. 最长连续序列 - 中等
- **思维引导**: 只从序列的起点开始计数。如果 `x-1` 存在，则 `x` 不是起点，跳过。
- **语法工具**: `map[int]bool` 或 `set` 加速查找。
- **核心步骤**: 查起点 -> while循环找 `x+1` -> 更新 maxLen。
给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

请你设计并实现时间复杂度为 O(n) 的算法解决此问题。
func longestConsecutive(nums []int) int {
    has := make(map[int]bool)
    for _,num := range nums {
        has[num] = true
    }
    ans := 0
    for x := range has{
        if has[x-1] {
            continue
        }
        y := x +1 
        for has[y] {
            y++
        }
        if y - x > ans{
            ans = y -x
        }
    }
    return ans
}
---

### 二、双指针 (Two Pointers)
#### 283. 移动零 - 简单
- **思维引导**: 快慢指针。快指针找非零元素，慢指针记录存放位置。
- **代码框架**: 非零元素往前挪，剩下的位置补零。
给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

请注意 ，必须在不复制数组的情况下原地对数组进行操作。
func moveZeroes(nums []int)  {
    //start := 0;
    sencond := 0;
    for i := 0; i<len(nums);i++{
        if nums[i] != 0{
            nums[sencond]=nums[i]
            sencond++
        }
    }
    for i := sencond; i<len(nums);i++{
        nums[i]=0
    }
}
#### 11. 盛最多水的容器 - 中等
- **思维引导**: 对撞指针。每次移动短板，因为移动长板面积只会减少。
- **数学工具**: `area = min(h[l], h[r]) * (r - l)`。
给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。

找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

返回容器可以储存的最大水量。

说明：你不能倾斜容器。
func maxArea(height []int) int {
    left,right := 0,len(height)-1
    res := 0
    for left < right {
        area := min(height[left],height[right])*(right-left)
        res = max(area,res)
        if height[left]<height[right]{
            left++
        }else{
            right--
        }
    }
    return res
}
#### 15. 三数之和 - 中等
- **思维引导**: 排序 + 固定 $i$ + 对撞双指针。关键在于**去重**。
- **核心步骤**: `sort` -> 循环 `i` -> 跳过重复项 -> 固定 `nums[i]` 后寻找 `L, R` 使和为 0。
给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请你返回所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。
//左右指针先确定中间的然后左右看看怎么移动，先排序成有序数组，这个地方可以练一下排序
//十大排序之快速排序
//分治递归的思想
func quickSort(nums []int){
    if len(nums)<=1 {
        return
    }
    pivot := nums[0] // 随机指定一个元素
    left,right := 0, len(nums)-1
    for i:=1;i<=right;{
        if nums[i]< pivot {
            nums[left],nums[i] = nums[i],nums[left]
            left++
            i++
        }else{
            nums[i],nums[right] = nums[right],nums[i]
            right--
        }
    }
    // 递归排序左右两部分
    quickSort(nums[:left])
    quickSort(nums[left+1:])
}
func threeSum(nums []int) [][]int {
    //quickSort(nums)
    slices.Sort(nums)
    ans := make([][]int,0) //这个0 是什么意思预分配好为0 吗
    n := len(nums)
    for i:=0;i<n;i++{
        if nums[i]>0{
            break
        }
        if i>0 && nums[i]==nums[i-1]{
            continue
        }
        k,j := i+1,n-1
        for k < j{
            sum := nums[i]+nums[k]+nums[j]
            if sum < 0 {
                k++
            }else if sum > 0 {
                j--
            }else{
                ans = append(ans,[]int{nums[i],nums[k],nums[j]})
                for k++; k < j && nums[k]==nums[k-1];k++{
                }
                for j--;k<j && nums[j]==nums[j+1];j--{
                }
            }
        }
    }
    return ans
}
// 原地快速排序，直接修改传入的切片

#### 42. 接雨水 - 困难
- **思维引导**: 每个位置能接的水取决于左右两边最大高度的极小值。
- **工具/方案**: 1. 双数组预处理左右 Max；2. 双指针同步维护 `leftMax`, `rightMax`。
给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
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

---

### 三、滑动窗口 (Sliding Window)
#### 3. 无重复字符的最长子串 - 中等
- **思维引导**: 同向双指针（窗口）。遇到重复时，左指针跳到重复字符上次出现位置的右边。
- **语法工具**: `map[byte]int` 记录字符索引。
给定一个字符串 s ，请你找出其中不含有重复字符的 最长 子串 的长度。
//最x子序列和子串一看就是滑动窗口，// 求字符串/数组的【最长/最短 子串/子数组】，满足「连续+某个限定条件」，一看就是滑动窗口的经典题型！
//滑动窗口（同向双指针）
func lengthOfLongestSubstring(s string) int {
    left,right := -1,0
    maxlength := 0
    dic := make(map[byte]int)
    for right<len(s){
        //先看看这存在不存在如果存在的话，比较一下这个和当前的left的位置谁大
        //要缩小窗口大小
        //// 核心2：发现当前字符s[right]已经在哈希表中存在 → 说明窗口内有重复，需要【收缩左边界】
        if idx,exists := dic[s[right]];exists{
            /*🧐 问题 2：为什么发现重复字符时，要写 if idx > left { left = idx }，而不是直接 left = idx？
这是本题最容易踩坑的点，也是你代码的精髓，90% 的初学者会在这里写错，这个判断是「防左指针回退」，举个例子你瞬间懂：*/
            if idx > left{
                left = idx
            }
        }
        dic[s[right]] = right
        maxlength = max(maxlength,right -left)
        right++
    }
    return maxlength 
}
#### 438. 找到字符串中所有字母异位词 - 中等
- **思维引导**: 固定窗口。维护 26 位频次数组。
- **框架**: `cntP == cntS`（Go 中数组可直接比较）。
给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。
func findAnagrams(s string, p string) (ans[]int) {
    //定长滑窗
    cntP := [26]int{} //统计p出现的次数
    cntS := [26]int{} //统计 s 的长为 len(p) 的子串 s' 的每种字母的出现次数
    for _,c := range p{
        cntP[c-'a']++
    }
    for right, c:= range s{
        cntS[c-'a']++ //右端点字母进入窗口
        left := right-len(p)+1
        if left <0{
            continue
        }
        if cntS == cntP {
            ans = append(ans,left)
        }
        cntS[s[left]-'a']--
    }
    return 
}
---

### 四、子串 (Substring)
#### 560. 和为 K 的子数组 - 中等
- **思维引导**: **前缀和 + 哈希表**。
- **核心逻辑**: `sum[i] - sum[j] == k` 转化为 `sum[j] == sum[i] - k`。哈希存 `sum` 出现次数。
给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的子数组的个数 。
子数组是数组中元素的连续非空序列。
func subarraySum(nums []int, k int) (ans int) {
    cnt := make(map[int]int,len(nums)+1)
    cnt[0]=1
    s := 0
    for _,x := range nums{
        s+=x
        ans+= cnt[s-k]
        cnt[s]++
    }
    return 
}
#### 239. 滑动窗口最大值 - 困难
- **思维引导**: **单调队列**。队列内只保存可能成为最大值的下标，且下标对应的元素单调递减。
给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

返回 滑动窗口中的最大值 。
class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        //首先处理边界条件
        if(nums.size()==0 || k == 0) return {};
        //建立一个队列进行维护
        deque<int> deque;
        //结果数组
        vector<int> ans(nums.size()-k+1);
        //完成第一个窗口的初始化
        for (int i = 0;i<k;i++){
            while(!deque.empty()&&deque.back()<nums[i]){
                deque.pop_back();
            }
            deque.push_back(nums[i]);
        }
        ans[0] = deque.front();
        for(int i = k;i<nums.size();i++){
            if(deque.front() == nums[i-k]){
                deque.pop_front();
            }
            while(!deque.empty()&&deque.back()<nums[i]){
                deque.pop_back();
            }
            deque.push_back(nums[i]);
            ans[i-k+1]=deque.front();
        }
        return ans;
    }
};
#### 76. 最小覆盖子串 - 困难
- **思维引导**: 变长窗口。不断扩大 R 寻找可行解，然后收缩 L 寻找最优解。
给定两个字符串 s 和 t，长度分别是 m 和 n，返回 s 中的 最短窗口 子串，使得该子串包含 t 中的每一个字符（包括重复字符）。如果没有这样的子串，返回空字符串 ""。

测试用例保证答案唯一。
class Solution {
public:
    string minWindow(string s, string t) {
        unordered_map<char,int>ht,hs;
        for(int right=0;right<t.size();right++) ht[t[right]]++;
        string ans;
        for(int left = 0,right=0,cnt=0;right<s.size();right++){
            if(++hs[s[right]]<=ht[s[right]]){
                cnt++;
            }
            while(hs[s[left]]>ht[s[left]]){
                hs[s[left++]]--;
            }
            if(cnt==t.length()){
                if(ans.empty()||ans.length()>right-left+1)
                    ans=s.substr(left,right-left+1);
            }

        }
        return ans;
    }
};
---

### 五、普通数组 (Array)
#### 53. 最大子数组和 - 中等
- **思维引导**: 贪心/DP。如果前面的和小于 0，则抛弃，从当前开始。
给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

子数组是数组中的一个连续部分。
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
 
#### 56. 合并区间 - 中等,我做了相关的主要是区间端点的排序
区间的几个问题
- **思维引导**: 按起点排序。如果当前起点 <= 前一区间终点，则合并。
以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。
//合并区间返回一个最大的没有重叠的，首先要知道哪能合并，无非就是看左端点
//可以先按照左端点大小进行排序，然后再处理前一个的右端点和后一个的左端点的关系，
func merge(intervals [][]int) [][]int {
    if len(intervals) <= 1 {
        return intervals
    }
    // 1. 按照左端点排序
    sort.Slice(intervals, func(i, j int) bool {
        return intervals[i][0] < intervals[j][0]
    })

    // 2. 初始化结果集，放入第一个区间
    res := [][]int{intervals[0]}
    for i := 1; i < len(intervals); i++ {
        curr := intervals[i]
        // 获取结果集中最后一个已合并的区间（通过索引获取引用，方便修改）
        prev := &res[len(res)-1]
        // 3. 核心判断逻辑
        if curr[0] <= (*prev)[1] {
            // 有重叠：更新前一个区间的右端点为两者的最大值
            if curr[1] > (*prev)[1] {
                (*prev)[1] = curr[1]
            }
        } else {
            // 无重叠：直接作为新区间加入
            res = append(res, curr)
        }
    }
    return res
}
#### 189. 轮转数组 - 中等
- **思维引导**: 三步翻转。全翻转 -> 翻转前 k -> 翻转剩余 k。
给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。
//我这个很有印象反转三次来实现
func rotate(nums []int, k int)  {
    k %= len(nums)
    slices.Reverse(nums)
    slices.Reverse(nums[:k])
    slices.Reverse(nums[k:])
}
#### 238. 除自身以外数组的乘积 - 中等
- **思维引导**: 前缀之积 * 后缀之积。不用除法。
给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除了 nums[i] 之外其余各元素的乘积 。

题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。

请 不要使用除法，且在 O(n) 时间复杂度内完成此题。
func productExceptSelf(nums []int)  []int {
    n := len(nums)
    pre := make([]int ,n)
    pre[0] = 1
    for i:=1;i<n;i++{
        pre[i] = pre[i-1]*nums[i-1]
    }
    suf := make([]int,n)
    suf[n-1] =1
    for i:= n-2;i>=0;i--{
        suf[i] = suf[i+1]*nums[i+1]
    }
    ans := make([]int , n)
    
    for i,p := range pre{
        ans[i] = p* suf[i]
    }
    return ans 
}
#### 41. 缺失的第一个正数 - 困难
- **思维引导**: **原地哈希**。让数字 $i$ 待在索引 $i-1$ 的位置。
给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。

请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
class Solution {
    //原地哈希的方法，将数组本身作为哈希表进行处理
    //就把 1 这个数放到下标为 0 的位置， 2 这个数放到下标为 1 的位置，按照这种思路整理一遍数组
    //然后我们再遍历一次数组，第 1 个遇到的它的值不等于下标的那个数，就是我们要找的缺失的第一个正数

public:
    int firstMissingPositive(vector<int>& nums) {
       for(int i = 0;i<nums.size();i++){
            while(nums[i] != i+1){
                if(nums[i]<=0 || nums[i]>nums.size()||nums[i]==nums[nums[i]-1])
                    break;
                int idx =nums[i]-1;
                nums[i]=nums[idx];
                nums[idx]=idx+1;
            }
       }
       for (int i =0 ;i < nums.size();i++){
            if (nums[i]!=(i+1)){
                return(i+1);
            }
       }
       return(nums.size()+1);

    }
};
---

### 六、矩阵 (Matrix)
#### 73. 矩阵置零 - 中等
- **思维引导**: 用矩阵第一行和第一列做标记位。
class Solution {
    // 原地算法是什么
    // 一个原地算法（in-place
    // algorithm）是一种使用小的，固定数量的额外之空间来转换资料的算法。

    // 对有0的行和有0的列进行标记
    // 避免重复的标记,有一个0就也只标一次
    // 还要设计截断的机制，当全是0的时候之间停止
public:
    void setZeroes(vector<vector<int>>& matrix) {
        unordered_set<int> row_zero;
        unordered_set<int> col_zero;
        int row = matrix.size();
        if (row == 0) return;  // 处理空矩阵
        int col = matrix[0].size();
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col ;j++) {
                if (matrix[i][j] == 0) {
                    row_zero.insert(i);//集合插入使用 insert() 而非 push()（unordered_set 的插入方法是 insert）
                    col_zero.insert(j);
                }
            }
        }
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                if (row_zero.count(i) || col_zero.count(j))
                    matrix[i][j] = 0;
            }
        }
    }
};
#### 54. 螺旋矩阵 - 中等
- **思维引导**: 维护上下左右四个边界。
class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        if (matrix.empty()) return {};
        int m = matrix.size();
        int n = matrix[0].size();
        int l = 0,r = matrix[0].size()-1,t = 0,b=matrix.size()-1;
        vector<int> ans;
        while(ans.size()<=m*n){
            for(int i = l;i<=r;i++) ans.push_back(matrix[t][i]);
            if(++t>b) break;
            for(int i = t; i <= b;i++) ans.push_back(matrix[i][r]);
            if(l>--r) break; //这个边界有点没看明白
            for(int i = r; i>=l;i--) ans.push_back(matrix[b][i]);
            if(t>--b) break;
            for(int i =b ;i>=t;i--) ans.push_back(matrix[i][l]);
            if(++l>r) break;
        }
    return ans;
        
    }
};
#### 48. 旋转图像 - 中等
- **思维引导**: 先水平翻转，再主对角线翻转（或转置后翻转每一行）。
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
#### 240. 搜索二维矩阵 II - 中等
- **思维引导**: 从右上角开始，像二叉搜索树一样行走。
class Solution {
    //在于这是升序，但是没说第二行一定比第一行小，所以要改变思路使用排除法来完成

    //特性，最小的在左上角，最大的在最右下角
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int m = matrix.size(),n=matrix[0].size();
        int i =0,j = n-1;//为什么从右上角开始
        while(i<m&&j>=0){
            if(matrix[i][j] == target){
                return true;
            }
            if(matrix[i][j]<target){
                i++;
            }else{
                j--;
            }
        }
        return false;
    }
};
---

### 七、链表 (Linked List)
#### 160. 相交链表 
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
    //几乎完全没有怎么接触过的链表相关的东西
    //方法：双指针法
    //a+(b−c)=b+(a−c)
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        ListNode *A =headA,*B = headB;
        while(A != B){
            A = A!=nullptr ? A ->next : headB;//三元运算符表达式
            /*等价于
            if (A != nullptr) {
                A = A->next;    // A指针后移一位
            } else {
                A = headB;      // 如果A为空，则将A指向链表B的头节点
            }
            */
            B = B != nullptr ? B->next : headA;
            //理解为
        }
        return A;
    }
};
| 206. 反转链表 
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        return recur(head,nullptr);
    }
private:
    ListNode * recur(ListNode* cur,ListNode* pre){
        if(cur == nullptr) return pre;
        ListNode* res = recur(cur->next,cur);
        cur->next = pre;
        return res;
    }
};
| 234. 回文链表 
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
    ListNode* middleNode(ListNode* head){
        ListNode * fast = head, *slow = head;
        while(fast&&fast->next){
            slow=slow->next;
            fast=fast->next->next;
        }
        return slow;
    }
    ListNode* reverseList(ListNode* head){
        ListNode* pre = nullptr, *cur =head;
        while(cur){
            ListNode* tmp = cur->next;
            cur->next=pre;
            pre=cur;
            cur=tmp;
        }
        return pre;
    }
public:
    bool isPalindrome(ListNode* head) {
        ListNode* mid = middleNode(head);
        ListNode* head2 = reverseList(mid);
        while(head2){
            if(head->val != head2->val) return false;
            head = head->next;
            head2 = head2->next;
        }
        return true;
    }
};
| 141. 环形链表
给你一个链表的头节点 head ，判断链表中是否有环。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

如果链表中存在环 ，则返回 true 。 否则，返回 false 。
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */

 //双指针快慢指针
func hasCycle(head *ListNode) bool {
    fast ,slow := head,head
    for fast != nil && fast.Next != nil{
        slow = slow.Next
        fast = fast.Next.Next
        if fast == slow{
            return true
        }
    }
    return false
}
- **思维引导**: 双指针/快慢指针/哑节点。

#### 142. 环形链表 II - 中等
- **核心步骤**: 快慢指针相遇后，一指针回起点，另一指针不动，同步走，再次相遇即入口。
给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

不允许修改 链表。
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* detectCycle(ListNode* head) {
        ListNode *fast = head, *slow = head;
        while (true) {
            if (fast == nullptr || fast->next == nullptr)
                return nullptr;
            fast = fast->next->next;
            slow = slow->next;
            if (fast == slow) {
                break;
            }
        }
        fast = head;
        while (slow != fast) {
            slow = slow->next;
            fast = fast->next;
        }
        return fast;
    }
};
#### 21. 合并两个有序链表 
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
//哨兵节点
func mergeTwoLists(list1 *ListNode, list2 *ListNode) *ListNode {
    dummy := ListNode{}
    cur := &dummy
    for list1 != nil && list2 != nil{
        if list1.Val<list2.Val{
            cur.Next = list1
            list1 = list1.Next
        }else{
            cur.Next = list2
            list2=list2.Next
        }
        cur = cur.Next
    }
    // 拼接剩余链表
    if list1 != nil {
        cur.Next = list1
    } else {
        cur.Next = list2
    }
    return dummy.Next
}
| 2. 两数相加 
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
 //对齐然后相加
func addTwo(l1 *ListNode, l2 *ListNode, carry int) *ListNode{
    if l1 == nil && l2 == nil && carry == 0{
        return nil
    }
    //终止条件
    s := carry // 记录进位
    if l1 != nil {
        s += l1.Val
        l1=l1.Next
    }
    if l2 != nil {
        s += l2.Val
        l2 = l2.Next
    }
    return &ListNode{s%10,addTwo(l1,l2,s/10)}
}
func addTwoNumbers(l1 *ListNode, l2 *ListNode) *ListNode {
    return addTwo(l1,l2,0)
}
| 19. 删除倒数 N 
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
//正向取到尺取法l - n 
//需要哨兵节点，因为有可能删除头部
func removeNthFromEnd(head *ListNode, n int) *ListNode {
    dummy := &ListNode{Next: head}
    fast, slow := dummy, dummy

    // 1. fast 先走 n+1 步
    // 这样当 fast 到达末尾(nil)时，slow 正好在倒数第 n 个的前一个
    for i := 0; i <= n; i++ {
        fast = fast.Next
    }

    // 2. 双指针同步移动
    for fast != nil {
        fast = fast.Next
        slow = slow.Next
    }

    // 3. 删除 slow 后面的那个节点
    slow.Next = slow.Next.Next

    return dummy.Next
}
| 24. 两两交换 、
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */

//哨兵节点，因为头部可能会被换
//两两交换的核心在于断开连接然后再重新连接
//递归直到node.next.next == 0
//使用辅助函数进行，然后再连接到头上
/*        node1 := cur.Next
        node2 := cur.Next.Next
        //cur node1 node2
        cur.Next = node2 
        // cur node2 node1 node2
        node1.Next = node2.Next
        // cur node2 node1 node2 node3
        node2.Next = node1
        // cur node2 node1 node3
        cur = node1
        核心三步骤
*/
func swapPairs(head *ListNode) *ListNode {
    dummy := &ListNode{Next : head}
    cur := dummy
    for cur.Next != nil && cur.Next.Next != nil{
        node1 := cur.Next
        node2 := cur.Next.Next
        //cur node1 node2
        cur.Next = node2 
        // cur node2 node1 node2
        node1.Next = node2.Next
        // cur node2 node1 node2 node3
        node2.Next = node1
        // cur node2 node1 node3
        cur = node1
    }
    return dummy.Next
}
| 25. K组翻转
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reverseKGroup(head *ListNode, k int) *ListNode {
    //双重循环分组，但是其实是O(N)的复杂度
    n := 0
    cur := head
    for cur != nil {
        n++
        cur = cur.Next
    }
    dummy := &ListNode{Next:head}
    pre := dummy
    cur = head
    //分组
    group := n/k
    
    for i:=0;i<group;i++{
        //理解cur的位置状态
        for j :=0;j<k-1;j++{
            // pre node1(cur) node2(nxt) node3
            nxt := cur.Next
            cur.Next = nxt.Next

            nxt.Next = pre.Next
            // pre node2(nxt) node1(cur) node3(cur)
            pre.Next = nxt
        }
        pre = cur
        cur = cur.Next
    }
    return dummy.Next
}
- **代码框架**: 链表问题必设 `dummy := &ListNode{Next: head}`。
138. 随机链表的复制
给你一个长度为 n 的链表，每个节点包含一个额外增加的随机指针 random ，该指针可以指向链表中的任何节点或空节点。

构造这个链表的 深拷贝。 深拷贝应该正好由 n 个 全新 节点组成，其中每个新节点的值都设为其对应的原节点的值。新节点的 next 指针和 random 指针也都应指向复制链表中的新节点，并使原链表和复制链表中的这些指针能够表示相同的链表状态。复制链表中的指针都不应指向原链表中的节点 。
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
    nodeMap:= make(map[*Node]*Node)
    cur := head
    // 2. 第一次遍历：只复制节点本身，建立映射关系
    for cur != nil {
        newNode := &Node{Val:cur.Val}
        nodeMap[cur]=newNode
        cur = cur. Next
    }
    cur = head
    // 重置指针回到头部
    // 3. 第二次遍历：构建 Next 和 Random 指针
    for cur != nil {
        nodeMap[cur].Next = nodeMap[cur.Next]
        nodeMap[cur].Random = nodeMap[cur.Random]
        cur = cur.Next
    }
    return nodeMap[head]
}
148. 排序链表
给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* sortList(ListNode* head) {
        if(!head) return nullptr;
        vector<int> values;
        //
        ListNode* current  = head;
        while(current){
            values.push_back(current->val);
            current=current->next;
        }
        //
        ranges::sort(values.begin(),values.end());
        //
        current = head;
        for(int value:values){
            current->val= value;
            current = current->next;
        }

        return head;
    }
};
23. 合并 K 个升序链表
给你一个链表数组，每个链表都已经按升序排列。
请你将所有链表合并到一个升序链表中，返回合并后的链表。
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeTwoLists(list1,list2 *ListNode)*ListNode {
    dummy := &ListNode{}
    cur := dummy
    for list1 != nil && list2 != nil{
        if list1.Val < list2.Val{
            cur.Next=list1
            list1=list1.Next
        }else{
            cur.Next = list2
            list2=list2.Next
        }
        cur=cur.Next
    }
    // 拼接剩余链表
    if list1 != nil {
        cur.Next = list1
    } else {
        cur.Next = list2
    }
    return dummy.Next
}

func mergeKLists(lists []*ListNode) *ListNode{
    m := len(lists)
    if m==0{
        return nil
    }
    if m==1{
        return lists[0]
    }

    left := mergeKLists(lists[:m/2])
    right :=mergeKLists(lists[m/2:])
    return mergeTwoLists(left,right)
}
#### 146. LRU 缓存 - 中等
- **数据结构**: **哈希表 + 双向链表**。哈希提供 $O(1)$ 查找，链表提供 $O(1)$ 移动到头部（最近使用）。
type Node struct{
    key,value int
    prev,next *Node
}
type LRUCache struct {
    capacity int
    dummy *Node
    keyToNode map[int]*Node
}

func Constructor(capacity int) LRUCache {
    dummy := &Node{}
    dummy.prev = dummy
    dummy.next = dummy
    return LRUCache{
        capacity : capacity,
        dummy: dummy,
        keyToNode : map[int]*Node{},
    }
}
func (c *LRUCache) remove(x* Node){
    x.prev.next = x.next
    x.next.prev = x.prev
}
func (c *LRUCache) pushFront(x *Node){
    x.prev=c.dummy
    x.next = c.dummy.next
    x.prev.next = x
    x.next.prev = x
}
func (c *LRUCache) getNode(key int)*Node{
    node := c.keyToNode[key]
    if node == nil {
        return nil
    }
    c.remove(node)
    c.pushFront(node)
    return node
}
func (this *LRUCache) Get(key int) int {
    node := this.getNode(key)
    if node == nil{
        return -1
    }
    return node.value
}

func (this *LRUCache) Put(key int, value int)  {
    //先查询node有没有
    //有改数值就行
    node := this.getNode(key)
    if node != nil {
        node.value = value
        return
    }
    //没有就要插入了先创建一个node，然后放到头上
    node = &Node{key:key,value:value}
    this.keyToNode[key]=node
    this.pushFront(node)
    if len(this.keyToNode)<=this.capacity{
        return
    }else{
        backNode := this.dummy.prev
        delete(this.keyToNode,backNode.key)
        this.remove(backNode)
    }
}


/**
 * Your LRUCache object will be instantiated and called as such:
 * obj := Constructor(capacity);
 * param_1 := obj.Get(key);
 * obj.Put(key,value);
 */
---

### 八、二叉树 (Binary Tree)
94. 二叉树的中序遍历
给定一个二叉树的根节点 root ，返回 它的 中序 遍历
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
    //看不懂捏
    //对于树这块儿完全是两眼一抹黑
    //将树最小化然后，不断地划分最小单位进行递归

public:
    void inorder (TreeNode* root , vector<int>& res){
        if(!root) {
            return;
        }
        inorder(root->left,res);
        res.push_back(root->val);
        inorder(root->right,res);
    }
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> res;
        inorder(root,res);
        return res;
    }
};
104. 二叉树的最大深度
给定一个二叉树 root ，返回其最大深度。

二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
//动态更新最值，主要是遍历啥的,递归左右子树
func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0;//递归的终止条件
    }else{
        //左右递归的过程
        Left := maxDepth(root.Left)
        Right := maxDepth(root.Right)
        return max(Left,Right)+1
    }
}
226,翻转二叉树
给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
//直接左右递归
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
 101,对称二叉树
 给你一个二叉树的根节点 root ， 检查它是否轴对称
 /**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isSameTree(p,q *TreeNode)bool{
    if p==nil || q==nil{
        return p==q
    }
    return p.Val == q.Val && isSameTree(p.Left,q.Right) && isSameTree(p.Right,q.Left)
}
func isSymmetric(root *TreeNode) bool {
    return isSameTree(root.Left,root.Right)
}
543. 二叉树的直径
给你一棵二叉树的根节点，返回该树的 直径 。
二叉树的 直径 是指树中任意两个节点之间最长路径的 长度 。这条路径可能经过也可能不经过根节点 root 。
两节点之间路径的 长度 由它们之间边数表示。
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int diameterOfBinaryTree(TreeNode* root) {
        int ans = 0;
        auto dfs=[&](this auto&& dfs,TreeNode* root){
            if(root==nullptr){
                return -1;
            }
            int len_l=dfs(root->left)+1;
            int len_r=dfs(root->right)+1;
            ans=max(ans,len_l+len_r);
            return max(len_l,len_r);
        };
        dfs(root);
        return ans;
    }
};
- **思维引导**: 递归（DFS）或 队列（BFS）。

#### 102. 层序遍历 (Medium)
- **模板**: `queue` + `for size := len(q)` 逐层剥离。
给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
//用一个队列数组实现层序遍历BFS
func levelOrder(root *TreeNode) (ans [][]int) {
    //基础操作
    if root == nil {
        return 
    }
    //创建当前的进行存储
    cur := []*TreeNode{root}
    for len(cur) >0 {
        nxt := []*TreeNode{}
        vals := make([]int,len(cur))
        for i,node := range cur{
            vals[i]= node.Val
            if node.Left != nil{
                nxt = append(nxt,node.Left)
            }
            if node.Right != nil{
                nxt = append(nxt,node.Right)
            }
        }
        cur = nxt
        ans = append(ans,vals)
    }
    return ans
}
108. 将有序数组转换为二叉搜索树
给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 平衡 二叉搜索树。
 //先复习一下概念，什么是平衡二叉搜索树
 ////二叉搜索树是什么，左 《 根 《 右节点
//要找到有序数组的中间的位置
func sortedArrayToBST(nums []int) *TreeNode {
    if len(nums) == 0 {
        return nil
    }
    m := len(nums)/2
    return & TreeNode{
        Val : nums[m],
        Left : sortedArrayToBST(nums[:m]),
        Right: sortedArrayToBST(nums[m+1:]),
    }
}
98. 验证二叉搜索树
给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。
有效 二叉搜索树定义如下：
节点的左子树只包含 严格小于 当前节点的数。
节点的右子树只包含 严格大于 当前节点的数。
所有左子树和右子树自身必须也是二叉搜索树
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
    long long pre = LLONG_MIN;
public:
    bool isValidBST(TreeNode* root) {
        if(root == nullptr) return true;
        if(!isValidBST(root->left)){
            return false;
        }
        if(root->val<=pre){
            return false;
        }
        pre = root->val;
        if(!isValidBST(root->right)){
            return false;
        }else return true;
        //右
    }
};
230. 二叉搜索树中第 K 小的元素
给定一个二叉搜索树的根节点 root ，和一个整数 k ，请你设计一个算法查找其中第 k 小的元素（k 从 1 开始计数）。
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int kthSmallest(TreeNode* root, int k) {
        this->k= k;
        dfs(root);
        return res;
    }
private:
    int k,res;
    void dfs(TreeNode* root){
        if(root==nullptr){
            return;
        }
        dfs(root->left);
        if(k==0) return;
        if(--k==0) res = root->val;
        dfs(root->right);
    }
};
199. 二叉树的右视图
给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
 //简单的递归子树+记录深度存储每一层的最右边的
func rightSideView(root *TreeNode) (ans []int) {
    var dfs func(*TreeNode , int)
    dfs = func(node *TreeNode, depth int){
        if node == nil{
            return
        }
        if depth == len(ans){
            ans= append(ans,node.Val)
        }
        dfs(node.Right,depth+1)
        dfs(node.Left,depth+1)
    }
    dfs(root,0)
    return
}
 114. 展开为链表 
 给你二叉树的根结点 root ，请你将它展开为一个单链表：

展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
展开后的单链表应该与二叉树 先序遍历 顺序相同。
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func flatten(root *TreeNode)  {
    var head *TreeNode
    var dfs func(*TreeNode)
    dfs = func(node *TreeNode){
        if node == nil{
            return
        }
        dfs(node.Right)
        dfs(node.Left)
        node.Left = nil
        node.Right = head
        head = node
    }
    dfs(root)
}
 236. 最近公共祖先
#### 105. 构造二叉树 |
- **思维引导**: 分而治之。重点处理 `root` 与其 `left`, `right` 的关系。
给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。
//处理两个数组
//从前序获取开头根节点，中序获取左右子树进行划分
func buildTree(preorder []int, inorder []int) *TreeNode {
    n:=len(preorder)
    if n==0{
        return nil
    }
    leftSize := slices.Index(inorder,preorder[0])
    left := buildTree(preorder[1:1+leftSize],inorder[:leftSize])
    right := buildTree(preorder[1+leftSize:],inorder[leftSize+1:])
    return &TreeNode{preorder[0],left,right}
}
437. 路径总和 III
给定一个二叉树的根节点 root ，和一个整数 targetSum ，求该二叉树里节点值之和等于 targetSum 的 路径 的数目。

路径 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）
//记忆方案
func pathSum(root *TreeNode, targetSum int) (ans int) {
    cnt := map[int]int{0:1}
    var dfs func(*TreeNode,int)
    dfs = func(node *TreeNode,s int){
        if node == nil {
            return 
        }
        s += node.Val
        ans += cnt[s-targetSum]
        cnt[s]++
        dfs(node.Left,s)
        dfs(node.Right,s)
        cnt[s]--
    }
    dfs(root,0)
    return ans
}
236. 二叉树的最近公共祖先
给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
func lowestCommonAncestor(root, p, q *TreeNode) *TreeNode {
  if root == nil || root == p || root == q {
        return root // 找到 p 或 q 就不往下递归了，原因见上面答疑
    }
    left := lowestCommonAncestor(root.Left, p, q)
    right := lowestCommonAncestor(root.Right, p, q)

    // 如果只有左子树找到，就返回左子树的返回值
    // 如果只有右子树找到，就返回右子树的返回值
    // 如果左右子树都没有找到，就返回 nil（注意此时 right = nil）
 if left == nil {
		return right
	}
	if right == nil {
		return left
	}
	return root

}
#### 124. 最大路径和 (Hard)
- **思维**: DFS 返回包含自身的单侧最大路径，同时更新全局 Max。
二叉树中的 路径 被定义为一条节点序列，序列中每对相邻节点之间都存在一条边。同一个节点在一条路径序列中 至多出现一次 。该路径 至少包含一个 节点，且不一定经过根节点。

路径和 是路径中各节点值的总和。

给你一个二叉树的根节点 root ，返回其 最大路径和 
class Solution {
public:
    int maxPathSum(TreeNode* root) {
        int ans = INT_MIN;
        auto dfs = [&](this auto&& dfs , TreeNode* node)->int{
            if(node == nullptr) return 0;
            int l_val = dfs(node->left);
            int r_val = dfs(node->right);
            ans = max(ans,l_val+r_val+node->val);
            return max(max(l_val,r_val)+node->val,0);
        };
        dfs(root);
        return ans;
    }
};
---

### 九、图论 / 回溯 (Graph / Backtracking)
#### 200. 岛屿数量 
给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。
//二维动态规划，关键在于状态的处理
//当成四叉树来做
func numIslands(grid [][]byte) int {
    m,n := len(grid),len(grid[0])
    var dfs func(int,int)
    dfs = func(i,j int){
        if i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != '1' {
            return
        }
        grid[i][j]='2'
        dfs(i,j-1)
        dfs(i,j+1)
        dfs(i-1,j)
        dfs(i+1,j)
    }
    var ans int
    for i,row := range grid{
        for j,c := range row {
            if c== '1'{
                dfs(i,j)
                ans++
            }
        }
    }
    return ans
}
| 994. 腐烂的橘子
在给定的 m x n 网格 grid 中，每个单元格可以有以下三个值之一：

值 0 代表空单元格；
值 1 代表新鲜橘子；
值 2 代表腐烂的橘子。
每分钟，腐烂的橘子 周围 4 个方向上相邻 的新鲜橘子都会腐烂。

返回 直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 -1 。
class Solution {
    static constexpr int DIRECTIONS[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
public:
    int orangesRotting(vector<vector<int>>& grid) {
        int m = grid.size(),n= grid[0].size();
        int fresh =0;
        vector<pair<int,int>>q;
        for(int i=0;i<m;i++){
            for(int j =0;j<n;j++){
                if (grid[i][j]==1){
                    fresh++;
                }else if(grid[i][j]==2){
                    q.emplace_back(i,j);
                }
            }
        }
    int ans =0;
    while(fresh&&!q.empty()){
        ans++;
        vector<pair<int,int>>nxt;
        for(auto&[x,y]:q){
            for(auto&[dx,dy]:DIRECTIONS){
                int i =x+dx,j=y+dy;
                if(0 <= i && i < m && 0 <= j && j < n &&grid[i][j]==1){
                    fresh--;
                    grid[i][j]=2;
                    nxt.emplace_back(i,j);
                }
            }
        }
        q=move(nxt);
    }
    return fresh ? -1:ans;
    }
};
- **思维引导**: DFS/BFS 蔓延。

#### 46. 全排列 
class Solution {
public:
    vector<vector<int>> permute(vector<int>& nums) {
        int n = nums.size();
        vector<vector<int>> ans;
        vector<int> path(n);
        vector<bool> on_path(n);
        auto dfs = [&](this auto&&dfs , int i ){
            if (i == n){
                ans.emplace_back(path);
                return;
            }
            for (int j = 0; j < n ;j++){
                if(!on_path[j]){
                    path[i] = nums [j];
                    on_path [j] = true;
                    dfs(i+1);
                    on_path[j] = false;
                }
            }
        };
        dfs(0);
        return ans;
    }
};
| 78. 子集 
给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
class Solution {
public:
    vector<vector<int>> subsets(vector<int>& nums) {
        int n = nums.size();
        vector<vector<int>> ans;
        vector<int> path;

        auto dfs = [&](this auto && dfs , int i) {
            if(i == n){
                ans.emplace_back(path);
                return;
            }

            dfs(i+1);
            path.push_back(nums[i]);
            dfs(i+1);
            path.pop_back();
        };
    dfs(0);
    return ans;
    }
};
| 17. 电话组合 
给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
const string MAPPING[10]={"","","abc","def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
class Solution {
public:
    vector<string> letterCombinations(string digits) {
        int n = digits.size();
        if(n == 0) return {};
        vector<string> ans;
        string path(n,0);
        auto dfs = [&](this auto&&dfs, int i){
            if (i==n){
                ans.emplace_back(path);
                return;
            }
            for(char c:MAPPING[digits[i]-'0']){  
            //这个地方要注意类型的转换
            //假设输入的字符串String值为 '23'，那么存储的this.digits字符数组中为 ['2', '3']。
            //在ASCII编码中，每个字符都有一个对应的整数值。
            //假设循环取 digits[i] 的值为 '3'，
            //那么 digits[i] - '0' 实际操作为 51-48 = 3，巧妙的将char字符转换为int
                path[i]=c;
                dfs(i+1);
                //直接覆盖无须恢复现场
            }
        };
        dfs(0);
        return ans;
    }
};
给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
39. 组合总和
给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。

candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。 

对于给定的输入，保证和为 target 的不同组合数少于 150 个。
class Solution {
public:
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        int n = candidates.size();
        vector<vector<int>> ans;
        vector<int> path;

        auto dfs = [& ](this auto &&dfs, int i ,int left){
            if(left == 0){
                ans.push_back(path);
                return;
            }
            if(i == n || left <0) return;

            dfs(i+1,left);

            path.push_back(candidates[i]);
            dfs(i,left-candidates[i]);
            path.pop_back();
        };
        dfs(0,target);
        return ans;
    }
};
22. 括号生成
数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
class Solution {
public:
    vector<string> generateParenthesis(int n) {
        vector<string> ans;
        string path (n*2,0);  //生成n对括号，肯定有2*n个字符
        //枚举当前位置填左括号还是右括号
        //本质上来说，我们需要在 0,1,2,…,2n−1 中选 n 个数（位置），填入左括号。其余 n 位置填入右括号。
        //选一个基准作为退出的指标，右括号肯定在最右边，且与左括号强相关
        auto dfs = [&](this auto &&dfs,int left,int right) ->void {
            if(right == n){
                ans.emplace_back(path);
                return;
            }
            if(left<n){
                path[left+right]='(';
                dfs(left+1,right);
            }
            if(right<left){
                path[left+right]=')';
                dfs(left,right+1);
            }
        };
        dfs(0,0);
        return ans;
    }
};
79. 单词搜索
给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
class Solution {
    static constexpr int DIRS[4][2] = {{0,1},{0,-1},{1,0},{-1,0}};
public:
    bool exist(vector<vector<char>>& board, string word) {
        unordered_map<char,int> cnt;
        for(auto& row:board){
            for (char c:row){
                cnt[c]++;
            }
        }
        //优化一 比较次数,不符合直接pass
        unordered_map<char,int>word_cnt;
        for(char c:word){
            if(++word_cnt[c]>cnt[c]){
                return false;
            }
        }
    }
};
131. 分割回文串
给你一个字符串 s，请你将 s 分割成一些 子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。
class Solution {
    bool is_palindrome(const string& s,int left,int right){
        while(left<right){
            if(s[left++] != s[right--]) {
                return false;
            }
        }
        return true;
    }
public:
    vector<vector<string>> partition(string s) {
        int n = s.length();
        vector<vector<string>> ans;
        vector<string> path;

        auto dfs = [&](this auto &&dfs,int i,int start) {
            if(i==n){
                ans.emplace_back(path);
                return;
            }

            // 转换为插入逗号的位置的视角
            if(i<n-1){
                dfs(i+1,start);
            }

            if(is_palindrome(s,start,i)){
                path.emplace_back(s.substr(start,i-start+1));
                dfs(i+1,i+1);
                path.pop_back(); //恢复现场
            }
        };
        dfs(0,0);
        return ans;
    }
};
| 51. N 皇后
- **核心步骤**: 选择 -> 递归 -> **撤销选择**。特别注意 Go 中 `copy(path)` 到 `res` 中。
按照国际象棋的规则，皇后可以攻击与之处在同一行或同一列或同一斜线上的棋子。

n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

---
class Solution {
    //相互攻击如何判断，利用
    //col[c]=diag1[r+c]=diag2[rc]=true; // 占用了c列和两个斜线
public:
    vector<vector<string>> solveNQueens(int n) {
        vector<vector<string>>ans;
        vector borad(n,string(n,'.'));
        vector<bool> col(n), diag1(n*2-1),diag2(n*2-1);

        auto dfs = [&](this auto&&dfs , int r) {
            if (r==n){
                ans.emplace_back(borad);
                return;
            }
            for(int c = 0 ; c<n;c++){
                int rc = r-c+n-1; //实际的含义是?
                if(!col[c] && !diag1[r+c] && !diag2[rc]){

                    borad[r][c] = 'Q';
                    col[c]=diag1[r+c]=diag2[rc] = true;
                    dfs(r+1);
                    col[c] = diag1[r+c] = diag2[rc] =false;
                    borad[r][c]= '.';
                }
            }
        };
        dfs(0);
        return ans;
    }
};
### 十、二分查找 / 栈 / 堆 (Binary Search / Stack / Heap)
35. 搜索插入位置
给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

请必须使用时间复杂度为 O(log n) 的算法。
func searchInsert(nums []int, target int) int {
    left,right := 0, len(nums)-1
    for left<= right{
        mid := left + (right-left)/2
        if nums[mid] < target{
            left = mid + 1
//             //避免无限循环：
// 如果不使用 +1 或 -1，当搜索范围缩小到只剩下两个元素时，可能会出现 left 和 right 始终不相遇的情况，导致循环无法终止。
// 例如：当 left = mid 且 right = mid 时，如果不调整边界，下一次计算的 mid 仍然相同，循环会无限进行。
        }else{
            right = mid -1
        }
    }
    return left
}
74. 搜索二维矩阵
已解答
中等
相关标签
premium lock icon
相关企业
给你一个满足下述两条属性的 m x n 整数矩阵：

每行中的整数从左到右按非严格递增顺序排列。
每行的第一个整数大于前一行的最后一个整数。
给你一个整数 target ，如果 target 在矩阵中，返回 true ；否则，返回 false 。
func searchMatrix(matrix [][]int, target int) bool {
    // 处理空矩阵的情况
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return false
    }
    rows := len(matrix)
    cols := len(matrix[0])
    // 遍历每行，找到目标可能所在的行后立即搜索
    for i := 0; i < rows; i++ {
        // 如果目标小于当前行的第一个元素，说明不在当前行及以后的行
        if target < matrix[i][0] {
            return false
        }
        // 如果目标大于当前行的最后一个元素，继续检查下一行
        if target > matrix[i][cols-1] {
            continue
        }
        // 到达这里说明目标可能在当前行，直接在当前行搜索
        for _, val := range matrix[i] {
            if val == target {
                return true
            }
        }
        // 如果在当前行没找到，说明不存在目标值
        return false
    }
    // 遍历所有行后仍未找到
    return false
}
34. 在排序数组中查找元素的第一个和最后一个位置
给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。
如果数组中不存在目标值 target，返回 [-1, -1]。

你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。
func searchRange(nums []int, target int) []int {
    //如何跳过一直跳直到最后
    lower_bound := func(nums []int , target int) int {
        left,right := 0,len(nums)-1
        for left-right <= 0{
            mid := left + (right - left)/2
            if nums[mid]<target{
                left = mid+1
            }else{
                right=mid -1
            }
        }
        return left
    }
    start := lower_bound(nums,target)
    if start == len(nums) || nums[start] != target{
        return []int{-1,-1}
    }
    end := lower_bound(nums,target+1)-1;
    return[]int{start,end}
}
#### 33. 搜索旋转数组 | 153. 旋转数组最小值
- **思维引导**: 二分时，总有一边是有序的。
整数数组 nums 按升序排列，数组中的值 互不相同 。

在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 向左旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 下标 3 上向左旋转后可能变为 [4,5,6,7,0,1,2] 。

给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

你必须设计一个时间复杂度为 O(log n) 的算法解决此问题。
class Solution {
    // 变成了两个有序的整数数组，但分割点未知
    // 能否用多个二分查找先进行旋转点的查找

    // 旋转到底带来了什么改变
    // 分析，旋转之后的数组特性，左半段一定大于右半段
    // 捕捉特性寻找联系
    int find_min(vector<int>& nums) {
        int left = 0, right = nums.size() - 1; 
        while (left  < right) { //循环条件，闭区间
            int mid = left + (right - left) / 2;
            if (nums[mid] >= nums.back()) {
                left = mid+1;
            } else {
                right = mid;
            }
        }
        return left;
    }
    //
    int lower_bound(vector<int>& nums, int left, int right, int target) {
        while (left + 1 < right) {
            int mid = left + (right - left) / 2;
            if (nums[mid] >= target) {
                right = mid;
            } else {
                left = mid;
            }
        }
        return nums[right] == target ? right : -1;
    }

public:
    int search(vector<int>& nums, int target) {
        int i = find_min(nums);
        cout<<i<<endl;
        if (target > nums.back()) {
            return lower_bound(nums, -1, i, target);
        }
        return lower_bound(nums, i - 1, nums.size(), target);
    }
};
153. 寻找旋转排序数组中的最小值
已知一个长度为 n 的数组，预先按照升序排列，经由 1 到 n 次 旋转 后，得到输入数组。例如，原数组 nums = [0,1,2,4,5,6,7] 在变化后可能得到：
若旋转 4 次，则可以得到 [4,5,6,7,0,1,2]
若旋转 7 次，则可以得到 [0,1,2,4,5,6,7]
注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 。

给你一个元素值 互不相同 的数组 nums ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 最小元素 。

你必须设计一个时间复杂度为 O(log n) 的算法解决此问题。
class Solution {
public:
    int findMin(vector<int>& nums) {
        int left =-1 ,right = nums.size()-1;
        while(left+1<right){
            int mid = left+(right-left)/2;
            (nums[mid]<nums.back() ? right:left) = mid; //if he else 的压缩写法
        }
        return nums[right];
    }
};
4. 寻找两个正序数组的中位数
已解答
困难
相关标签
premium lock icon
相关企业
给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。
class Solution {
    // 将这两个如何拼成一个呢还是完全不需要拼感觉完全不需要啊

    // 两个指针并行就行了，但是这样好像就不是二分了，好像还是要先拼啊
    // 问题来了，要拼的话要用几次二分查找呢

    // 我们需要在两个有序数组中，查找第 k 小的数，其中 k=
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int m = nums1.size(), n = nums2.size();
        int total = m + n;
        int i = 0, j = 0, prev = 0, cur = 0;

        // 找到第(total/2 + 1)小的元素
        for (int cnt = 0; cnt <= total / 2; cnt++) {
            prev = cur;
            if (i < m && (j >= n || nums1[i] < nums2[j])) {
                cur = nums1[i++];
            } else {
                cur = nums2[j++];
            }
        }

        // 根据总长度奇偶性返回结果
        if (total % 2 == 1) {
            return cur;
        } else {
            return (prev + cur) / 2.0;
        }
    }
};
20. 有效的括号
已解答
简单
相关标签
premium lock icon
相关企业
提示
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
每个右括号都有一个对应的相同类型的左括号。
//出入栈最后栈空为有效
//在go中使用切片模拟栈
func isValid(s string) bool {
    if len(s)%2 != 0 {
        return false
    }
    mp := map[rune]rune{')': '(', ']': '[', '}': '{'}
    st := []rune{}
    for _,c :=range s {
        if mp[c] == 0 {
            st = append(st,c)
        }else{
            if len(st)==0 || st[len(st)-1]!=mp[c]{
                return false
            }
            st = st[:len(st)-1]
        }
    }
    return len(st) == 0
}
155. 最小栈
设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

实现 MinStack 类:

MinStack() 初始化堆栈对象。
void push(int val) 将元素val推入堆栈。
void pop() 删除堆栈顶部的元素。
int top() 获取堆栈顶部的元素。
int getMin() 获取堆栈中的最小元素。
type pair struct{val,preMin int}
type MinStack []pair


func Constructor() MinStack {
    return MinStack{{0,math.MaxInt}}
}

func (this *MinStack) Push(val int)  {
    *this = append(*this,pair{val,min(this.GetMin(),val)})  
}

func (this *MinStack) Pop()  {
    *this = (*this)[:len(*this)-1]   
}

func (this MinStack) Top() int {
    return this[len(this)-1].val    
}


func (this MinStack) GetMin() int {
    return this[len(this)-1].preMin
}


/**
 * Your MinStack object will be instantiated and called as such:
 * obj := Constructor();
 * obj.Push(val);
 * obj.Pop();
 * param_3 := obj.Top();
 * param_4 := obj.GetMin();
 */
394. 字符串解码
给定一个经过编码的字符串，返回它解码后的字符串。

编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。

你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

测试用例保证输出的长度不会超过 105。
class Solution {
public:
    string decodeString(string s) {
        string res = "";
        int multi = 0;
        stack<int> nums;
        stack<string> strs;
        for(char c:s){
            if(c=='['){
                nums.push(multi);
                strs.push(res);
                multi=0;
                res= "";
            }
            else if (c == ']'){
                string tmp = "";
                int cur_multi = nums.top();
                nums.pop();
                for(int i =0;i<cur_multi;i++) tmp += res;
                res=strs.top() + tmp;
                strs.pop();
            }
            else if(c>= '0' && c <= '9') multi = multi *10 + c-'0';
            else if((c >= 'a' && c <= 'z') ||(c >= 'A' && c <= 'Z')) res =res+ c ;
        }
        return res;
    }
};
#### 739. 每日温度 (Medium) 
给定一个整数数组 temperatures ，表示每天的温度，返回一个数组 answer ，其中 answer[i] 是指对于第 i 天，下一个更高温度出现在几天后。如果气温在这之后都不会升高，请在该位置用 0 来代替。
class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& temperatures) {
        int n = temperatures.size();
        vector<int> res(n,0);
        stack<int> st;
        for(int i =0;i<n;i++){
            while(!st.empty()&&temperatures[i]>temperatures[st.top()]){
                auto t = st.top() ; st.pop();
                res [t] = i-t;
            }
            st.push(i);
        }
        return res;
    }
};
| 84. 矩形最大面积 (Hard)
给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        int n = heights.size();
        vector<int> left(n,-1);
        stack<int> st;
        //先构建一个单调栈
        for(int i =0;i<n;i++){
            while(!st.empty()&&heights[i]<=heights[st.top()]){
                st.pop();
            }
            if(!st.empty()){
                left[i]=st.top();
            }
            st.push(i);
        }
        //最后的left的形态是什么是每一个i对应的左边的值用于后面计算其对应的矩形大小
        vector<int> right(n,n);
        st = stack<int>();
        for(int i = n-1;i>=0;i--){
            while(!st.empty()&&heights[i]<=heights[st.top()]){
                st.pop();
            }
            if(!st.empty()){
                right[i]=st.top();
            }
            st.push(i);
        }
        int ans = 0;
        for(int i =0;i<=n-1;i++){
            ans= max(ans,heights[i]*(right[i]-left[i]-1));
        }
        return ans;
    }
};
求在该柱状图中，能够勾勒出来的矩形的最大面积。
- **思维引导**: **单调栈**。寻找元素左右两边第一个比它大/小的元素。

#### 215. 第 K 个最大 (Medium)
- **工具**: `container/heap` 或快速选择。
### 堆
数组中的第K个最大元素
给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。
代码：
class Solution {
    //快速排序的核心包括“哨兵划分” 和 “递归” 
public:
    int findKthLargest(vector<int>& nums, int k) {
        auto dfs = [&](this auto && dfs,vector<int>& nums,int k)->int{
            int pivot = nums[rand()%nums.size()]; //随机选择基准数
            vector<int> big , equal,small;//基于基准数进行元素划分
            for(int num:nums){
                if(num > pivot){
                    big.push_back(num);
                }
                if(num == pivot){
                    equal.push_back(num);
                }
                if(num < pivot){
                    small.push_back(num);
                }
            }
            // 第 k 大元素在 big 中，递归划分
            if(k<= big.size()) return dfs(big,k);
            if(nums.size()-small.size()<k) return dfs(small,k-nums.size()+small.size());
           // 第 k 大元素在 equal 中，直接返回 pivot
            return pivot;
        };
        return dfs(nums,k);
    }
};
前 K 个高频元素
给你一个整数数组 nums 和一个整数 k ，请你返回其中出现频率前 k 高的元素。你可以按 任意顺序 返回答案。
class Solution {
    // 算法的核心思想是：
    // 统计频率：先用一个哈希表（unordered_map）记录每个数字出现的次数
    // 装桶：创建一个“桶”的集合（在这里用vector<vector<int>>实现）。每个桶的“编号”代表一个频率，桶里装的是所有出现这个频率的数字。
    // 倒序取数：从频率最高的桶开始，依次取出里面的数字，直到取够 k 个为止。
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        // 第一步 统计每个元素的出现次数
        unordered_map<int, int> cnt;
        int max_cnt = 0;
        for (int x : nums) {
            cnt[x]++;
            max_cnt = max(max_cnt, cnt[x]);
        }

        //
        vector<vector<int>> buckets(max_cnt + 1);
        for (auto& [x, c] : cnt) {
            buckets[c].push_back(x);
        }
        vector<int> ans;
        for (int i = max_cnt; i >= 0 && ans.size() < k; i--) {
            ans.insert(ans.end(), buckets[i].begin(), buckets[i].end());
        }
        return ans;
    }
};
数据流的中位数
class MedianFinder {
    //利用中位数的特性，将数据分成左右两堆

    //可以将数据流保存在一个列表中，并在添加元素时 保持数组有序 。此方法的时间复杂度为 O(N)
    //
    //利用小顶堆（最小值在最顶）和大顶堆（最大值在最顶）

    //指定左右堆的规则
    //偶数 ： 左右大小相同
    //奇数 ： 左边比右边多一个，大小为N+1/2

    //插入 会存在从奇数变成偶数的情况，同理偶数也是一样的

    //查找 相对简单
public:
    //使用优先队列
    priority_queue<int,vector<int>,greater<int>> A;//小顶堆
    priority_queue<int,vector<int>,less<int>> B;//大顶堆
    MedianFinder() {
        
    }
    
    void addNum(int num) {
        if(A.size()!=B.size()){
            A.push(num);
            B.push(A.top());
            A.pop();
        }else{
            B.push(num);
            A.push(B.top());
            B.pop();
        }
        // else 和 if 会有结果上的区别要考
    }
    
    double findMedian() {
        return A.size()!=B.size()?A.top():(A.top()+B.top())/2.0;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
---
### 贪心算法
买卖股票的最佳时机
121. 买卖股票的最佳时机
给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
//经典贪心的题目,局部的最优解
//单次交易
func maxProfit(prices []int) int {
    ans := 0
    minPrice := prices[0]
    for _,x := range prices{
        ans = max(ans,x-minPrice)
        minPrice = min(x,minPrice)
    }
    return ans
}
买卖股票的最佳时机 II
跳跃游戏
给你一个非负整数数组 nums ，你最初位于数组的 第一个下标 。数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个下标，如果可以，返回 true ；否则，返回 false 。
代码
func canJump(nums []int) bool {
    mx := 0
    for i,x := range nums{
        if i>mx{
            return false
        }else{
            mx = max(mx,i+x)
        }
    }
    return true
}
跳跃游戏 II
给定一个长度为 n 的 0 索引整数数组 nums。初始位置在下标 0。

每个元素 nums[i] 表示从索引 i 向后跳转的最大长度。换句话说，如果你在索引 i 处，你可以跳转到任意 (i + j) 处：

0 <= j <= nums[i] 且
i + j < n
返回到达 n - 1 的最小跳跃次数。测试用例保证可以到达 n - 1。
func jump(nums []int) int {
    //在判断能不能到达的同时，给出到达当前第i个位置所需的最小的跳跃次数
    //不是在无路可走的那个位置造桥，而是当发现无路可走的时候，时光倒流到能跳到最远点的那个位置造桥。
    //换句话说，在无路可走之前，我们只是在默默地收集信息，没有实际造桥。

    //在可以选的桥中，选择右端点最大的桥

    //和原来的区别在于
    ans,cur_right,nxt_right := 0,0,0
    for i:=0;i<len(nums)-1;i++{
        nxt_right = max(nxt_right,i+nums[i])
        if i == cur_right{
            cur_right = nxt_right
            ans++
        }
    }
    return ans
}
划分字母区间
给你一个字符串 s 。我们要把这个字符串划分为尽可能多的片段，同一字母最多出现在一个片段中。例如，字符串 "ababcc" 能够被分为 ["abab", "cc"]，但类似 ["aba", "bcc"] 或 ["ab", "ab", "cc"] 的划分是非法的。

注意，划分结果需要满足：将所有划分结果按顺序连接，得到的字符串仍然是 s 。

返回一个表示每个字符串片段的长度的列表。
class Solution {
    //题目都有些没读懂到底要划分什么

    //好坏到底是由哪个来评价的
    //和跳跃游戏二一样有一个类似时光倒流的过程

    //看字串最后一个字符划分的位置，最后一次出现的位置  use an map like "last['b'] = 5"

    //将表格中的区间合并为如下几个大区间：

    // [0,8],[9,15],[16,23]，和跳跃游戏很像有一个建立表格的过程
public:
    vector<int> partitionLabels(string s) {
        int n = s.length();
        int last[26];
        for(int i=0;i<n;i++){
            last[s[i]-'a']=i;
        }

        vector<int> res;
        int start=0,end=0;
        for(int i =0;i<n;i++){
            end = max(end,last[s[i]-'a']);
            if(end==i){
                res.push_back(end-start+1);
                start = i+1;
            }
        }
        return res;
    }
};
### 十一、动态规划 (DP)
#### 70. 爬楼梯 
假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
class Solution {
    vector<int> memo;
    int dfs(int i){
        if(i<=1) return 1;
        int &res = memo[i];
        if(res){
            return res;
        }
        return res = dfs(i-1)+dfs(i-2);
    }
public:
    int climbStairs(int n) {
        memo.resize(n+1);
        return dfs(n);
    }
};
Go 语言版本
func climbStairs(n int) int {
    memo := make([]int, n+1)
    var dfs func(int) int
    dfs = func(i int) int {
        if i <= 1 {
            return 1
        }
        if memo[i] != 0 {
            return memo[i]
        }
        memo[i] = dfs(i-1) + dfs(i-2)
        return memo[i]
    }
    return dfs(n)
}
- **思维引导**: 从最后一个台阶的两种状态开始推
杨辉三角
给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。
在「杨辉三角」中，每个数是它左上方和右上方的数的和。
代码实现
主要是调整一下数组
class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<vector<int>> c (numRows);
        for(int i=0;i < numRows;i++){
            c[i].resize(i+1,1);
            for(int j=1;j<i;j++){
                c[i][j] = c[i-1][j-1]+c[i-1][j];
            }
        }
    return c;
    }
};
#### 198. 打家劫舍 
你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。
class Solution {
    //不能偷窃相邻的，选择之后会对下一次的选择产生影响
    //如果最后一次偷窃的是n
    //那么就变成了n-2个屋子进行偷窃了，如此不断缩小问题规模直到1个屋子
    //如何确保最优嘞，保证最小问题每次偷窃的都是局部最优解

    //按照动态规划的流程进行解题
    //
    //状态定义：设动态规划列表  ， 代表前 n+1 个房子在满足条件下的能偷窃到的最高金额
    //最终的转移方程：dp[n+1]=max[dp[n],dp[n-1]+num]
    //初始状态：dp[0]=0;
    //简化空间复杂度：我们发现  dp[n]只与dp[n-1]  和dp[n-2] 有关系，因此我们可以设两个变量
public:
    int rob(vector<int>& nums) {
        int n = nums.size();
        vector<int> memo(n,-1);// -1 表示没有计算过

        auto dfs = [&](this auto && dfs ,int i) -> int{
            if(i<0){
                return 0;
            }
            if (memo[i] != -1){
                return memo[i];
            }
            return memo[i]=max(dfs(i-1),dfs(i-2)+nums[i]);
        };

        return dfs(n-1);
    }
};
279 完全平方数
给你一个整数 n ，返回 和为 n 的完全平方数的最少数量 。

完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。
代码
// 写在外面，多个测试数据之间可以共享，减少计算量
//这些完全平方数视作物品体积，物品价值都是 1。由于每个数（物品）选的次数没有限制,所以是完全背包问题
int memo[101][10001];
auto init=[]{
    memset(memo,-1,sizeof(memo)); //-1
    return 0;
}();
int dfs(int i ,int j){
    if(i==0){
        return j == 0? 0: INT_MAX;
    }
    int &res = memo[i][j];
    if(res!=-1){
        return res;
    }
    if(j<i*i){
        res=dfs(i-1,j);
    }else{
        res=min(dfs(i-1,j),dfs(i,j-i*i)+1);
    }
    return res;
}
class Solution {
public:
    int numSquares(int n) {
        return dfs(sqrt(n),n);
    }
};
| 322. 零钱兑换 
给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。

计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。

你可以认为每种硬币的数量是无限的。
class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        int n = coins.size();
        vector memo(n, vector<int>(amount + 1, -1));

        auto dfs = [&](this auto&& dfs, int i, int c) -> int {
            if (i < 0) {
                return c == 0 ? 0 : INT_MAX / 2;
            }
            int &res = memo[i][c];
            if(res!=-1){
                return res;
            }
            if(c<coins[i]){
                return res = dfs(i-1,c);
            }
            return res= min(dfs(i-1,c),dfs(i,c-coins[i])+1);
        };
        int ans = dfs(n-1,amount);
        return ans < INT_MAX/2 ? ans : -1;
    }
};
139 单词拆分
给你一个字符串 s 和一个字符串列表 wordDict 作为字典。如果可以利用字典中出现的一个或多个单词拼接出 s 则返回 true。

注意：不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。
class Solution {
public:
    bool wordBreak(string s, vector<string>& wordDict) {
        int max_len = ranges::max(wordDict,{},&string::length).length();
        unordered_set<string> words(wordDict.begin(),wordDict.end());

        int n = s.length();
        vector<int> memo(n+1,-1);
        auto dfs = [&](this auto && dfs , int i) -> bool{
            if(i==0){
                return true;
            }
            int &res = memo[i];
            if(res != -1){
                return res;
            }
            for(int j = i-1;j >= max(i-max_len,0);j--){
                if(words.count(s.substr(j,i-j))&&dfs(j)){
                    return res = true;
                }
            }
            return res = false;
        };
        return dfs(n);
    }
};
300. 最长递增子序列
给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

子序列 是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。
代码实现
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
152 乘积最大子数组
给你一个整数数组 nums ，请你找出数组中乘积最大的非空连续 子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

测试用例的答案是一个 32-位 整数。

请注意，一个只包含一个元素的数组的乘积是这个元素的值。
//和前缀和有点关系好像
//核心是动态规划
//如果包含0直接归0
//记录两个值最大和最小然后同步更新反正最后要的是数值而不是子数组本身
func maxProduct(nums []int) int {
    n := len(nums)
    f_max,f_min := make([]int,n),make([]int,n)
    //记录下来每一个位置对应的值（最大值）
    f_max[0],f_min[0]=nums[0],nums[0]
    for i:=1;i<n;i++{ //从i =1 开始
        x := nums[i]
        f_max[i]=max(f_max[i-1]*x,f_min[i-1]*x,x)
        f_min[i]=min(f_max[i-1]*x,f_min[i-1]*x,x)
    }
    return slices.Max(f_max)
}
416. 分割等和子集
给你一个 只包含正整数 的 非空 数组 nums 。请你判断是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。
class Solution {
public:
    bool canPartition(vector<int>& nums) {
        int s = reduce(nums.begin(),nums.end());
        if (s % 2){
            return false;
        }

        //上述操作的意义，这里使用了 C++ 标准库中的reduce函数（C++17 引入），它会计算nums容器中所有元素的总和
        int n = nums.size();
        vector memo(n,vector<int>(s/2+1,-1));
        auto dfs = [&](this auto&& dfs,int i , int j) ->bool{
            if(i<0){
                return j==0;
            }
            int &res = memo[i][j];
            if( res != -1){
                return res;
            }
            return res = j >= nums[i]&&dfs(i-1,j-nums[i]) || dfs(i-1,j);
        };
        return dfs(n-1,s/2);
    }
};
32. 最长有效括号
给你一个只包含 '(' 和 ')' 的字符串，找出最长有效（格式正确且连续）括号 子串 的长度。

左右括号匹配，即每个左括号都有对应的右括号将其闭合的字符串是格式正确的，比如 "(()())"。
class Solution {
    //使用栈的做法
public:
    int longestValidParentheses(string s) {
        stack<int> st;
        int res = 0;
        for(int i =0,start = 0;i < s.size();i++){
            if(s[i]=='(') st.push(i);
            else{
                if(!st.empty()&&s[i]==')'){
                    st.pop();
                    if(st.empty()) res = max(res,i-start+1);
                    else res = max (res,i-st.top());
                }
                else start = i+1;
            }
        }
        return res;
    }
};

1143. 最长公共子序列
给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。

一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。
class Solution {
public:
    int longestCommonSubsequence(string text1, string text2) {
        int n = text1.length(),m=text2.length();
        vector memo (n,vector<int>(m,-1));
        auto dfs = [&](this auto&& dfs,int i ,int j){
            if (i < 0 || j < 0){
                return 0;
            }
            int& res = memo[i][j];
            if (res != -1){
                return res; // 之前计算过
            }
            if(text1[i]==text2[j]){
                return res = dfs(i-1,j-1)+1;
            }
            return res = max(dfs(i-1,j),dfs(i,j-1));
        };
        return dfs(n-1,m-1);
    }
};
72. 编辑距离
给你两个单词 word1 和 word2， 请返回将 word1 转换成 word2 所使用的最少操作数  。

你可以对一个单词进行如下三种操作：

插入一个字符
删除一个字符
替换一个字符
class Solution {
    //将 word1 转换成 word2
    //要操作的是word 1 对应有四种操作两个指针 i 和 j
public:
    int minDistance(string word1, string word2) {
        int n = word1.length() , m = word2.length();
        vector memo(n,vector<int>(m,-1));
        auto dfs =[&](this auto&& dfs,int i ,int j)->int{
            if(i<0){
                return j+1; //全部加上
            }
            if(j<0){
                return i+1; //全部删掉
            }
            int& res=memo[i][j];
            if (res!=-1){
                return res;
            }
            if (word1[i]==word2[j]){
                return res=dfs(i-1,j-1);
            }
            return res = min({dfs(i-1,j),dfs(i,j-1),dfs(i-1,j-1)}) + 1;
        };
    return dfs(n-1,m-1);
    }

};
| 300. LIS | 1143. LCS
- **思维引导**: 找最值，找方案。定义 $dp[i]$ 状态，推导转移方程。

#### 5. 最长回文子串 (Medium)
- **方案**: 中心扩展法或 DP。

#### 72. 编辑距离 (Hard)
- **思维**: $dp[i][j]$ 表示 $S1[0..i]$ 与 $S2[0..j]$ 的最小编辑步数。

---

### 十二、技巧 (Tricks)
- **136. 只出现一次的数字**: 异或消消乐。
给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。
class Solution {
    //线性的时间复杂度

    //使用一个数组？先遍历入,遇到相同的就出，最后剩下的就是唯一的一个

    //补充知识位运算（异或与）
public:
    int singleNumber(vector<int>& nums) {
        int x = 0;
        for(int num:nums){
            x^=num;
            //41343
            //4
            //有交换律和顺序无关
        }
        return x;
    }
};
- **169. 多数元素**: 摩尔投票（消消乐）。
给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 
//处理众数使用轮番比较的方法
func majorityElement(nums []int) int {
    hp := 0
    var ans int
    for _,x := range nums{
        if hp == 0 {
            ans ,hp = x, 1
        }else if x == ans {
            hp++
        }else{
            hp--
        }
    }
    return ans
}
- **75. 颜色分类**: 三指针。
给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums ，原地 对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

必须在不使用库内置的 sort 函数的情况下解决这个问题。
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int p0 =0 ,p1 = 0;
        for(int i=0;i<nums.size();i++){
            int x = nums[i];
            nums[i]=2;
            if(x<=1){
                nums[p1++]=1;
            }
            if(x==0){
                nums[p0++]=0;
            }
        }
    }
};
- **287. 寻找重复数**: 链表环检测。做法同 142. 环形链表 II
给定一个包含 n + 1 个整数的数组 nums ，其数字都在 [1, n] 范围内（包括 1 和 n），可知至少存在一个重复的整数。
假设 nums 只有 一个重复的整数 ，返回 这个重复的数 。
你设计的解决方案必须 不修改 数组 nums 且只用常量级 O(1) 的额外空间。
代码实现
// 代码逻辑同 142. 环形链表 II
func findDuplicate(nums []int) int {
    slow, fast := 0, 0 // 0 一定不在环上，适合作为起点
    for {
        slow = nums[slow]       // 等价于 slow = slow.next
        fast = nums[nums[fast]] // 等价于 fast = fast.next.next
        if fast == slow {       // 快慢指针移动到同一个节点
            break
        }
    }

    head := 0 // 再用一个指针，从起点出发
    for slow != head {
        slow = nums[slow]
        head = nums[head]
    }
    return slow // 入环口即重复元素
}
- **31. 下一个排列**: 找转折点 -> 找右侧较大者交换 -> 翻转后段。
题目内容：
整数数组的一个 排列  就是将其所有成员以序列或线性顺序排列。

例如，arr = [1,2,3] ，以下这些都可以视作 arr 的排列：[1,2,3]、[1,3,2]、[3,1,2]、[2,3,1] 。
整数数组的 下一个排列 是指其整数的下一个字典序更大的排列。更正式地，如果数组的所有排列根据其字典顺序从小到大排列在一个容器中，那么数组的 下一个排列 就是在这个有序容器中排在它后面的那个排列。如果不存在下一个更大的排列，那么这个数组必须重排为字典序最小的排列（即，其元素按升序排列）。
func nextPermutation(nums []int) {
    n := len(nums)

    // 第一步：从右向左找到第一个小于右侧相邻数字的数 nums[i]
    i := n - 2
    for i >= 0 && nums[i] >= nums[i+1] {
        i--
    }

    // 如果找到了，进入第二步；否则跳过第二步，反转整个数组
    if i >= 0 {
        // 第二步：从右向左找到 nums[i] 右边最小的大于 nums[i] 的数 nums[j]
        j := n - 1
        for nums[j] <= nums[i] {
            j--
        }
        // 交换 nums[i] 和 nums[j]
        nums[i], nums[j] = nums[j], nums[i]
    }

    // 第三步：反转 nums[i+1:]（如果上面跳过第二步，此时 i = -1）
    slices.Reverse(nums[i+1:])
}


---
##  复习必背清单
1. **去重**: 看到有序数组，优先想 `if i > 0 && nums[i] == nums[i-1] { continue }`。
2. **复制**: Go 的切片是引用，回溯结果存入全局前必 `make` + `copy`。
3. **分层**: BFS 必须在 `for len(q) > 0` 内先取 `size := len(q)`。

*预祝周一面通过！冲！*
