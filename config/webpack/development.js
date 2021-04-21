var path = require("path");
process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");
environment.config.devServer.watchContentBase = true;
environment.config.devServer.contentBase = [
  path.join(__dirname, "../../app/views"),
  path.join(__dirname, "../../app/helpers"),
  path.join(__dirname, "../../app/reflexes"),
];

environment.loaders.prepend('css', {
    test: /\.css$/,
    use: [
      "style-loader",
      {
        loader: "css-loader",
        options: {
          importLoaders: 1,
        },
      },
      "postcss-loader"
    ]
})

module.exports = environment.toWebpackConfig();
