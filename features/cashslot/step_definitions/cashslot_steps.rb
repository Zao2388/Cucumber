class Account
  def deposit(amount)
    @balance = amount
  end
  
  def balance
    @balance
  end
end

class Teller
  def withdraw_from(account, amount)
  end
end

module KnowsMyAccount
  def my_account
    @my_account ||= Account.new
  end
end

World(KnowsMyAccount)

CAPTURE_A_NUMBER = Transform /^\d+$/ do |number|
  number.to_i
end

Given /^I have deposited \$(#{CAPTURE_A_NUMBER}) in my account$/ do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  Wrong.assert{my_account.balance == amount}
end

When /^I request \$(\d+)$/ do |amount|
  teller = Teller.new
  teller.withdraw_from(my_account, amount)
end

Then /^\$(\d+) should be dispensed$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end