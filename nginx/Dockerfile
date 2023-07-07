# Build stage
FROM node:18-alpine AS django-builder
WORKDIR /frontend
COPY react-typescript-redux/frontend/package*.json ./
RUN npm ci
COPY react-typescript-redux/frontend/ ./
ARG REACT_APP_DJ_API_URL
ENV REACT_APP_DJ_API_URL=$REACT_APP_DJ_API_URL
RUN npm run build

FROM node:18-alpine AS express-builder
WORKDIR /frontend
COPY Node/frontend/package*.json ./
RUN npm ci
COPY Node/frontend/ ./
ARG REACT_APP_EX_API_URL
ENV REACT_APP_EX_API_URL=$REACT_APP_EX_API_URL
RUN npm run build


# Nginx stage
FROM nginx:1.21-alpine
COPY --from=django-builder react-typescript-redux/frontend/build /var/www/portfolio-frontend
COPY --from=express-builder Node/frontend/build /var/www/tricypaa-frontend
COPY ./nginx/nginx-setup.conf /etc/nginx/conf.d/default.conf