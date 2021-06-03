begin
print "How much change is owed? "
change = gets.to_f
# to_f changes strings to 0.0 and also removes strings if mixed with numbers
# doesn't match business requirements
# alternative is to use Float class and validate it
end until change.to_s =~ /^(([1-9]\d{0,7})|0)(\.\d{1,2})$/

total_coins = 0

puts "You need to dispense #{}."
puts "You don't need to dispense change."
puts "Total coins: #{total_coins}"

