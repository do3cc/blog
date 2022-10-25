var path = require("path");
var MiniCssExtractPlugin = require("mini-css-extract-plugin");

var options = {
  entry: {
    app: "./js/main.js",
    styles: "./scss/main.scss",
  },
  output: {
    path: path.dirname(__dirname) + "/assets/static/gen",
    filename: "[name].js",
  },
  devtool: "source-map",
  resolve: {
    modules: ["node_modules"],
    extensions: ["", ".js"],
    fallback: { url: require.resolve("url") },
  },
  mode: "production",
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "babel-loader",
          },
        ],
      },
      {
        test: /\.scss$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"],
      },
      {
        test: /font-awesome.css/,
        use: [MiniCssExtractPlugin.loader, "css-loader"],
      },
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader"],
      },
      {
        test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "url?limit=10000&mimetype=application/font-woff",
          },
        ],
      },
      {
        test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "url?limit=10000&mimetype=application/font-woff",
          },
        ],
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "url?limit=10000&mimetype=application/octet-stream",
          },
        ],
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "file",
          },
        ],
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "url?limit=10000&mimetype=image/svg+xml",
          },
        ],
      },
    ],
  },
  plugins: [new MiniCssExtractPlugin()],
};

module.exports = options;
