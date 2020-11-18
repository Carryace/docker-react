# Build Phase to install all deps and app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]


# Run Phase to run app build within folder /app/build
FROM  nginx
COPY --from=builder /app/build /usr/share/nginx/html
# /usr/share/nginx/html is the default directory that nginx will serve without config
