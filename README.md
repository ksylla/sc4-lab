# sc4-lab -- Under Construction --

I am stepwise constructing the pilot sc4 pipeline.
It is to be published at bde2020 if ready and no longer experimental.

## Precondition

additionally clone pilot-sc4-kafka-producer here.
The directory pilot-sc4-kafka-producer .gitignore-d.

 ```bash
git clone https://github.com/big-data-europe/pilot-sc4-kafka-producer.git
```

## experiment with the pipeline

### build the components
 ```bash
docker-compose build
```
### run the pipeline
foreground
 ```bash
docker-compose up
```
background
 ```bash
docker-compose up -d
```
### stop the pipeline

foreground
    stop: ctrl-C 
    kill: ctrl-C ctrl-C

background
 ```bash
docker-compose down
```
### cleanup

 ```bash
docker-compose rm
docker rmi $(docker images -f "dangling=true" -q)
```
