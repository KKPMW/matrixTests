
assert_numeric_mat_or_vec <- function(x) {
  name <- as.character(substitute(x))
  if(is.null(x) || !is.numeric(x) | !(is.matrix(x) | is.vector(x)))
    stop(paste0("'", name, "'", " must be a numeric matrix or a vector"))
}

assert_character_vec_length <- function(x, ...) {
  name   <- as.character(substitute(x))
  lens   <- unlist(list(...))
  lnames <- as.character(substitute(list(...)))[-1]
  lnames <- paste(lnames, collapse=" or ")
  if(!(length(x) %in% lens) | !is.character(x))
    stop(paste0("'", name, "'", " must be a character vector with length ", lnames))
}

assert_numeric_vec_length <- function(x, ...) {
  name   <- as.character(substitute(x))
  lens   <- unlist(list(...))
  lnames <- as.character(substitute(list(...)))[-1]
  lnames <- paste(lnames, collapse=" or ")
  if(!(length(x) %in% lens) | !is.numeric(x))
    stop(paste0("'", name, "'", " must be a numeric vector with length ", lnames))
}

assert_all_in_set <- function(x, vals) {
  name <- as.character(substitute(x))
  vnames <- paste(vals, collapse=", ")
  if(!all(x %in% vals))
    stop(paste0("all '", name, "' values must be in: ", vnames))
}

assert_all_in_range <- function(x, min, max) {
  name <- as.character(substitute(x))
  if(any(!is.finite(x) | x<min | x>max))
    stop(paste0("all '", name, "' values must be between: ", min, " and ", max))
}

assert_equal_nrow <- function(x, y) {
  namex <- as.character(substitute(x))
  namey <- as.character(substitute(y))
  if(nrow(x) != nrow(y))
    stop(paste0("'", namex, "' and '", namey, "' must have the same number of rows"))
}

assert_equal_ncol <- function(x, y) {
  namex <- as.character(substitute(x))
  namey <- as.character(substitute(y))
  if(ncol(x) != ncol(y))
    stop(paste0("'", namex, "' and '", namey, "' must have the same number of columns"))
}
