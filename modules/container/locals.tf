locals {
  #path of template file
  task_definition = templatefile("modules/container/assets/task_definition.json.tpl", {
    REPOSITORY_URI = var.image_app_uri,
      TASK_ROLE = var.ecs_task_role,
      EXECUTION_ROLE = var.ecs_task_execution_role,
      TASK_CPU = var.task_cpu,
      TASK_MEMORY = var.task_memory,
      NAME = "${var.app_name}-${terraform.workspace}"
      CONTAINER_PORT = var.container_port,
      CONTAINER_HOST = var.container_host
  })
}