FROM python:3.8-slim-buster
# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*
# Create odoo user
RUN useradd -m -d /opt/odoo -U -r -s /bin/bash odoo
# Set working directory
WORKDIR /opt/odoo
# Copy the entire project directory - fix path here
COPY --chown=odoo:odoo . .
# Ensure the config file is in the right place
RUN mkdir -p /etc/odoo
COPY --chown=odoo:odoo conf/odoo.conf /etc/odoo/odoo.conf
RUN mkdir -p /var/lib/odoo
RUN chown -R odoo:odoo /var/lib/odoo
RUN if [ -f /etc/odoo/odoo.conf ]; then echo "Config file exists"; else echo "Config file does not exist"; fi
RUN if [ -r /etc/odoo/odoo.conf ]; then echo "Config file is readable"; else echo "Config file is not readable"; fi
# Install Python dependencies
RUN pip install -r requirements.txt
# Set the correct permissions
RUN chown -R odoo:odoo /opt/odoo /etc/odoo
RUN chmod +x /opt/odoo/odoo-server
# Switch to odoo user
USER odoo
# Expose Odoo port
EXPOSE 8069
# Set default command
CMD ["python3", "/opt/odoo/odoo-server", "-c", "/etc/odoo/odoo.conf"]