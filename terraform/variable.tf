variable "main_path" {
    description = "main html path"
    default     = "../public/main.html"
}

variable "main" {
    description = "main html file"
    default     = "main.html"
}

variable "second_path" {
    description = "second html path"
    default     = "../public/second.html"
}

variable "second" {
    description = "second html path"
    default     = "second.html"
}

variable "style_path" {
    description = "style folder path"
    default     = "../public/static/style.css"
}

variable "style" {
    description = "style.css file"
    default     = "/static/style.css"
}

variable "s3_origin_id" {
    description = "s3 origin id"
    default     = "mattiaS3Origin"
}

variable "origin_access_identity" {
    description = "origin user access"
    default     = "mattia-origin-access-identity"
}
