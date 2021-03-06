#with initialize
class A
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method (key) {puts "#{value}"}
    end
  end
end

hash = {hello: "Hello, babe", play: "Do you want play with me?"}

a = A.new(hash)
a.hello
a.play

#without initialize
class B
  hash = {bye: "Bye, babe", no_play: "Sorry,I don't want to play with you"}

  hash.each do |key, value|
    define_method(key) {puts "#{value}"}
  end
end

b = B.new
b.bye
b.no_play

class C
  def method_missing(method_name, args)
    args[method_name]
  end
end

hash = {yes: "fine", no: "bad"}
c = C.new
p c.yes(hash)
p c.no(hash)
p c.ok(hash)
