
puts "Which .txt file in this folder would you like to open?"
txt_file = gets.chomp

existence = File.exist?(txt_file)
while existence == false
  puts "This is not a valid file. Which .txt file in this folder would you like to open?"
  txt_file = gets.chomp
  existence = File.exist?(txt_file)
end

my_file = File.open(txt_file)


employees = Array.new
my_file.each do |user|
  employees.push(user)
end


puts "Would you like to add another person?"
answer = gets.chomp
while answer == "yes" do
  puts "who?"
  new_employee = gets.chomp + "\n"
  employees.push(new_employee)
  puts "Would you like to add another person?"
  answer = gets.chomp
end
#finds unique employees in the array

employees.reject! do |item|
  item.nil? || item == "\n"
end

employees.uniq!
employees.shuffle!

puts "How many people would you like in each group?"
group_size = gets.chomp.to_i

remainder = employees.length % group_size
if remainder == 0
  number_groups = employees.length / group_size
else
  number_groups = (employees.length / group_size) + 1
end



group_hash = Hash.new
z = 0
number_groups.times do |x|
  my_array = Array.new
  while my_array.count < group_size
    if employees[z].nil?
      break
    else
      my_array.push(employees[z])
    end
    z += 1
  end
  group_key = "Group " + (x+1).to_s
  group_hash[group_key] = my_array
end

filename = "groups" + Time.now.to_i.to_s + ".txt"
my_file = File.new(filename,"w")
group_hash.each do |key, value|
  my_file.write(key.to_s + "\n")
  value.each do |x|
    my_file.write(x)
  end
  my_file.write "\n"
end
puts "Your groups have been sorted into " + filename + " in this folder."
