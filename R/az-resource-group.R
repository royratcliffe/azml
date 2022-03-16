#' Get Workspace
#'
#' @param x Something to get a workspace from, typically a resource group.
#' @param ... Extra parameters to pass.
#'
#' @export
get_workspace <- function(x, ...) {
  UseMethod("get_workspace")
}

#' Get Workspace from Resource Group
#'
#' Uses a resource group's subscription identifier and resource group name to
#' access an Azure Machine-Learning workspace by workspace name.
#'
#' @param x Resource group.
#' @param name Name of workspace to access.
#' @param ... Ignored parameters.
#'
#' @export
get_workspace.az_resource_group <- function(x, name, ...) {
  azuremlsdk::get_workspace(name,
    subscription_id = x$subscription,
    resource_group = x$name
  )
}

#' List Machine Learning Workspaces
#'
#' @param x Something to get a workspace from, typically a resource group.
#' @param ... Extra parameters to pass.
#'
#' @export
list_workspaces <- function(x, ...) {
  UseMethod("list_workspaces")
}

#' List Machine Learning Workspaces
#' @param x Resource group.
#' @param ... Ignored parameters.
#' @export
list_workspaces.az_resource_group <- function(x, ...) {
  x$list_resources(
    filter = "resourceType eq 'Microsoft.MachineLearningServices/workspaces'"
  )
}
