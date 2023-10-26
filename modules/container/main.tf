resource "aws_ecs_cluster" "cluster" {
  name =  "${var.app_name}-${terraform.workspace}"
}

resource "aws_ecs_task_definition" "task_definition" {
  family                = "${var.app_name}-task-${terraform.workspace}"
  container_definitions = local.task_definition
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  cpu = var.task_cpu
  memory = var.task_memory
  task_role_arn = var.ecs_task_role
  execution_role_arn = var.ecs_task_execution_role
}

resource "aws_ecs_service" "service" {
 name                               = "${var.app_name}-service-${terraform.workspace}"
 cluster                            = aws_ecs_cluster.cluster.id
 task_definition                    = aws_ecs_task_definition.task_definition.arn
 desired_count                      = 1
 deployment_minimum_healthy_percent = 50
 deployment_maximum_percent         = 200
 launch_type                        = "FARGATE"
 scheduling_strategy                = "REPLICA"
 
 network_configuration {
   security_groups  = [var.security_group_id]
   subnets          = [var.subnet_id]
   assign_public_ip = true
 }
 
 #lifecycle {
 #  ignore_changes = [task_definition, desired_count]
 #}
}
