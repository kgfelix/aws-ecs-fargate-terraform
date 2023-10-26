[
  {
    "name": "${NAME}",
    "image": "${REPOSITORY_URI}",
    "essential": true,
        "portMappings": [
      {
        "containerPort": ${CONTAINER_PORT},
        "hostPort": ${CONTAINER_HOST}
      }
    ],
    "cpu": ${TASK_CPU},
    "memory": ${TASK_MEMORY}
  }
]
