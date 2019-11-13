#'@title Run the Simstrat model
#'
#'@description
#'This runs the Simstrat model on the specific simulation stored in \code{sim_folder}.
#'The specified \code{sim_folder} must contain a valid .par file.
#'
#'@param sim_folder the directory where simulation files are contained
#'@param par_file the parameter file that needs to be run
#'@param verbose Save output as character vector. Defaults to FALSE
#'@keywords methods
#'@author
#'Jorrit Mesman, Tadhg Moore
#'@examples
#'sim_folder <- system.file('extdata', package = 'SimstratR')
#'run_simstrat(sim_folder, par_file = 'langtjern.par')
#'@export
#'@importFrom utils packageName
run_simstrat <- function (sim_folder = ".", par_file="simstrat.par", verbose = FALSE)
{
  
  if (.Platform$pkgType == "win.binary") {
    return(run_simstratWin(sim_folder, par_file))
  }

  # ### macOS ###
  # if (grepl('mac.binary',.Platform$pkgType)) {
  #   maj_v_number <- as.numeric(strsplit(
  #     Sys.info()["release"][[1]],'.', fixed = TRUE)[[1]][1])
  # 
  #   if (maj_v_number < 13.0) {
  #     stop('pre-mavericks mac OSX is not supported. Consider upgrading')
  #   }
  # 
  #   return(run_gotmOSx(sim_folder, verbose, system.args))
  # 
  # }
  # 
  # if (.Platform$pkgType == "source") {
  #   return(run_gotmNIX(sim_folder, verbose, args))
  # }
}

run_simstratWin <- function(sim_folder,par_file="simstrat.par"){
  
  if(.Platform$r_arch == 'x64'){
    simstrat_path <- system.file('extbin/simstrat.exe', package = 'SimstratR') #packageName()
  }else{
    stop('No Simstrat executable available for your machine yet...')
  }
  
  origin <- getwd()
  setwd(sim_folder)

  tryCatch({
    if (verbose){
      out <- system2(simstrat_path, wait = TRUE, stdout = TRUE,
                     stderr = "", args=par_file)
    } else {
      out <- system2(simstrat_path, args=par_file)
    }
    setwd(origin)
    return(out)
  }, error = function(err) {
    print(paste("Simstrat_ERROR:  ",err))
    setwd(origin)
  })
}
# 
# # run_gotmOSx <- function(sim_folder, yaml = TRUE, yaml_file = 'gotm.yaml', verbose = TRUE, args){
# #   #lib_path <- system.file('extbin/macGOTM/bin', package=packageName()) #Not sure if libraries needed for GOTM
# #
# #   gotm_path <- system.file('exec/macgotm', package=packageName())
# #
# #   # ship gotm and libs to sim_folder
# #   #Sys.setenv(DYLD_FALLBACK_LIBRARY_PATH=lib_path) #Libraries?
# #
# #   if(yaml){
# #     args <- c(args, yaml_file)
# #   }else{
# #     args <- c(args,'--read_nml')
# #   }
# #
# #   origin <- getwd()
# #   setwd(sim_folder)
# #
# #   tryCatch({
# #     if (verbose){
# #       out <- system2(gotm_path, wait = TRUE, stdout = "",
# #                      stderr = "", args = args)
# #
# #     } else {
# #       out <- system2(gotm_path, wait = TRUE, stdout = NULL,
# #                      stderr = NULL, args=args)
# #     }
# #
# #     setwd(origin)
# # 	return(out)
# #   }, error = function(err) {
# #     print(paste("GOTM_ERROR:  ",err))
# #
# #     setwd(origin)
# #   })
# # }
# 
# run_gotmNIX <- function(sim_folder, yaml = TRUE, yaml_file = 'gotm.yaml', verbose=TRUE, args){
#   gotm_path <- system.file('exec/nixgotm', package=packageName())
#   
#   if(yaml){
#     args <- c(args, yaml_file)
#   }else{
#     args <- c(args,'--read_nml')
#   }
#   
#   origin <- getwd()
#   setwd(sim_folder)
#   Sys.setenv(LD_LIBRARY_PATH=system.file('extbin/nixgotm',
#                                          package=packageName()))
#   
#   tryCatch({
#     if (verbose){
#       out <- system2(gotm_path, wait = TRUE, stdout = "",
#                      stderr = "", args=args)
#     } else {
#       out <- system2(gotm_path, wait = TRUE, stdout = NULL,
#                      stderr = NULL, args = args)
#     }
#     setwd(origin)
#     return(out)
#   }, error = function(err) {
#     print(paste("GOTM_ERROR:  ",err))
#     setwd(origin)
#   })
# }
# 
# ### From GLEON/gotm3r
# gotm.systemcall <- function(sim_folder, gotm_path, verbose, system.args) {
#   origin <- getwd()
#   setwd(sim_folder)
#   
#   tryCatch({
#     if (verbose){
#       out <- system2(gotm_path, wait = TRUE, stdout = "",
#                      stderr = "", args = system.args)
#     } else {
#       out <- system2(gotm_path, wait = TRUE, stdout = NULL,
#                      stderr = NULL, args = system.args)
#     }
#     setwd(origin)
#     return(out)
#   }, error = function(err) {
#     print(paste("gotm_ERROR:  ",err))
#     setwd(origin)
#   })
# }
# 
# ### macOS ###
# run_gotmOSx <- function(sim_folder, verbose, system.args){
#   gotm_path <- system.file('exec/macgotm', package = 'GOTMr')
#   gotm.systemcall(sim_folder = sim_folder, gotm_path = gotm_path, verbose = verbose, system.args = system.args)
# }
