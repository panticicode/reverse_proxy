# Reverse Proxy Setup

This project provides a local reverse proxy setup with SSL certificates for multiple domains.

## Requirements
- Linux or macOS
- [mkcert](https://github.com/FiloSottile/mkcert) installed
- `sudo` privileges to edit `/etc/hosts`
- Docker and Docker Compose installed for all projects

---

## Step 1: Configure IsleBlue for Reverse Proxy

For local development behind the reverse proxy:

- Remove the `ports` section from their `docker-compose.yml` files. The containers should only expose their internal ports.
- Configure Nginx inside IsleBlue to listen **only on port 80**, without redirecting to HTTPS.

### Example `default.conf` for IsleBlue or Cockpit:

```nginx
server {
    listen 80;
    server_name localhost;
    root /var/www/html/public;
    index index.php index.html;
    client_max_body_size 10M;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
```

## Step 2: Update `/etc/hosts`
Add the following lines to your `/etc/hosts` file:

```bash
127.0.0.1 suite.local
127.0.0.1 phpmyadmin.suite.local
127.0.0.1 cockpitts.local
127.0.0.1 phpmyadmin.cockpitts.local
```


---

## Step 3: Create a Certificates Folder
Navigate to your project root folder and create a `certs` directory:

```bash
cd /path/to/rootfolder/
mkdir -p certs
```

## Step 4: Install Certificates (First Time Only)

### If you haven’t installed the local CA yet, run:

```bash
mkcert -install
```

## Step 5: Generate SSL Certificates

### Use mkcert to generate local SSL certificates for all domains:

```bash
mkcert isleblue.local stmartinblue.local stbartsblue.local barbadosblue.local api.isleblue.local manage.isleblue.local phpmyadmin.isleblue.local 
```

This will generate .pem and .key files inside the project’s certs directory.

## Step 6: Start the Containers

### Important: Each project has its own folder and docker-compose.yml.  
You must start them in the following order:

1. **IsleBlue** containers  
```bash
cd /path/to/suite
docker-compose up -d
   ```

2. **Cockpit** containers  
```bash
cd /path/to/cockpit
docker-compose up -d
```

3. **Reverse Proxy** container(s)
```bash
cd /path/to/cockpit
docker-compose up -d
```

## Optional: Quickly Start or Stop All Containers

1️⃣ Build Containers & Create Shared Network for IsleBlue Apps Communication (First Time Only)

```bash
bash build.sh
```

```bash
bash network.sh
```

2️⃣ Start All Containers

⚠️ Start in order: IsleBlue → IsleBLueManage → IsleBlueApi → Reverse Proxy

```bash
bash start.sh
```

3️⃣ Stop All Containers

⚠️ Stop in reverse order: Reverse Proxy → IsleBlue → IsleBlueManage → IsleBlueApi

```bash
bash stop.sh
```

4️⃣ Access Services

✅ After starting, you can access the services via:

[IsleBlue](https://isleblue.local)

[ManageIsleBlue](https://manage.isleblue.local)

[ApiIsleBlue](https://api.isleblue.local)

[IsleBlue phpMyAdmin](https://phpmyadmin.isleblue.local)
