# Use an official Node runtime as a parent image
FROM node:14

# Install git
RUN apt-get update && apt-get install -y git

# Clone the specific repository
RUN git clone --depth 1 https://github.com/aleksas/peerjs-audio-chat/ -b update /usr/src/app

# Set the working directory in the container
WORKDIR /usr/src/app

# Install any needed packages specified in package.json
RUN npm install

# Make port 6767 available to the world outside this container
EXPOSE 6767

# Run the application when the container launches
CMD ["node", "index.js"]
