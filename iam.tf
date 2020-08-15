# Sample IAM permission
module "project_iam_binding" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam/"
  projects = [google_project.data-lake.project_id]
  mode     = "additive"
  bindings = {
    # Bigquery 
    "roles/bigquery.admin" = ["user:${local.unique_id}-de@gmail.com"]
    # GCS
    "roles/storage.admin" = ["user:${local.unique_id}-de@gmail.com"]
    # Compute
    "roles/compute.admin" = ["user:${local.unique_id}-de@gmail.com"]
  }
}