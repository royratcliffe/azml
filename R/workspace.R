#' Get Workspace
#'
#' @param x Something to get a workspace from, typically a resource group.
#' @param ... Extra parameters to pass.
#'
#' @export
get_workspace <- function(x, ...) {
  UseMethod("get_workspace")
}

#' List Machine-Learning Workspaces
#'
#' @param x Something to get a workspace from, typically a resource group.
#' @param ... Extra parameters to pass.
#'
#' @export
list_workspaces <- function(x, ...) {
  UseMethod("list_workspaces")
}
