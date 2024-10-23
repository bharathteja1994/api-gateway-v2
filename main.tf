resource "aws_apigatewayv2_api" "this" {
  name          = var.api_name
  protocol_type = var.protocol_type
  description   = var.api_description
}

resource "aws_apigatewayv2_stage" "this" {
  api_id = aws_apigatewayv2_api.this.id
  name   = var.stage_name

  auto_deploy = var.auto_deploy
  description = var.stage_description
}

resource "aws_apigatewayv2_integration" "this" {
  api_id           = aws_apigatewayv2_api.this.id
  integration_type = var.integration_type
  integration_uri  = var.integration_uri
  integration_method = var.integration_method
}

resource "aws_apigatewayv2_route" "this" {
  count    = length(var.route_keys)
  api_id   = aws_apigatewayv2_api.this.id
  route_key = var.route_keys[count.index]
  target   = "integrations/${aws_apigatewayv2_integration.this.id}"
}

resource "aws_apigatewayv2_authorizer" "this" {
  api_id           = aws_apigatewayv2_api.this.id
  authorizer_type  = var.authorizer_type
  identity_sources = var.identity_sources
}

resource "aws_apigatewayv2_deployment" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  description = var.deployment_description
}

resource "aws_apigatewayv2_domain_name" "this" {
  domain_name = var.domain_name
}

resource "aws_apigatewayv2_api_mapping" "this" {
  api_id      = aws_apigatewayv2_api.this.id
  domain_name = aws_apigatewayv2_domain_name.this.domain_name
  stage       = aws_apigatewayv2_stage.this.id
}
