output "api_id" {
  description = "The ID of the API Gateway"
  value       = aws_apigatewayv2_api.this.id
}

output "api_endpoint" {
  description = "The endpoint URL of the API Gateway"
  value       = aws_apigatewayv2_api.this.api_endpoint
}

output "deployment_id" {
  description = "The ID of the deployment"
  value       = aws_apigatewayv2_deployment.this.id
}

output "stage_id" {
  description = "The ID of the stage"
  value       = aws_apigatewayv2_stage.this.id
}

output "domain_name" {
  description = "The domain name of the API Gateway"
  value       = aws_apigatewayv2_domain_name.this.domain_name
}
