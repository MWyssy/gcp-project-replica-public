resource "google_sql_database_instance" "gcp_pr_database" {
  name             = var.database_name
  database_version = var.postgres_version
  settings {
    tier = "db-custom-2-13312"
  }
  deletion_protection = true
}

resource "google_sql_ssl_cert" "gcp_pr_database" {
  common_name = "gcp-pr-cert"
  instance    = google_sql_database_instance.gcp_pr_database.name

  depends_on = [google_sql_database_instance.gcp_pr_database]
}

resource "google_sql_user" "gcp_pr_database" {
  name     = var.db_user_name
  instance = google_sql_database_instance.gcp_pr_database.name
  password = var.db_password

  depends_on = [google_sql_ssl_cert.gcp_pr_database]
}

resource "google_database_migration_service_connection_profile" "gcp_pr_database" {
  location              = var.project_region
  connection_profile_id = var.profile_id
  display_name          = var.display_name
  labels = {
    created_by = "terraform"
    project    = "gcp_project_replica"
  }

  postgresql {
    host     = google_sql_database_instance.gcp_pr_database.ip_address.0.ip_address
    port     = 5433
    username = google_sql_user.gcp_pr_database.name
    password = google_sql_user.gcp_pr_database.password
    ssl {
      client_key         = google_sql_ssl_cert.gcp_pr_database.private_key
      client_certificate = google_sql_ssl_cert.gcp_pr_database.cert
      ca_certificate     = google_sql_ssl_cert.gcp_pr_database.server_ca_cert
    }
    cloud_sql_id = var.database_name
  }

  depends_on = [google_sql_user.gcp_pr_database]
}
