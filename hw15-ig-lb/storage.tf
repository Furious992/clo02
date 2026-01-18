resource "yandex_storage_bucket" "bucket" {
  bucket     = "furious992-${formatdate("YYYYMMDD", timestamp())}-clo02"
  access_key = yandex_iam_service_account_static_access_key.sa_s3_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_s3_key.secret_key

  # Публичное чтение объектов :contentReference[oaicite:5]{index=5}
  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }
}

resource "yandex_storage_object" "picture" {
  bucket = yandex_storage_bucket.bucket.bucket
  key    = "pic.png"
  source = "${path.module}/files/pic.png"

  access_key = yandex_iam_service_account_static_access_key.sa_s3_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_s3_key.secret_key
}
