#require 'wrong'
#=======================================================================
#Substract
Given(/^the new input "([^"]*)"$/) do |input|
  @input = input
end

When(/^the calculator is run again$/) do
  @output = `ruby lib/calc.rb #{@input}`
  raise('Command failed!') unless $?.success?
end

Then(/^the output should be: "([^"]*)"$/) do |expected_output|
  Wrong.assert{@output==expected_output}
end