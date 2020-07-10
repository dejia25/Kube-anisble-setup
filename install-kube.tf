
resource "null_resource" "ansible-docker" {

  depends_on = [aws_instance.k8s-master, aws_instance.k8s-node, null_resource.ansible-provision]

  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key '${aws_key_pair.my-aws-key.key_name}' -i ansible/inventories/test ansible/task/main.yml"
  }

provisioner "local-exec" {
    command = "sleep 20; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key '${aws_key_pair.my-aws-key.key_name}' -i ansible/inventories/test ansible/task/master.yml"
}

provisioner "local-exec" {
    command = "sleep 20; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key '${aws_key_pair.my-aws-key.key_name}' -i ansible/inventories/test ansible/task/worker.yml"
}

}
