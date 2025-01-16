# Food-Delivery:
Java Dynamic Web Project with Docker.

This repository contains a step-by-step guide to set up and run a Java Dynamic Web Project using Docker.
Prerequisites


## Prerequisites:
Docker and Docker Compose installed on your system.

```bash
  https://www.docker.com/products/docker-desktop/
```

## Run the Docker Desktop

## Directory:
Export the Repo Directory


```bash
  project
│
├── Docker-compose.yml
├── Dockerfile
├── HTML/
│   └── Register.html
├── CSS/
│   └── Register.css
├── IMAGES/
│   └── Register.jpg
├── JS/
│   └── Register.js
├── JAVA/
│   └── Register.java
└── WEB-INF/
    ├── lib/
    │   └── mysql-connector.jar
    └── web.xml
```


## Step1 : Build the Docker Containers
Run the following command in Project Directory Terminal to build the Docker containers:
```bash
 docker-compose build
```
## Step2 :Start the Docker Containers
Start the containers using:
```bash
 docker-compose up
```
This will start the necessary services, such as your Java application and MySQL database.
## Step 3: Access the Web Application
Open your browser and navigate to:
```bash
 http://localhost:8080/HTML/HOME2.html
```


## Demo Video
[Click here to watch the demo video](https://vikyathb49.github.io/Food-Delivery/Demo.mp4)





## Accessing the MySQL Database
You can interact with the MySQL database either from inside the container or through an external GUI client.
### Option 1: Access from Inside the Container
Get the MySQL container's name or ID:
```bash
 docker ps
```
### Option 2: Access the MySQL CLI inside the container:
```bash
 docker exec -it mysql-container mysql -u user -p
```
## Interact with the database:
```bash
show databases;
use food_delivery;
show tables;
```
### To rebuild and restart the containers, use:
```bash
docker-compose up --build
```
### To remove unused Docker objects and free up disk space, run:
```bash
docker system prune -f
```
## Note:
Ensure that the mysql-connector.jar file is placed in the WEB-INF/lib directory.
Configure the web.xml file to map the servlets and define database connections.
Update the Dockerfile and docker-compose.yml files as needed for your project requirements.
Explore Our Food Delivery Project
## Explore Our Food Delivery Project
Introducing our feature-packed Food Delivery Project that makes ordering your favorite meals easier than ever. Enjoy seamless navigation, secure payment options, and fast delivery services. As a special welcome offer, use the coupon code WELCOME49 during checkout and save 49 Rs ✌️. Experience the convenience of delicious meals delivered right to your doorstep!








