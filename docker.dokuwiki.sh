docker run --name dokuwiki -p 8081:8080 -p 443:8443 \
   --volume ${PWD}:/bitnami/dokuwiki \
    bitnami/dokuwiki:latest
