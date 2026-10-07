FROM nginx:1.29-alpine

# Config du serveur : la même que celle montée aujourd'hui par docker-compose.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Le site = tous les fichiers du dépôt, sauf ce que .dockerignore exclut.
COPY . /usr/share/nginx/html

# Fichiers du dépôt qui n'ont rien à faire dans le dossier public.
RUN cd /usr/share/nginx/html && rm -f nginx.conf docker-compose.yml Dockerfile .dockerignore .gitignore

EXPOSE 80
