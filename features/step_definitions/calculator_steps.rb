require 'wrong'
# Given(/^the input "([^"]*)"$/) do |input|
#   @input = input
# end

# When(/^the calculator is run$/) do
#   @output = `ruby lib/calc.rb #{@input}` #linux shell echo $((2 +4))
#   raise('Command failed!') unless $?.success?
# end

# Then(/^the output should be "([^"]*)"$/) do |expected_output|
#   #@output.should == expected_output
#   expect(@output).to eq(expected_output)
# end
Given(/^the input "([^"]*)"$/) do |input|
  @input = input
end

When(/^the calculator is run$/) do
  @output = `ruby lib/calc.rb #{@input}`
  raise('Command failed!') unless $?.success?
end

Then(/^the output should be "([^"]*)"$/) do |expected_output|
  #@output.should == expected_output
  #expect(@output).to eq(expected_output)
  Wrong.assert{@output==expected_output}
end