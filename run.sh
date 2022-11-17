if [ -z $ROBOPLAN_VOLUME ]; then
    echo "ERROR: ROBOPLAN_VOLUME environment variable not set"
    exit 1
fi

if [ -z $ROBOPLAN_DIR ]; then
    echo "ERROR: ROBOPLAN_DIR environment variable not set"
    exit 1
fi

FORCE_RECREATE=false
if [ "$1" = "-f" ]; then
    FORCE_RECREATE=true
fi

COMPOSE_FILE=$ROBOPLAN_DIR/docker-compose.yml

xhost +

if [ $FORCE_RECREATE = true ]; then
    docker compose -f "$COMPOSE_FILE" up --force-recreate -d --wait
else
    docker compose -f "$COMPOSE_FILE" up -d --wait
fi

docker compose -f "$COMPOSE_FILE" exec -it ros2 /bin/bash