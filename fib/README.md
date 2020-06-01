

之前看到一種寫費氏數列的寫法

```haskell
fib :: [Integer]
fib = 1 : 1 : [ x + y 
    | x <- fib
    | y <- tail fib ]
```





## Reference:


[](https://ocharles.org.uk/guest-posts/2014-12-07-list-comprehensions.html)