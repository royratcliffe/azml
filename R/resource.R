#' List Resources by Type
#' @param x Resource group.
#' @param resource_type Type of resource to list.
#' @param ... Extra parameters passed to \code{list_resources} method of Azure
#'   resource group.
#' @export
list_resources_by_type <- function(x, resource_type, ...) {
  UseMethod("list_resources_by_type")
}
