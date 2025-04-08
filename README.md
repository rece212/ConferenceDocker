# Conference API Setup with Docker
This README outlines the steps to set up the Conference application using Docker, including database configuration, API development, and container management.

## Prerequisites
- **Docker**: [Install Docker](https://www.docker.com/) if you haven't already.  
- **Visual Studio**: Install Visual Studio for API development.  
- **Docker Compose**: Ensure Docker Compose is installed and functional.  
- **Basic Knowledge**: Familiarity with .NET Core, EF Core migrations, and containerization concepts is beneficial.

## Getting Started
### 1. Pull the SQL Server Image  
Download the official SQL Server Docker image:  
```bash
docker pull mcr.microsoft.com/mssql/server
```
### 2. Run the SQL Server Container
Start the SQL Server container with the required environment variables:
```bash
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password1" -p 1400:1433 -d mcr.microsoft.com/mssql/server
```
### 3. Set Up the API Project
1. Create a blank ASP.NET Core Web API project in **Visual Studio**.
2. Do **not** add any controllers for now—focus on database tables and models.

### 4. Add Tables and Models
Define your database tables and corresponding models (e.g., `Attendee`, `Session`, `Registration`) in the API project.

### 5. Run EF Core Migration
Use EF Core to apply database migrations:
```bash
Add-Migration InitialMigration
Update-Database
```
This will create the database schema based on the models you've defined

### 6. Build a New Docker Image for the Database
Prepare and build a custom Docker image for the database:
1. Create a `Dockerfile` for the database setup.
2. Build the image:
```bash
docker build -t conference-database .
```
### 7. Run the Database Container
Run the custom-built database container:
```bash
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password1" -p 1433:1433 --name conference-db conference-database
```

##Docker commands :
```bash
docker-compose down -v
docker-compose up --build
docker-compose up -d
docker network ls
docker network prune
``
# Docker Commands Cheat Sheet

## 1. `docker-compose down -v`
Stops and removes all containers, networks, and volumes defined in the `docker-compose.yml` file.

### 🔹 Usage:
```bash
docker-compose down -v
```
- `-v`: Removes **named** and **anonymous volumes** associated with the services.

---

## 2. `docker-compose up --build`
Starts the containers and forces a rebuild of the images.

### 🔹 Usage:
```bash
docker-compose up --build
```
- `--build`: Rebuilds images before starting the containers.

📌 **Use this when:** You modify the `Dockerfile` or dependencies like `requirements.txt` or `package.json`.

---

## 3. `docker-compose up -d`
Starts the containers **in detached mode** (running in the background).

### 🔹 Usage:
```bash
docker-compose up -d
```
- `-d`: Runs containers in detached mode.

📌 **Use this when:** You want the terminal to remain free while the containers run in the background.

---

## 4. `docker network ls`
Lists all Docker networks.

### 🔹 Usage:
```bash
docker network ls
```
**Output Example:**
```
NETWORK ID     NAME        DRIVER    SCOPE
abc123xyz456   bridge      bridge    local
def456uvw789   host        host      local
ghi789rst012   my_network  bridge    local
```

📌 **Use this when:** You need to check existing Docker networks.

---

## 5. `docker network prune`
Removes **all unused** Docker networks.

### 🔹 Usage:
```bash
docker network prune
```
📌 **Warning:** This only removes networks **not currently used by any container**.

---

## Summary Table

| Command | Description |
|---------|------------|
| `docker-compose down -v` | Stops containers and removes associated volumes. |
| `docker-compose up --build` | Rebuilds and starts containers. |
| `docker-compose up -d` | Starts containers in detached mode. |
| `docker network ls` | Lists all Docker networks. |
| `docker network prune` | Removes unused networks. |

---

🚀 **Happy Dockerizing!** 🐳

