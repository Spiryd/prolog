docker stop prolog
docker rm prolog
docker build . -t prolog --network host
docker run --name prolog -d -i -t prolog /bin/sh
docker exec -it prolog bash
