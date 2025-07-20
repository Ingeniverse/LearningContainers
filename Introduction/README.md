# Docker Introduction

Welcome to the Docker Introduction project!  
This project is designed to help you understand the basics of Docker and how to use it to run applications in containers.

## What is Docker?

Docker is a platform that allows you to package applications and their dependencies into containers. Containers are lightweight, portable, and ensure that your application runs the same way regardless of where it is deployed.

**Key Concepts:**
- **Image:** A snapshot of your application and its environment. Images are used to create containers.
- **Container:** A running instance of an image. Containers are isolated from each other and the host system.
- **Dockerfile:** A script with instructions to build a Docker image.
- **Docker Hub:** A public registry where you can find and share Docker images.

## About This Project

In this project, you will:
- Use a Dockerfile to create a MySQL database container.
- Learn how to set environment variables for container configuration.
- Expose ports to allow connections to your containerized database.
- Automatically initialize your database schema and tables with example data using an SQL script.

### Project Structure

- **Dockerfile:** Defines the steps to build a MySQL container.
- **.env:** Stores environment variables for configuration (such as MySQL root password, user, and password).
- **init.sql:** SQL script that creates the database, tables (`users` and `address`), and inserts 30 example records for each.

### How It Works

The provided Dockerfile uses the official MySQL image from Docker Hub and sets up a database with user credentials using environment variables from the `.env` file.  
When you build and run the container, MySQL will be available on port `3306`.

The `init.sql` file is automatically executed by the MySQL container on first startup. This script creates the schema, tables, and populates them with sample data.

### Getting Started

1. **Build the Docker image:**
   ```sh
   docker build -t mysql-db .
   ```

2. **Configure environment variables:**  
   Edit the `.env` file to set your MySQL root password, user, and password:
   ```
   MYSQL_ROOT_PASSWORD=your_root_password
   MYSQL_USER=your_user
   MYSQL_PASSWORD=your_password
   ```

3. **Run the container:**  
   The `init.sql` file will be copied into the image and executed automatically.
   ```sh
   docker run --env-file .env -p 3306:3306 mysql-db
   ```

4. **Connect to MySQL:**  
   Use any MySQL client to connect to `localhost:3306` with the credentials you set in your `.env` file.

### Example Database Structure

- **Database:** `user_database`
- **Tables:**
  - `users` (id, name, email)
  - `address` (id, user_id, street, city, country)
- **Sample Data:**  
  30 users and 30 addresses are inserted automatically by `init.sql`.

---

Explore the Dockerfile, `.env`, and `init.sql` files. Try modifying the environment variables, SQL schema, or adding new instructions to deepen your understanding!