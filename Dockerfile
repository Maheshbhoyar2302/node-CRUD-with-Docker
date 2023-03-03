FROM node:latest
WORKDIR /app
COPY package.json .
# RUN npm install --only=production

# we have to pass this arg in docker-compose file
ARG NODE_ENV
# dont forget to add one extra space before and after in if block 
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

COPY . ./
ENV PORT 3000
EXPOSE $PORT
CMD ["node", "index.js"]


