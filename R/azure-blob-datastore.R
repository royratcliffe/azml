#' @export
register_datastore.azureml.data.azure_storage_datastore.AzureBlobDatastore <- function(x, name, ...) {
  azuremlsdk::register_azure_blob_container_datastore(
    workspace = x$workspace,
    datastore_name = name,
    container_name = x$container_name,
    account_name = x$account_name,
    account_key = x$account_key,
    subscription_id = x$subscription_id,
    resource_group = x$resource_group,
    ...
  )
}
