#' Register Data Store
#'
#' Finds or creates a new store.
#'
#' Passes the subscription and resource group in order to allow for
#' \code{grant_workspace_access} as \code{TRUE}. Attempting to grant workspace
#' access otherwise raises a Python exception response.
#'
#' @param x Existing Azure blob or file store.
#' @param name Name of new store.
#' @param ... Extra parameters for registration.
#' @export
#' @examples
#' \dontrun{
#' # Register a new store using the workspace default store.
#' azml::register_datastore(workspace$get_default_datastore(), "xyz")
#' }
register_datastore <- function(x, ...) {
  UseMethod("register_datastore")
}
