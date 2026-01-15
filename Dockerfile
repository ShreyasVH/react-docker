# -------- Build Stage --------
FROM node:25.2.1-alpine AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# ----------------------------------------------------------------
FROM node:25.2.1-alpine
WORKDIR /app
RUN npm install -g http-server
COPY --from=build /app/build ./build
ENTRYPOINT ["http-server", "build"]
