# -------- Build Stage --------
FROM node:26.13.0-alpine AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# ----------------------------------------------------------------
FROM node:26.13.0-alpine
WORKDIR /app
RUN npm install -g http-server
COPY --from=build /app/build ./build
ENTRYPOINT ["http-server", "build"]
