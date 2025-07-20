# Use mysql image from Docker Hub
FROM mysql:latest

# Pass init.sql file to the container
COPY init.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306

# Start MySQL server
CMD ["mysqld"]