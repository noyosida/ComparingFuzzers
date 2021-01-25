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
target_path <- path[path$program=="cxxfilt" | path$program=="nm" | path$program=="objdump" | path$program=="readelf", ]
valid <- target_path[target_path$seed=="valid",]
invalid <- target_path[target_path$seed=="invalid",]
data <- cbind(valid$paths_1h, invalid$paths_1h)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)
data <- cbind(valid$paths_2h, invalid$paths_2h)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)

data <- cbind(valid$paths_3h, invalid$paths_3h)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)

data <- cbind(valid$paths_4h, invalid$paths_4h)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)

data <- cbind(valid$paths_5h, invalid$paths_5h)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)

data <- cbind(valid$paths_6h, invalid$paths_6h)
data_group <- rep(1:2, c(96, 96))
Steel.Dwass(as.vector(data), data_group)

