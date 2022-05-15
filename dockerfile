
FROM node:18-alpine3.14 as builder-modules
WORKDIR /build
COPY package.json /build
COPY package-lock.json /build
RUN npm install

FROM node:18-alpine3.14
WORKDIR /build
COPY --from=builder-modules /build /build
COPY . .
EXPOSE 3000
CMD ["npm", "start"]