# returns amount of coins, leftover change
def calculate_coins(coin_amount, change)
  coins = change / coin_amount
  rem = change % coin_amount
  change = change - coins * coin_amount

  return coins, change
end

def round_cents(cents)
  if cents % 5 == 0
    return cents 
  else
    return (cents.to_f / 5).round * 5
  end
end

def output_coins(type, count)
  if count > 1 # plural coins
    "#{count} #{type}s"
  else # will be 1
    "1 #{type}"
  end
end

def build_output(coin_count)
  if coin_count.size == 1
    return output_coins(coin_count.keys.first, coin_count.values.first)
  end

  # ruby hashes are ordered in ruby >1.9
  output = ""
  coin_count.each do |type, count|
    unless coin_count.keys.last == type
      output += output_coins(type, count) + ", "
    else
      # last key
      output += "and " + output_coins(type, count)
    end
  end
  output
end

### START PROGRAM

begin
print "How much change is owed? "
change = gets.to_f
# to_f changes strings to 0.0 and also removes strings if mixed with numbers
# doesn't match business requirements
# alternative is to use Float class and validate it
end until change.to_s =~ /^(([1-9]\d{0,7})|0)(\.\d{1,2})$/

# work with cents
change = round_cents((change * 100).to_i)

coin_types = {
  :toonie => 200,
  :loonie => 100,
  :quarter => 25,
  :dime => 10,
  :nickel => 5
}
coin_count = Hash.new(0)
total_coins = 0

coin_types.each do |type, value|
  count, change = calculate_coins(value, change)
  if count > 0
    coin_count[type] += count
    total_coins += count
  end
end

unless total_coins == 0
  puts "You need to dispense #{build_output(coin_count)}."
else
  puts "You don't need to dispense change."
end
puts "Total coins: #{total_coins}"

