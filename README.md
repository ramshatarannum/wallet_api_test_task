
# Wallet Api Test Task



## Setup     
git clone:  `https://github.com/ramshatarannum/wallet_api_test_task.git`    

cd `wallet_api_test_task`     

#### Install Dependencies     

Ruby: `3.0.0`    
rails: `7.1.4`

Make sure you have Rails and PostgreSQL installed, then run:    
`bundle install`    

#### Database Setup   

`rails db:create`   
`rails db:migrate` 

### Seed the Data     

`rails db:seed` 

### Testing with RSpec     

This project uses RSpec for unit testing. To get started with RSpec, follow the steps below:     

#### Install RSpec     
Add RSpec to your Gemfile:    
`gem 'rspec-rails'`     

Then, run:    
`bundle install`    
`rails generate rspec:install`     

This will set up the RSpec configuration and create the necessary spec directories.     

#### Run the Specs    
 `rspec`    

#### Code Quality with RuboCop    
To ensure code quality, install the RuboCop gem. Add it to your Gemfile:   

`gem 'rubocop', require: false`     

After that, run:

`bundle install`     

You can then run RuboCop with:


`rubocop -A`


## Conclusion
This Wallet & Transaction System provides a robust framework for managing user wallets and transactions, featuring custom authentication and a stock price integration. It’s designed for ease of use and security, making it suitable for various financial applications.

Happy Coding!
