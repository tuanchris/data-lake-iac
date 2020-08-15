# GCS resources
resource "google_storage_bucket" "gcs-data-lake-landing" {
  name          = "${google_project.data-lake.project_id}-landing"
  project	    = google_project.data-lake.project_id
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "gcs-data-lake-sensitive" {
  name          = "${google_project.data-lake.project_id}-sensitive"
  project	    = google_project.data-lake.project_id
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "gcs-data-lake-work" {
  name          = "${google_project.data-lake.project_id}-work"
  project	    = google_project.data-lake.project_id
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "gcs-data-lake-backup" {
  name          = "${google_project.data-lake.project_id}-backup"
  project	    = google_project.data-lake.project_id
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
}

# ACL configs
# resource "google_storage_bucket_acl" "gcs-data-lake-landing-acl" {
#   bucket = google_storage_bucket.gcs-data-lake-landing.name
#   role_entity = [
#     # Leave the user prefix. Chane to other when necessary
#     "OWNER:user-${local.unique_id}-de@gmail.com",
#     "READER:${local.unique_id}-ds@gmail.com",
#   ]
# }

# resource "google_storage_bucket_acl" "gcs-data-lake-sensitive-acl" {
#   bucket = google_storage_bucket.gcs-data-lake-sensitive.name
#   role_entity = [
#     "OWNER:user-${local.unique_id}-de@gmail.com",
#     "READER:${local.unique_id}-ds@gmail.com",
#   ]
# }

# resource "google_storage_bucket_acl" "gcs-data-lake-work-acl" {
#   bucket = google_storage_bucket.gcs-data-lake-work.name
#   role_entity = [
#     "OWNER:user-${local.unique_id}-de@gmail.com",
#     "WRITER:${local.unique_id}-ds@gmail.com",
#   ]
# }

# resource "google_storage_bucket_acl" "gcs-data-lake-backup-acl" {
#   bucket = google_storage_bucket.gcs-data-lake-backup.name
#   role_entity = [
#     "OWNER:user-${local.unique_id}-de@gmail.com",
#     "READER:${local.unique_id}-ds@gmail.com",
#   ]
# }