#!/usr/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true
require "rubygems"
require "thor"

class Deploy < Thor
  include Thor::Actions

  USER = "brewbaccas".freeze
  HOST = "brewbaccas.com".freeze
  DEPLOY_TO = "~/current".freeze

  desc "start", "Deploy site to server"
  def start
    puts "Starting deployment..."
    build
    deploy
    puts "Deployment Finished"
  end

  no_commands do
    private def build
      puts "Building current site..."
      run %(bundle exec middleman build)
    end

    private def deploy
      puts "Syncing files..."
      run %(rsync -a -P ./build/ #{USER}@#{HOST}:#{DEPLOY_TO})
    end
  end
end
