# Email last ruby question asked on stackoverflow

Go to http://stackoverflow.com/questions/tagged/ruby site and fetch newest question and save this question in last_question_saved.txt file

On next fetch compare question fetched with question saved in last_question_saved.txt file. 

If questions are same, do nothing otherwise save question to last_question_saved.txt file and send email using Maigun API


This can be easily extended to post question fetched to Twitter or LinkedIn using relevant gems. 


## Crontab setup

`rbenv which ruby` 
  
  returns path to ruby installed such as  **/root/.rbenv/versions/2.3.1/bin/ruby**
  

###  Run every minute, every hour, every day, every month, every day of week

`* * * * * /root/.rbenv/versions/2.2.0/bin/ruby /var/get_last_question_asked.rb`


