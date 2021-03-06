FROM node:lts-slim
WORKDIR /user/src/app
COPY package.json ./
RUN yarn
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
