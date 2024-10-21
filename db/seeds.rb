# frozen_string_literal: true

# Create a team
user = User.create(name: 'John', email: 'john@gmail.com', password: 'password')
user.save!
puts 'User is created.'

# Create a team
team = Team.create(name: 'Developers')
team.save!
puts 'Team is created.'

# Create a stock
stock = Stock.create(name: 'AAPL')
stock.save!
puts 'Stock is created.'

# Here you can check this on console
# # Credit the user's wallet with $100 (since it's a credit, no source_wallet is needed)
# CreditTransaction.create!(amount: 100.0, target_wallet: user.wallet)

# # Check the balance after crediting
# user.wallet.balance  # => 100.0

# # Debit $50 from the user's wallet and transfer it to the team's wallet
# DebitTransaction.create!(amount: 50.0, source_wallet: user.wallet, target_wallet: team.wallet)

# # Check the balances
# user.wallet.balance  # => 50.0
# team.wallet.balance  # => 50.0

# # Try a transaction that should fail (e.g., debit more than available balance)
# DebitTransaction.create!(amount: 100.0, source_wallet: user.wallet)  # Raises "Insufficient funds" error
