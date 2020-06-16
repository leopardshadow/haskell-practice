# FLOFAC 2020

### reverse 的 Fibonacci

reverse 的 Fibonacci 那題應該有更好的解法，我是先造一個正常版的再 reverse 他

感覺應該會有用到 Lazy 特性的解法(?)


### sortTask

sortTask :: [(Task, Day)] -> [(Task, Day)]

我直接用了 Data.List 裡的 sort

一開始的題目似乎是回傳 [Task]，不過後來改傳 [(Task, Day)]，就不用額外處理轉過去
