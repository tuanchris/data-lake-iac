# Project definition
resource "google_project" "data-lake" {
  name       = "Data Lake"
  project_id = "${local.unique_id}-data-lake" 
  billing_account = local.billing_id
}

resource "google_project" "data-warehouse" {
  name       = "Data Warehouse"
  project_id = "${local.unique_id}-data-warehouse" 
  billing_account = local.billing_id
}

resource "google_project" "data-marts" {
  name       = "Data Marts"
  project_id = "${local.unique_id}-data-marts" 
  billing_account = local.billing_id
}

# Enable APIs in projects
resource "google_project_service" "data-lake-service" {
  for_each = toset([
    "compute.googleapis.com",
    "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.data-lake.project_id
  disable_on_destroy = false
}

resource "google_project_service" "data-warehouse-service" {
  for_each = toset([
    "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.data-warehouse.project_id
  disable_on_destroy = false
}

resource "google_project_service" "data-marts-service" {
  for_each = toset([
   "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.data-marts.project_id
  disable_on_destroy = false
}

