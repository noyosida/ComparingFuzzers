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
target_branch <- branch[branch$program=="cxxfilt" | branch$program=="nm" | branch$program=="objdump" | branch$program=="readelf" , ]
valid <- target_branch[target_branch$seed=="valid",]
invalid <- target_branch[target_branch$seed=="invalid",]
data <- cbind(valid$branches, invalid$branches)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)
