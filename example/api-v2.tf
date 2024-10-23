module "api_gateway_v2" {
  source           = "./api-gateway-v2-module"
  api_name         = "my-api"
  protocol_type    = "HTTP"
  api_description  = "My API Gateway with dynamic routing"
  stage_name       = "prod"
  auto_deploy      = true
  stage_description = "Production stage"

  integration_type  = "HTTP_PROXY"
  integration_uri   = "https://example.com/endpoint"
  integration_method = "POST"

  route_keys = ["GET /", "POST /submit", "GET /status"]

  authorizer_type   = "JWT"
  identity_sources  = ["$request.header.Authorization"]

  deployment_description = "Initial deployment"
  domain_name            = "api.example.com"
}

output "api_id" {
  value = module.api_gateway_v2.api_id
}

output "api_endpoint" {
  value = module.api_gateway_v2.api_endpoint
}
