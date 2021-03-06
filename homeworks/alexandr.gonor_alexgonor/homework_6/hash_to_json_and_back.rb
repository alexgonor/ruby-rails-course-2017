require 'json'
require 'yaml'

# User
class User
  def initialize(params)
    params.each do |key, value|
      define_singleton_method(key) do
        puts(value)
        value
      end
    end
  end
end

puts 'Tell me your first name'
name = gets.chomp
puts 'And last name'
surname = gets.chomp

hash = { first_name: name, last_name: surname }
params = hash.merge(full_name: hash.values.join(' '))
user = User.new(params)

puts user_hash = { 'user' =>
  {
    'first_name_and_last_name' => [
      'first_name' => user.first_name.to_s,
      'last_name' => user.last_name.to_s
    ],
    'full_name' => user.full_name.to_s
  } }

puts json = JSON.pretty_generate(user_hash)
puts '===================================='
puts parsed = JSON.parse(json)
puts '===================================='
File.open('user.yml', 'w') do |file|
  file.write(parsed.to_yaml)
end
puts parsed.to_yaml
puts '===================================='
puts YAML.safe_load(File.read('user.yml'))
puts '===================================='
