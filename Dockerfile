FROM node:19.2-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g sequelize-cli
RUN npx sequelize db:migrate
EXPOSE 5000
CMD ["npm","start"]
