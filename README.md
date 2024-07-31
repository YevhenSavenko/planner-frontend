# React Planner App

**Project Description:**
This React application is a front-end application designed to work seamlessly with your back-end API. It uses Docker for containerization to ensure a consistent development and production environment.

## Getting Started

Follow these steps to set up the project.

### Prerequisites

- Docker
- Docker Compose

### Setup

1. **Clone the repository:**

    ```bash
    git clone ...
    ```

2. **Copy configuration files:**

    ```bash
    cp docker-compose.yaml.dist docker-compose.yaml
    cp .env.example .env
    ```

3. **Configure environment variables:**

   Open the `.env` file and set the necessary environment variables if required. The `.env` file is used for any environment-specific configurations.

4. **Set permissions for directories:**

   Ensure the necessary permissions are set for directories to avoid any issues related to file access:

    ```bash
    chmod -R 755 
    ```

5. **Build and run the containers:**

    ```bash
    docker-compose up --build -d
    ```

6. **Access the application:**

   The React application will be available at [http://localhost:3000](http://localhost:3000). You can open this URL in your web browser to view the application.
