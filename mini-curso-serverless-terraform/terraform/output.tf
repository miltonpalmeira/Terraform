output "api_url" {
  value = "${aws_api_gateway_stage.test.invoke_url}/ok"
  
}