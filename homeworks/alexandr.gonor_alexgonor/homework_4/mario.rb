# Mario
class Mario
  def self.welcome
    puts 'Choose one: Build steps Array method (A) or String method (S)'
    choice = gets.chomp.downcase
    if choice == 'a'
      mario_arr
    elsif choice == 's'
      mario_str
    else
      puts 'It can be only A or S!'
      return welcome
    end
  end

  def self.mario_arr
    puts 'Give me number of steps'
    number = gets.chomp.to_i
    number.times do |i|
      p Array.new(steps - i, '')
      + Array.new(((steps - (steps - 4)) + i * 2), '#')
             .fill(i + 1...i + 3) { '' }
    end
  end

  def self.mario_str
    puts 'Give me number of steps'
    number = gets.chomp
    steps = number.to_i
    (steps + 1).times do |i|
      p ' ' * (steps - i) + '#' * i + '  ' + '#' * i
    end
  end
end
puts Mario.welcome
