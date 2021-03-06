def create_list
  print "What is the list name?"
  name = gets.chomp

  hash = { "name" => name, "items" => Array.new}
  return hash
end

def add_list_item
  print "What is the item called?"
  item_name = gets.chomp

  print "How many?"
  quantity = gets.chomp.to_i

  hash = { "name" => item_name, "quantity" => quantity }
  puts "Would you like to add more items? (yes/no)"
  return hash
end

def print_separator(character="-")
  puts character * 80
end


def print_list(list)
  puts "list: #{list['name']}"
  print_separator()

  list["items"].each do |item|
    puts "\tItem: " + item['name'] + "\t\t\t" +
         "Quantity: " + item['quantity'].to_s
  end
  print_separator()
end


list = create_list()
puts "Add some items to the list."

loop do list['items'].push(add_list_item())
  user_input = gets.chomp.downcase
  break if user_input == "no"
end

puts "Here's your list:\n"
print_list(list)
