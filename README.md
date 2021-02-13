clone                
bundle install                  

rails db:create                  
rails db:migrate            
rails db:seed            

curl --request GET 'http://localhost:3000/subscriptions?currency=BTC&amount=10000'                


