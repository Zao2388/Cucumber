class Account
  def initialize(amount)
  end
end

Given(/^I have deposited \$(\d+) in my account$/) do |amount|
  Account.new(amount.to_i)
end

When(/^I request \$(\d+)$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^\$(\d+) should be dispensed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
