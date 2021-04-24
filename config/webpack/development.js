var path = require("path");
process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");
environment.config.devServer.watchContentBase = true;
environment.config.devServer.contentBase = [
  path.join(__dirname, "../../app/views"),
  path.join(__dirname, "../../app/helpers"),
  path.join(__dirname, "../../app/reflexes"),
];

// Get the actual sass-loader config
const sassLoader = environment.loaders.get('sass')
const sassLoaderConfig = sassLoader.use.find(function(element) {
  return element.loader === 'sass-loader'
})

// Use Dart-implementation of Sass (default is node-sass)
const options = sassLoaderConfig.options
options.implementation = require('sass')

environment.loaders.prepend('sass', {
    test: /.s(a|c)ss$/,
    use: [
      "style-loader",
      {
        loader: "css-loader",
        options: {
          importLoaders: 1,
        },
      },
      "sass-loader",
      "postcss-loader"
    ]
})


module.exports = environment.toWebpackConfig();
