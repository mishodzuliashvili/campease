# Step 1: Use the official Node.js image as a base
FROM node:18 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Step 4: Install the dependencies
RUN npm install

# Step 5: Copy the rest of the project files to the container
COPY . .

# Step 6: Build the Next.js app
RUN npm run build

# Step 7: Set the environment to production
ENV NODE_ENV=production

# Step 8: Expose the default Next.js port
EXPOSE 3004

# Step 9: Start the Next.js app in production mode
CMD ["npm", "run", "start"]
