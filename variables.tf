variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "protocol_type" {
  description = "The protocol type, e.g., HTTP, WEBSOCKET"
  type        = string
}

variable "api_description" {
  description = "Description of the API Gateway"
  type        = string
  default     = null
}

variable "integration_type" {
  description = "The type of API Gateway integration, e.g., HTTP_PROXY, AWS_PROXY"
  type        = string
}

variable "integration_uri" {
  description = "URI for integration"
  type        = string
}

variable "integration_method" {
  description = "The integration HTTP method"
  type        = string
}

variable "stage_name" {
  description = "The stage name"
  type        = string
}

variable "auto_deploy" {
  description = "Enable automatic deployment for the stage"
  type        = bool
  default     = false
}

variable "stage_description" {
  description = "Description for the stage"
  type        = string
  default     = null
}

variable "route_keys" {
  description = "List of route keys for the API Gateway"
  type        = list(string)
}

variable "authorizer_type" {
  description = "The type of authorizer"
  type        = string
  default     = null
}

variable "identity_sources" {
  description = "The identity sources for the authorizer"
  type        = list(string)
  default     = []
}

variable "deployment_description" {
  description = "Description of the deployment"
  type        = string
  default     = null
}

variable "domain_name" {
  description = "The domain name for API Gateway"
  type        = string
  default     = null
}
