require 'rubygems'
require 'mailgun'
require 'nokogiri'
require 'mechanize'

# Mailgun setup
mailgun_client = Mailgun::Client.new 'MAILGUN_API_KEY'
domain_name = 'DOMAIN_NAME'

agent = Mechanize.new

agent.get('http://stackoverflow.com/questions/tagged/ruby')

all_questions = agent.page.parser.css('.summary h3 a')

first_question_link = all_questions.first['href']

agent.get(first_question_link)

last_question_asked = agent.page.parser.css('.post-text').text

last_question_saved = File.read('last_question_saved.txt')

unless last_question_asked.eql? last_question_saved

  File.open('last_question_saved.txt', 'w') do |file|
    file.write(last_question_asked)
  end

  new_question_asked = { from: 'ruby@stackoverflow.com',
                         to: 'info@josefzacek.com',
                         cc: 'info@josefzacek.cz',
                         subject: "#{Time.now.strftime('%d/%m/%Y %H:%M')}
                          - New ruby question added",
                         text: "#{last_question_asked}
                         \rhttp://stackoverflow.com#{first_question_link}" }

  mailgun_client.send_message domain_name, new_question_asked
end
