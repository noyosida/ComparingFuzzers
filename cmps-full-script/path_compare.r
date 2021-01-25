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

path <- read.csv("normalized_path_for_cmps-full.csv", header = TRUE)
a1 <- path[path$fuzzer=="afl-1.94b",]
a2 <- path[path$fuzzer=="afl-2.40b",]
a3 <- path[path$fuzzer=="afl-2.49b",]
a4 <- path[path$fuzzer=="afl-2.51b",]
a5 <- path[path$fuzzer=="afl-2.52b",]
ff <- path[path$fuzzer=="afl-rb",]
af <- path[path$fuzzer=="aflfast",]
ag <- path[path$fuzzer=="aflgo",]
h1 <- cbind(a1$paths_1h, a2$paths_1h)
h1 <- cbind(h1, a3$paths_1h)
h1 <- cbind(h1, a4$paths_1h)
h1 <- cbind(h1, a5$paths_1h)
h1 <- cbind(h1, af$paths_1h)
h1 <- cbind(h1, ag$paths_1h)
h1 <- cbind(h1, ff$paths_1h)
h1_group <- rep(1:8, c(35, 35, 35, 35, 35, 35, 35, 35))
Steel.Dwass(as.vector(h1), h1_group)
h2 <- cbind(a1$paths_2h, a2$paths_2h)
h2 <- cbind(h2, a3$paths_2h)
h2 <- cbind(h2, a4$paths_2h)
h2 <- cbind(h2, a5$paths_2h)
h2 <- cbind(h2, af$paths_2h)
h2 <- cbind(h2, ag$paths_2h)
h2 <- cbind(h2, ff$paths_2h)
h2_group <- rep(1:8, c(35, 35, 35, 35, 35, 35, 35, 35))
Steel.Dwass(as.vector(h2), h2_group)
h3 <- cbind(a1$paths_3h, a2$paths_3h)
h3 <- cbind(h3, a3$paths_3h)
h3 <- cbind(h3, a4$paths_3h)
h3 <- cbind(h3, a5$paths_3h)
h3 <- cbind(h3, af$paths_3h)
h3 <- cbind(h3, ag$paths_3h)
h3 <- cbind(h3, ff$paths_3h)
h3_group <- rep(1:8, c(35, 35, 35, 35, 35, 35, 35, 35))
Steel.Dwass(as.vector(h3), h3_group)
h4 <- cbind(a1$paths_4h, a2$paths_4h)
h4 <- cbind(h4, a3$paths_4h)
h4 <- cbind(h4, a4$paths_4h)
h4 <- cbind(h4, a5$paths_4h)
h4 <- cbind(h4, af$paths_4h)
h4 <- cbind(h4, ag$paths_4h)
h4 <- cbind(h4, ff$paths_4h)
h4_group <- rep(1:8, c(35, 35, 35, 35, 35, 35, 35, 35))
Steel.Dwass(as.vector(h4), h4_group)
h5 <- cbind(a1$paths_5h, a2$paths_5h)
h5 <- cbind(h5, a3$paths_5h)
h5 <- cbind(h5, a4$paths_5h)
h5 <- cbind(h5, a5$paths_5h)
h5 <- cbind(h5, af$paths_5h)
h5 <- cbind(h5, ag$paths_5h)
h5 <- cbind(h5, ff$paths_5h)
h5_group <- rep(1:8, c(35, 35, 35, 35, 35, 35, 35, 35))
Steel.Dwass(as.vector(h5), h5_group)
h6 <- cbind(a1$paths_6h, a2$paths_6h)
h6 <- cbind(h6, a3$paths_6h)
h6 <- cbind(h6, a4$paths_6h)
h6 <- cbind(h6, a5$paths_6h)
h6 <- cbind(h6, af$paths_6h)
h6 <- cbind(h6, ag$paths_6h)
h6 <- cbind(h6, ff$paths_6h)
h6_group <- rep(1:8, c(35, 35, 35, 35, 35, 35, 35, 35))
Steel.Dwass(as.vector(h6), h6_group)