Z <- matrix(c(rep(1,4), c(8,10,12,14)), ncol = 2)
G <- matrix(c(7.8233, -0.4850, -0.4850, 0.05127), ncol = 2)
R <- diag(1.7162, 4)

V <- Z %*% G %*% t(Z) + R 

der <- matrix(c(rep(V[1,1],4),rep(V[2,2],4),rep(V[3,3],4),rep(V[4,4],4)), ncol = 4)

Y <- matrix(c(21.0, 20.0, 21.5, 23.0), ncol = 1)
X <- cbind(rep(1,4), rep(0,4), seq(8,14,2))
betahat <- matrix(c(15.3857, 2.3210, 0.6602), ncol = 1)
G %*% t(Z) %*% solve(V) %*% (Y-X %*% betahat)


n <- 4
C <- diag(n) - matrix(1/n, n, n)