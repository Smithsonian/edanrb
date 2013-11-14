#!/usr/bin/env ruby
# (c) 2013 Smithsonian Institution.
# Use subject to license terms.

require "net/http"

class EDANQuery
  attr_accessor :server, :app_id, :username, :password

  def warn_if_empty(var, var_name)
    puts "please provide a value for #{var_name}" if var.nil? || var.empty?
  end

  def initialize(app_id, options = {})
    warn_if_empty(app_id, "app_id")

    @server = options[:server] || 'http://edan-api.si.edu'
    @app_id = app_id

    @username = ENV['EDANUSER']
    warn_if_empty(@username, "ENV['EDANUSER']")

    @password = ENV['EDANPASS']
    warn_if_empty(@password, "ENV['EDANPASS']")
  end

  def request(params="start=0", service="/metadataService")
    #puts "==> #{username} #{password}"
    uri = URI.parse(server + service + '?' + params)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    request.basic_auth(username, password)
    request['X-AppId'] = app_id
    response = http.request(request)
    return response;
  end


end
