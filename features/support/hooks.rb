##==== Before Block
Before do
  puts "Go!"
end

Before('@single') do
  puts "third"
end

Before('@calc') do
  puts "Using calculator"
end

##==== After Block
After do
  puts "Stop!"
end