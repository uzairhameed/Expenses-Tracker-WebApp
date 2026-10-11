![Language](https://img.shields.io/badge/language-Java-blue.svg)
![Framework](https://img.shields.io/badge/framework-Spring%20Boot-green.svg)
![Docker](https://img.shields.io/badge/containerized-Docker-blue.svg)
![Docker Compose](https://img.shields.io/badge/orchestration-Docker%20Compose-2496ED.svg)
![Web Server](https://img.shields.io/badge/web%20server-Nginx-009639.svg)
![Database](https://img.shields.io/badge/database-MySQL-orange.svg)

# Expenses Tracker Web Application

## Overview

The Expenses Tracker Web Application is a financial management solution built with Java and Spring Boot. It allows users to securely manage their expenses through an intuitive web interface.

The application uses Spring Security for authentication and authorization, Spring Data JPA for database operations, and MySQL for data persistence. Thymeleaf and Bootstrap provide the user interface.

The application has also been containerized using Docker and Docker Compose, with Nginx configured as a web server and reverse proxy. It can be deployed on an AWS EC2 Ubuntu instance.

## Technologies Used

- **Backend:** Java, Spring Boot, Spring MVC
- **Security:** Spring Security
- **Database:** MySQL
- **ORM:** Spring Data JPA
- **Frontend:** Thymeleaf, Bootstrap
- **Containerization:** Docker
- **Container Management:** Docker Compose
- **Web Server / Reverse Proxy:** Nginx
- **Cloud Deployment:** AWS EC2
- **Operating System:** Ubuntu Linux

## Features

- **User Authentication and Authorization:** Secure registration, login, and access control.
- **Expense Management:** Create, read, update, and delete expenses.
- **Expense Filtering:** Filter and organize expenses based on supported criteria.
- **Persistent Database Storage:** MySQL data is stored in a persistent directory or Docker volume.
- **Containerized Deployment:** Package and run the application and database using Docker.
- **Multi-Container Setup:** Manage application services using Docker Compose.
- **Nginx Reverse Proxy:** Route incoming HTTP requests to the application through Nginx.

## Project Structure

```text
Expenses-Tracker-WebApp/
├── src/                    # Application source code
├── screenshots/             # Application screenshots
├── nginx/                   # Nginx configuration
├── Dockerfile               # Application image definition
├── docker-compose.yml       # Multi-container configuration
├── pom.xml                  # Maven dependencies and build
├── .gitignore               # Ignored files and directories
└── README.md                # Project documentation
```

*The structure above is representative; your actual source files and configuration may differ.*

## Getting Started

### Prerequisites

Install the following tools if you want to build and run the project locally:

- Java Development Kit (JDK) compatible with the project
- Maven
- Docker
- Docker Compose

For cloud deployment, you also need an AWS EC2 instance running Ubuntu and an appropriate security group configuration.

### 1. Clone the Repository

```bash
git clone https://github.com/uzairhameed/Expenses-Tracker-WebApp.git
cd Expenses-Tracker-WebApp
```

### 2. Configure Environment Variables

Review `docker-compose.yml` and your Spring Boot configuration. Set the database connection details and credentials required by the application.

Avoid committing database passwords, secret keys, or other sensitive information to GitHub.

### 3. Build and Run with Docker Compose

From the project root, run:

```bash
docker compose up -d --build
```

Check the running containers:

```bash
docker compose ps
```

View service logs:

```bash
docker compose logs -f
```

To view logs for a particular service:

```bash
docker compose logs -f nginx
```

Use the actual service name defined in your Compose file if it differs from `nginx`.

### 4. Access the Application

Open the EC2 instance's public IPv4 address in your browser:

```text
http://YOUR-EC2-PUBLIC-IP
```

Ensure that the EC2 security group allows inbound HTTP traffic on port 80. The Docker Compose port mappings and Nginx configuration must also match.

### 5. Stop the Application

To stop the services:

```bash
docker compose down
```

This stops and removes the Compose containers and network. Persistent database data is normally retained when stored in a named volume or a host-mounted directory.

**Warning:** Avoid using `docker compose down -v` unless you intend to remove associated named volumes and their data.

## Nginx Configuration

Nginx acts as the entry point for HTTP traffic and can forward requests to the Spring Boot application running in another container.

The Nginx configuration is maintained in the `nginx/` directory. The upstream address should use the appropriate Docker Compose service name and internal application port.

Only one service can bind to a particular host IP and port at a time. If the Ubuntu host's Nginx service and the Nginx container both attempt to use port 80, a port conflict will occur. When using the containerized Nginx setup, stop the host service if it is not needed:

```bash
sudo systemctl stop nginx
```

## Database Persistence

MySQL data must be stored in a Docker named volume or a persistent host-mounted directory to survive container replacement.

The `java-app-data/` directory in this project is intended for runtime database data if configured as a host bind mount. It should not be committed to GitHub.

Add the following entry to `.gitignore`:

```gitignore
java-app-data/
```

Keep database credentials outside version control.

## Screenshots

The screenshots below demonstrate the application's user interface and functionality.

![Application Screenshot 1](screenshots/1.png)

![Application Screenshot 2](screenshots/2-2.png)

![Application Screenshot 3](screenshots/3-3.png)

![Application Screenshot 4](screenshots/4-4.png)

![Application Screenshot 5](screenshots/5-5.png)

![Application Screenshot 6](screenshots/6-6.png)

![Application Screenshot 7](screenshots/7.png)

![Application Screenshot 8](screenshots/8.png)

## Future Improvements

- Automate application builds and deployments with a CI/CD pipeline.
- Add HTTPS using a TLS certificate.
- Improve application monitoring and centralized logging.
- Move sensitive configuration into a secure secrets-management solution.


## Contributions
Contributions are welcome! If you find a bug or have suggestions for improvement, feel free to open an issue or create a pull request.

## License
This project is licensed under the MIT License.
