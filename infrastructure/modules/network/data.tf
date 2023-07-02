data "external" "my_ip" {
  program = ["bash", "${path.module}/get_my_ip.sh"]
}
