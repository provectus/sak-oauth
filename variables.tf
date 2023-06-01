variable "client_id" {
  type        = string
  default     = ""
  description = "A client id for oauth"
}

variable "client_secret" {
  type        = string
  default     = ""
  description = "A client secrets for oauth"
}

variable "cookie_secret" {
  type        = string
  default     = ""
  description = "A random_string make gen command python -c 'import os,base64; print base64.b64encode(os.urandom(16))'"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "A name of the existing namespace"
}

variable "domains" {
  type        = list(string)
  default     = []
  description = "A list of domains to use for ingresses"
}

variable "argocd" {
  type        = map(string)
  description = "A set of values for enabling deployment through ArgoCD"
  default     = {}
}

variable "conf" {
  type        = map(string)
  description = "A custom configuration for deployment"
  default     = {}
}

variable "chart_version" {
  type        = string
  description = "A Helm Chart version"
  default     = "3.1.0"
}

variable "ingress_annotations" {
  type        = map(string)
  description = "A set of annotations for ArgoCD Ingress"
  default     = {}
}
