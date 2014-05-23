
## Hamming distance
x1 = c("a","b","c","d")
x2 = c("a","b","e","f")

sum(x1!=x2)

x1 = mushroom[1,]
x2 = mushroom[2,]
sum(x1!=x2)

X = mushroom
n <- nrow(X)
m <- matrix(nrow=n, ncol=n)
for(i in seq_len(n - 1))
    for(j in seq(i, n))
        m[j, i] <- m[i, j] <- sum(X[i,] != X[j,])

