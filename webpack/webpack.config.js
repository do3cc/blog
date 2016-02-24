var webpack = require('webpack');
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin');


var options = {
  entry: {
    'app': './js/main.js',
    'styles': './scss/main.scss'
  },
  output: {
    path: path.dirname(__dirname) + '/assets/static/gen',
    filename: '[name].js'
  },
  devtool: '#source-map',
  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js']
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.scss$/,
          loader: ExtractTextPlugin.extract(
              'style-loader', 'css-loader!sass-loader')
      },
      {
          test: /font-awesome.css/,
          loader: ExtractTextPlugin.extract(
              'style-loader', 'css-loader')
      },
      {
        test: /\.css$/,
        loader: 'style!css'
      },
      {
          test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,
          loader: "url?limit=10000&mimetype=application/font-woff"
      }, {
          test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/,
          loader: "url?limit=10000&mimetype=application/font-woff"
      }, {
          test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
          loader: "url?limit=10000&mimetype=application/octet-stream"
      }, {
          test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
          loader: "file"
      }, {
          test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
          loader: "url?limit=10000&mimetype=image/svg+xml"
      }
    ]
  },
  plugins: [
      new ExtractTextPlugin('[name].css', {
          allChunks: true}),
      new webpack.optimize.UglifyJsPlugin(),
      new webpack.optimize.DedupePlugin()
  ]
};

module.exports = options;
