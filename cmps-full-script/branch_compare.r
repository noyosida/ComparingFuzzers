#Steel.Dwass関数は，以下のページに公開されているものを利用しました．
#http://aoki2.si.gunma-u.ac.jp/R/Steel-Dwass.html
Steel.Dwass <- function(data,group)
{
  OK <- complete.cases(data, group)
  data <- data[OK]
  group <- group[OK]
  n.i <- table(group)
  ng <- length(n.i)
  t <- combn(ng, 2, function(ij) {
    i <- ij[1]
    j <- ij[2]
    r <- rank(c(data[group == i], data[group == j]))
    R <- sum(r[1:n.i[i]])
    N <- n.i[i]+n.i[j]
    E <- n.i[i]*(N+1)/2
    V <- n.i[i]*n.i[j]/(N*(N-1))*(sum(r^2)-N*(N+1)^2/4)
    return(abs(R-E)/sqrt(V))
  })
  p <- ptukey(t*sqrt(2), ng, Inf, lower.tail=FALSE)
  result <- cbind(t, p)
  rownames(result) <- combn(ng, 2, paste, collapse=":")
  return(result)
}

branch <- read.csv("coverage_for_cmps-full.csv", header = TRUE)
a1 <- branch[branch$fuzzer=="afl-1.94b",]
a2 <- branch[branch$fuzzer=="afl-2.40b",]
a3 <- branch[branch$fuzzer=="afl-2.49b",]
a4 <- branch[branch$fuzzer=="afl-2.51b",]
a5 <- branch[branch$fuzzer=="afl-2.52b",]
ff <- branch[branch$fuzzer=="afl-rb",]
af <- branch[branch$fuzzer=="aflfast",]
ag <- branch[branch$fuzzer=="aflgo",]
branch_6h <- cbind(a1$branches, a2$branches)
branch_6h <- cbind(branch_6h, a3$branches)
branch_6h <- cbind(branch_6h, a4$branches)
branch_6h <- cbind(branch_6h, a5$branches)
branch_6h <- cbind(branch_6h, af$branches)
branch_6h <- cbind(branch_6h, ag$branches)
branch_6h <- cbind(branch_6h, ff$branches)
branch_6h_group <- rep(1:8, c(34, 34, 34, 34, 34, 34, 34, 34))
Steel.Dwass(as.vector(branch_6h), branch_6h_group)
