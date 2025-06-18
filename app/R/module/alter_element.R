

alter_element <- function(x){

  # -- check
  stopifnot(is.reactive(x))

  # -- get reactive value & update
  data <- x()
  idx <- floor(runif(n = 1, min = 1, max = 4))
  data[data$id == idx, ]$value <- data[data$id == idx, ]$value + 1

  # -- store the new value inside the reactive!
  x(data)

  # -- return NULL
  invisible()

}
