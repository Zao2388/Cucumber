class Account
  def deposit(amount)
    @balance = amount
  end
  
  def balance
    @balance
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty!")
  end
  def dispense(amount)
    @contents = amount
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    @cash_slot.dispense(amount)
  end
end

module KnowsTheDomain
  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

  def teller
    @teller ||= Teller.new(cash_slot)
  end
end

World(KnowsTheDomain)

CAPTURE_A_NUMBER = Transform /^\d+$/ do |number|
  number.to_i
end

Given /^I have deposited \$(#{CAPTURE_A_NUMBER}) in my account$/ do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  Wrong.assert{my_account.balance == amount}
end

When /^I withdraw \$(\d+)$/ do |amount|
  teller.withdraw_from(my_account, amount)
end

Then /^\$(\d+) should be dispensed$/ do |amount|
  Wrong.assert{@cash_slot.contents == amount}
end