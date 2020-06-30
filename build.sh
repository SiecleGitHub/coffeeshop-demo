#!/bin/sh
# Build 3 images (in parallel)

docker build -f barista-kafka/Dockerfile -t ianpartridge/coffeeshop-demo:barista-kafka . > build1.log 2>&1 &
BUILD1=$!
docker build -f barista-http/Dockerfile -t ianpartridge/coffeeshop-demo:barista-http . > build2.log 2>&1 &
BUILD2=$!
docker build -f coffeeshop-service/Dockerfile -t ianpartridge/coffeeshop-demo:coffeeshop-service .

wait $BUILD1 && cat build1.log && rm build1.log
wait $BUILD2 && cat build2.log && rm build2.log
