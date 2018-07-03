require 'csv'
# puts "Which .txt file would you like to open?"

puts "Which .csv file in this folder would you like to open?"
csv_file = gets.chomp

existence = File.exist?(csv_file)
while existence == false
  puts "This is not a valid file. Which .txt file in this folder would you like to open?"
  csv_file = gets.chomp
  existence = File.exist?(csv_file)
end

my_file = File.open(csv_file)

data = CSV.read(csv_file, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_employees = data.map do |d|
    d.to_hash
end

puts "Would you like to add another employee?"
answer = gets.chomp.downcase
while answer == "yes" || answer == "y" do
  puts "What's the employee's name?"
  name = gets.chomp
  puts "What's the employee's location? SF or Chi"
  location = gets.chomp.upcase
  employee_new = {:name=>name, :location=>location}
  hashed_employees.push(employee_new)
  puts "Would you like to add another employee?"
  answer = gets.chomp.downcase
end

hashed_employees.uniq!
hashed_employees.shuffle!

chicago = Array.new
sf = Array.new
other_location = Array.new


hashed_employees.each do |x|
  employee_loc = x[:location].upcase
  case employee_loc
  when "CHICAGO","CHI","chicago","chi"
    chicago.push(x[:name])
  when "SAN FRANCISCO","SF","sf","SF"
    sf.push(x[:name])
  else
    other_location.push(x[:name])
  end
end

puts "How many people would you like in each group?"
group_size = gets.chomp.to_i


def sort(city,group_size)
  remainder = city.length % group_size
  if remainder == 0
    number_groups = city.length / group_size
  else
    number_groups = (city.length / group_size) + 1
  end
  group_hash = Hash.new
  z = 0
  number_groups.times do |x|
    my_array = Array.new
    while my_array.count < group_size
      if city[z].nil?
        break
      else
        my_array.push(city[z])
      end
      z += 1
    end
    group_key = "Group " + (x + 1).to_s
    group_hash[group_key] = my_array
  end
  return group_hash
end

chicago_groups = sort(chicago,group_size)
sf_groups = sort(sf,group_size)
other = sort(other_location,group_size)

final_groups = Hash.new
final_groups["Chicago"] = chicago_groups
final_groups["San Francisco"] = sf_groups
final_groups["Other Locations"] = other


filename = "groups" + Time.now.to_i.to_s + ".txt"
my_file = File.new(filename,"w")
final_groups.each do |city,groups|
  my_file.write(city.to_s.upcase + " GROUPS \n")
  groups.each do |group_num, employees|
    my_file.write(group_num.to_s + "\n")
    employees.each do |employee|
      my_file.write(employee.to_s + "\n")
    end
    my_file.write "\n"
  end
end
puts "Your groups have been sorted into " + filename
