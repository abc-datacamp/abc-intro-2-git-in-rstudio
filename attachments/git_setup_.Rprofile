.First <- function() {
  system("git config --global user.name 'Ima Boss'")
  system("git config --global user.email imaboss@r.com")
  if(length(Sys.glob("*.Rmd")) > 0 ){
	  library(utils)
	  library(base)
	  library(rmarkdown)
	  rmd <- Sys.glob("*.Rmd")
	  html <- paste(sub('\\.Rmd$', '', rmd), "html", sep=".")
	  rmarkdown::render(rmd)
	  myViewer <- getOption("viewer")
	  file.copy(html, file.path(tempdir(), html), overwrite=T)
	  myViewer(file.path(tempdir(), html))
	  cat("\014")
  }
}
