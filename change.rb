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

def output_coins(coin_type, count)
  if count > 1 # plural coins
    "#{count} #{coin_type}s"
  else # will be 1
    "1 #{coin_type}"
  end
end

def build_output(coin_count)
  
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

coin_count = Hash.new(0)
coin_types = {
  :toonie => 200,
  :loonie => 100,
  :quarter => 25,
  :dime => 10,
  :nickel => 5
}
total_coins = 0

coin_types.each do |type, value|
  count, change = calculate_coins(value, change)
  coin_count[type] += count
  total_coins += count
end

puts "You need to dispense #{}."
#puts "You don't need to dispense change."
puts "Total coins: #{total_coins}"

