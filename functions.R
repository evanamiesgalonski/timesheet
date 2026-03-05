cc_var <- function(x){
  chk_data(x)
  x <- names(x)
  y <- gsub("_|\\.", "", x)
  
  for(i in seq_along(x)) {
    if(str_detect(y[i], "[[:punct:]]") |
       str_detect(x[i], "^\\d|\\s|^_") |
       str_detect(x[i], "^\\.\\d")) {
      
      x[i] <- paste0("`", x[i], "`")
    }
  }
  
  cat(x, sep = ", ")
  
}
