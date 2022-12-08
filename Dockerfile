FROM node:14-alpine 
WORKDIR /app
COPY . ./
ENV CI=true 
ENV PORT=8080 
RUN npm install
RUN npm run lint
RUN npm install --save-dev --save-exact prettier 
RUN npm run prettier
RUN npm run test
RUN npm run build
CMD ["npm", "start"]