docker run --rm -d --name "ihaskell" -p 8888:8888 -v "${pwd}:/home/jovyan/src" gibiansky/ihaskell
docker logs "ihaskell"
