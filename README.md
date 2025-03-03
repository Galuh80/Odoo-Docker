Odoo 16.0 Docker Configuration
----

This repository contains Docker configuration files for running Odoo 16.0 with PostgreSQL in a containerized environment.

Features
-------------------------
- Containerized Odoo 16.0 application
- PostgreSQL 13 database server
- Persistent data storage with Docker volumes
- Custom configuration via odoo.conf

Prerequisites
-------------------------
- Docker
- Docker Compose

Getting Started
-------------------------
1. Clone this repository
```bash
git clone https://github.com/Galuh80/Odoo-Docker.git
```
2. Navigate to the project directory
3. Run Docker Compose:
```bash
docker-compose up -d
```
This will:
- Build the Odoo container with all required dependencies
- Start a PostgreSQL database container
- Configure networking between the containers
- Mount volumes for persistent data storage

Configuration
-------------------------
The main configuration files:
- **Dockerfile**: Defines the Odoo container environment, including system dependencies and Python requirements.
- **docker-compose.yml**: Sets up the multi-container application with networking and volumes.
- **odoo.conf**: Contains Odoo-specific configuration parameters.

Environment Variables
-------------------------
The following environment variables are preconfigured:
- **DB_HOST**: Database host (set to 'db')
- **DB_PORT**: Database port (set to 5432)
- **DB_USER**: Database user (set to 'odoo')
- **DB_PASSWORD**: Database password (set to 'odoo')

Volumes
-------------------------
Two persistent volumes are created:
- odoo-db-data: Stores PostgreSQL database files
- odoo-data: Stores Odoo data files

Ports
-------------------------
The application exposes Odoo on port 8069.

Customization
-------------------------
To customize the setup:
- Modify odoo.conf to change Odoo settings
- Edit docker-compose.yml to add services or change configuration
- Update the Dockerfile if additional dependencies are required

Security Notes
-------------------------
- This configuration includes basic security settings
- For production environments, consider changing default passwords and implementing additional security measures

Troubleshooting
-------------------------
If you encounter issues:
- Check Docker logs: **docker-compose logs**
- Verify file permissions in the container
- Ensure all paths in configuration files are correct
