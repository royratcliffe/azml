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

#' @export
list_workspaces.az_resource_group <- function(x, ...) {
  list_resources_by_type(x, "Microsoft.MachineLearningServices/workspaces")
}

#' @export
list_resources_by_type.az_resource_group <- function(x, resource_type, ...) {
  x$list_resources(filter = sprintf("resourceType eq '%s'", resource_type), ...)
}
