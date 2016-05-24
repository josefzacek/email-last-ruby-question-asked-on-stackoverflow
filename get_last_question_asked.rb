require 'rubygems'
require 'mailgun'
require 'nokogiri'
require 'mechanize'

# Mailgun setup
mailgun_client = Mailgun::Client.new 'MAILGUN_API_KEY'
domain_name = 'DOMAIN_NAME'

agent = Mechanize.new

page = agent.get('http://stackoverflow.com/questions/tagged/ruby')

all_questions = agent.page.parser.css('.summary h3 a')

first_question_link = all_questions.first['href']

page = agent.get(first_question_link)

last_question_asked = agent.page.parser.css('.post-text').text
