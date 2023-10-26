
module "ecs_cluster" {
  source                  = "./modules/container"
  app_name                = var.app_name
  vpc_id                  = var.vpc_id
  subnet_id               = var.subnet_id
  image_app_uri           = var.image_app_uri
  ecs_task_role           = var.ecs_task_role
  ecs_task_execution_role = var.ecs_task_execution_role
  security_group_id       = var.security_group_id
  container_port = var.container_port
  container_host = var.container_host
  task_cpu = var.task_cpu
  task_memory = var.task_memory
}
