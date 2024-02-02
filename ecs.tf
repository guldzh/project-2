# Define ECS Cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster"
}

# Define ECS Task Definition
resource "aws_ecs_task_definition" "my_task" {
  execution_role_arn       = aws_iam_role.ecs_service_role.arn
  family                   = "my-task"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]

  network_mode = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = "my-container"
      image     = "islamovna/my-nginx-image:latest" # Replace with your Docker image
      cpu       = 256
      memory    = 512
      essential = true
      
      "portMappings" : [
        {
          "containerPort" : 80
          "hostPort" : 80
        }
      ],
      "command" : ["nginx", "-g", "daemon off;"]
    }
  ])
}

# Define ECS Service
resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

    load_balancer {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    container_name   = "my-container"
    container_port   = 80
  }

  network_configuration {
    subnets         = [aws_subnet.public_subnet[0].id] # Specify your public subnets
    security_groups = [aws_security_group.ecs_sg.id]   # Specify the security group you created
  }
}
