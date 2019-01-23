FROM node:8.6.0-alpine
COPY server.js /file/server.js
COPY package.json /file/package.json
RUN apk add --no-cache openssl bash
RUN cd /file && bash -c "openssl req -x509 -out localhost.crt -keyout localhost.key \
 -newkey rsa:2048 -nodes -sha256 \
 -subj '/CN=localhost' -extensions EXT \
 -config <( printf '[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth')"
RUN cd /file && npm install
ENTRYPOINT ["node","/file/server.js","3000","/tmp"]