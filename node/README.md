# Node.js

**Node.js** is a JavaScript runtime for server-side programming. It allows creation of scalable backend functionality using JavaScript

**npm** is the Node.js package manager for installing modules and packages to use with Node.js

**nvm** is the Node.js version manager for switching between different versions of node
- Available versions and their configuration can be found at ``~/.nvm/versions/node``

## Config

### Node

``node -v`` | Check Node.js version

``npm -v`` | Check npm version

``npm install -g npm@latest`` | Upgrade npm to latest version

``npm install -g npm@X.Y.Z`` | Install a specific vesion of npm

``nvm -v`` | Check nvm version

``nvm install latest`` | Install latest version of node using ``nvm``

``nvm install vX.Y.Z`` | Install specific version of node using ``nvm``

``nvm alias default vX.Y.Z`` | Set default node version

``nvm unalias <alias-name>`` | Remove an alias

``nvm ls`` | View ``nvm`` settings, including aliases

``nvm use vX.Y.Z`` | Use a specific node version


# Webpack

``npx webpack <command>`` | Run any Webpack command

## Config

``npx webpack info`` | See system info, including Webpack version

``npm install --save-dev webpack`` | Install latest version of Webpack

``npm install --save-dev webpack@<version>`` | Install specific version of Webpack

``npm webpack serve -v`` | Check webpack-dev-server version. Also shows webpack, webpack-cli versions
- Resource: [webpack-dev-server](https://www.npmjs.com/package/webpack-dev-server) from NPM