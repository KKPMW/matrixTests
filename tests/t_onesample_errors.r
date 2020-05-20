library(matrixTests)
source("utils/capture.r")

#--- x argument errors ---------------------------------------------------------

# cannot be missing
err <- 'argument "x" is missing, with no default'
res <- capture(row_t_onesample())
stopifnot(all.equal(res$error, err))

# cannot be NULL
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(NULL))
stopifnot(all.equal(res$error, err))

# cannot be character
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(c("1", "2")))
stopifnot(all.equal(res$error, err))

# cannot be logical
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(c(TRUE, FALSE)))
stopifnot(all.equal(res$error, err))

# cannot be complex
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(complex(c(1,2), c(3,4))))
stopifnot(all.equal(res$error, err))

# cannot be data.frame containing some non numeric data
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(iris))
stopifnot(all.equal(res$error, err))

# cannot be a list
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(as.list(c(1:5))))
stopifnot(all.equal(res$error, err))

# cannot be in a list
err <- '"x" must be a numeric matrix or vector'
res <- capture(row_t_onesample(list(1:5)))
stopifnot(all.equal(res$error, err))


#--- alternative argument errors -----------------------------------------------

err <- '"alternative" must be a character vector with length 1 or nrow(x)'

# cannot be NA
res <- capture(row_t_onesample(x=1:3, alternative=NA))
stopifnot(all.equal(res$error, err))

# cannot be numeric
res <- capture(row_t_onesample(x=1:3, alternative=1))
stopifnot(all.equal(res$error, err))

# cannot be complex
res <- capture(row_t_onesample(x=1:3, alternative=complex(1)))
stopifnot(all.equal(res$error, err))

# cannot be in a list
res <- capture(row_t_onesample(x=1:3, alternative=list("less")))
stopifnot(all.equal(res$error, err))

# cannot be a data frame
res <- capture(row_t_onesample(x=1:3, alternative=data.frame("less")))
stopifnot(all.equal(res$error, err))


err <- 'all "alternative" values must be in: two.sided, less, greater'

# must be in correct set
res <- capture(row_t_onesample(x=1:3, alternative="ga"))
stopifnot(all.equal(res$error, err))

# error produced even when some are correct
res <- capture(row_t_onesample(x=matrix(rnorm(10), nrow=2), alternative=c("g","c")))
stopifnot(all.equal(res$error, err))


#--- mu argument errors --------------------------------------------------------

err <- '"mu" must be a numeric vector with length 1 or nrow(x)'

# cannot be a character
res <- capture(row_t_onesample(x=1:3, mu="1"))
stopifnot(all.equal(res$error, err))

# cannot be complex
res <- capture(row_t_onesample(x=1:3, mu=complex(1)))
stopifnot(all.equal(res$error, err))

# cannot be in a list
res <- capture(row_t_onesample(x=1:3, mu=list(1)))
stopifnot(all.equal(res$error, err))

# cannot be a data frame
res <- capture(row_t_onesample(x=1:3, mu=data.frame(1)))
stopifnot(all.equal(res$error, err))


err <- 'all "mu" values must be between: -Inf and Inf'

# cannot be NA
res <- capture(row_t_onesample(x=1:3, mu=NA_integer_))
stopifnot(all.equal(res$error, err))

# cannot be NaN
res <- capture(row_t_onesample(x=1:3, mu=NaN))
stopifnot(all.equal(res$error, err))


#--- conf.level argument errors ------------------------------------------------

err <- '"conf.level" must be a numeric vector with length 1 or nrow(x)'

# cannot be character
res <- capture(row_t_onesample(x=1:3, conf.level="0.95"))
stopifnot(all.equal(res$error, err))

# cannot be complex
res <- capture(row_t_onesample(x=1:3, conf.level=complex(0.95)))
stopifnot(all.equal(res$error, err))

# cannot be in a list
res <- capture(row_t_onesample(x=1:3, conf.level=list(0.95)))
stopifnot(all.equal(res$error, err))

# cannot be a data frame
res <- capture(row_t_onesample(x=1:3, conf.level=data.frame(0.95)))
stopifnot(all.equal(res$error, err))


err <- 'all "conf.level" values must be between: 0 and 1'

# cannot be NA
res <- capture(row_t_onesample(x=1:3, conf.level=NA_integer_))
stopifnot(all.equal(res$error, err))

# cannot be NaN
res <- capture(row_t_onesample(x=1:3, conf.level=NaN))
stopifnot(all.equal(res$error, err))

# cannot be below 0
res <- capture(row_t_onesample(x=1:3, conf.level=-0.0001))
stopifnot(all.equal(res$error, err))

# cannot be above 1
res <- capture(row_t_onesample(x=1:3, conf.level=1.0001))
stopifnot(all.equal(res$error, err))


#--- dimension mismatch errors -------------------------------------------------

# mu must match x number of rows
err <- '"mu" must be a numeric vector with length 1 or nrow(x)'
x <- matrix(rnorm(12), nrow=4)
res <- capture(row_t_onesample(x, mu=c(1,2)))
stopifnot(all.equal(res$error, err))

# alternative must match x number of rows
err <- '"alternative" must be a character vector with length 1 or nrow(x)'
x <- matrix(rnorm(12), nrow=4)
res <- capture(row_t_onesample(x, alternative=c("g","l")))
stopifnot(all.equal(res$error, err))

# conf.level must match x number of rows
err <- '"conf.level" must be a numeric vector with length 1 or nrow(x)'
x <- matrix(rnorm(12), nrow=4)
res <- capture(row_t_onesample(x, conf.level=c(0.95, 0.99)))
stopifnot(all.equal(res$error, err))
