require 'rubygems'
require 'mailgun'
require 'nokogiri'
require 'mechanize'

# Mailgun setup
mailgun_client = Mailgun::Client.new 'MAILGUN_API_KEY' 
domain_name = 'DOMAIN_NAME'
