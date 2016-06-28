##==> Moved to lib/nice_bank.rb 

# class Account
#   def deposit(amount)
#     @balance = amount
#   end
  
#   def balance
#     @balance
#   end
# end

# class CashSlot
#   def contents
#     @contents or raise("I'm empty!")
#   end
#   def dispense(amount)
#     @contents = amount
#   end
# end

# class Teller
#   def initialize(cash_slot)
#     @cash_slot = cash_slot
#   end

#   def withdraw_from(account, amount)
#     @cash_slot.dispense(amount)
#   end
# end

##==> Moved to features/support/world_extensions.rb 

# module KnowsTheDomain
#   def my_account
#     @my_account ||= Account.new
#   end

#   def cash_slot
#     @cash_slot ||= CashSlot.new
#   end

#   def teller
#     @teller ||= Teller.new(cash_slot)
#   end
# end

# World(KnowsTheDomain)

##==> Moved to features/support/transforms.rb 


# CAPTURE_A_NUMBER = Transform /^\d+$/ do |number|
#   number.to_i
# end

Given /^my account has been credited with \$(#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  my_account.credit(amount)
  Wrong.assert{my_account.balance == amount}
end

When /^I withdraw \$(#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^\$(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/ do |amount|
  Wrong.assert{@cash_slot.contents == amount}
end

Then /^the balance of my account should be \$(#{CAPTURE_CASH_AMOUNT})$/ do |amount|
  Wrong.assert{my_account.balance == amount}
end