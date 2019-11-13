#'@title Return the path to a template of current files for running Simstrat
#'
#'@description
#'This returns a path to a directory with example PAR files for running Simstrat and DAT files which contain the model forcing data.
#'
#'@keywords methods
#'
#'@author
#'Tadhg Moore
#'@examples
#'\dontrun{
#' simstrat_template_files()
#'}
#'
#'@export
simstrat_template_files <- function(){
  return(system.file('extdata/', package=packageName()))
}
