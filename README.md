##Example spring-boot application secured by Azure AD
This project is an example application for the article published on:
 https://blog.iterative.engineering/

### Requirements
- docker version 20.10.9 or later
- docker-compose version 1.28.5 or later
- Java 8 or later


### Local deployment
Set `azure.activedirectory.tenant-id`, `client-id` and `client-secret`
properties in src/main/resources/application.properties

Execute script:
```shell script
./build_and_run.sh
```

Access: `http://localhost:8080/api/login`


### Server deployment

- Modify `nginx/conf.d/initial.conf` and `default.conf`.
Replace `lhvm2.centralus.cloudapp.azure.com` with your domain name.
It can`t be just and IP address, since Let's Encrypt does not support
 certs for IP addresses.
 
Execute script:
```shell script
./build_and_run.sh
```

Execute script: (Replace the argument with a valid path to the application on your server)
```shell script
certbot/generate-cert.sh /home/username/spring-boot-secured-app
```

Modify `docker-compose.yml` file, nginx service, volumes section.
To point to mount default.conf instead of initial.conf.
Other volumes stays the same.
```
    volumes:
      - ./nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf
      - ./nginx/certs:/etc/nginx/ssl
      - ./certbot/data:/usr/share/nginx/html/letcsencrypt
```

Execute
```shell script
docker-compose up -d 
```

If everything is set-up correctly, you can now access your domain:
`http://yourdomainname.com/api/login`
The access is now secured by Azure AD.