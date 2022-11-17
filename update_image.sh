COMPOSE_FILE=$ROBOPLAN_DIR/docker-compose.yml

docker pull pla10/ros2_humble:amd64
docker compose -f "$COMPOSE_FILE" build ros2