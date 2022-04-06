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
#' @inheritDotParams azuremlsdk::get_workspace
#'
#' @export
get_workspace.az_resource_group <- function(x, name, ...) {
  azuremlsdk::get_workspace(name,
    subscription_id = x$subscription,
    resource_group = x$name, ...
  )
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

#' @export
list_workspaces.az_resource_group <- function(x, ...) {
  list_resources_by_type(x, "Microsoft.MachineLearningServices/workspaces")
}

#' List Resources by Type
#' @param x Resource group.
#' @param resource_type Type of resource to list.
#' @param ... Extra parameters passed to \code{list_resources} method of Azure
#'   resource group.
#' @export
list_resources_by_type <- function(x, resource_type, ...) {
  UseMethod("list_resources_by_type")
}

#' @export
list_resources_by_type.az_resource_group <- function(x, resource_type, ...) {
  x$list_resources(filter = sprintf("resourceType eq '%s'", resource_type), ...)
}
