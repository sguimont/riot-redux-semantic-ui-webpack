var webpack = require('webpack');
var path = require('path');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: './src/index.js',
  output: {
    path: __dirname,
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      jQuery: "jquery"
    }),
    new ExtractTextPlugin("styles.[hash].css"),
    new HtmlWebpackPlugin({
      template: 'index.html',
      inject: 'body'
    })
  ],
  resolve: {
    alias: {
      jquery: 'jquery/dist/jquery.min.js'
    }
  },
  module: {
    loaders: [
      {test: /\.scss$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader!sass-loader")},
      {test: /\.css$/, loader: ExtractTextPlugin.extract("style-loader", "css-loader")},
      {test: /\.(ttf|eot|svg|woff(2)?).*$/, loader: "file-loader"},
      {test: /\.(png|jpg|jp(e)?g)$/, loader: "url-loader?limit=1000"},
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.tag$/,
        loader: 'tag',
        exclude: /node_modules/
      }
    ]
  }
};
