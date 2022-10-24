require 'bundler'  #appel du bundler et permettent de lire le gemfile afin d'éviter d'ecrire partout des require'gem'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController

