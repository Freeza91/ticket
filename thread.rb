#refer http://www.yiibai.com/ruby/ruby_multithreading.html

def func1 
	p 123
end

def func2
	p 345
end

arr = []

#10.times do |i|

arr << Thread.new{func1()}
arr << Thread.new{func2()}

arr.each do |t|
	t.join
end

hour = 24
mintes = 60
second = 60
sleep(hour * mintes * second)

