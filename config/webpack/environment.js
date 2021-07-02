const { environment } = require('@rails/webpacker')
const ForkTSCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");

environment.plugins.append('ForkTSCheckerWebpackPlugin', new ForkTSCheckerWebpackPlugin());

module.exports = environment
