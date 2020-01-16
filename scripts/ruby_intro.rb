##########################
# Strings, Numbers are a class

1.class            # => Fixnum
"Greetings".class  # => String

##########################
# We use "new" to create new instances

a = Array.new(5)  # => [nil, nil, nil, nil, nil]

# We call a method by ".methodname"

a.size  # => 5
a.max   # => nil

##########################
# We do array assignments with brackets

a[0] = "Truth"      # => "Truth"
a[1] = "even"       # => "even"
a[2] = "unto"       # => "unto"
a[3] = "its"        # => "its"
a[4] = "innermost"  # => "innermost"
a[5] = "parts"      # => "parts"

##########################
# Ruby has lots of built in methods to operate on arrays!

a  # => ["Truth", "even", "unto", "its", "innermost", "parts"]

a.size  # => 6

a.class  # => Array

a.sample  # => "innermost"

a.sort  # => ["Truth", "even", "innermost", "its", "parts", "unto"]

##########################
# Variables are not declared, nor typed

x = 100  # => 100

x = "pito"  # => "pito"

y = x  # => "pito"

y = true  # => true

x  # => "pito"

##########################
# More about strings

"I am a string"  # => "I am a string"

'So am I'  # => "So am I"

concat = "I am a string " + 'so am i'  # => "I am a string so am i"

prompt = "Hello, my name is #{x}"  # => "Hello, my name is pito"

prompt = "Hello, my name is #{x.capitalize}"  # => "Hello, my name is Pito"

##########################
# Methods (are like functions, procedures, etc.)

def greet(name)
	result = "Good night #{name}"  # => "Good night Pito", "Good night Pito"
	return result                  # => "Good night Pito", "Good night Pito"
end

greet("Pito")  # => "Good night Pito"
greet "Pito"   # => "Good night Pito"

# More idiomatic:!

def greet name
	"Good night #{name}"  # => "Good night Pito", "Good night Pito"
end

greet("Pito")  # => "Good night Pito"
greet "Pito"   # => "Good night Pito"

##########################
# Hashes aka dictionaries (Python)

who =
	{first: "Jon", last: "Anders", age: 12}  # => {:first=>"Jon", :last=>"Anders", :age=>12}
who[:first]                               # => "Jon"
who[:name]                                # => nil
who[0]                                    # => nil
who.length                                # => 3
who.sort                                  # => [[:age, 12], [:first, "Jon"], [:last, "Anders"]]

require 'json'    # => true
puts who.to_json  # => nil

# >> {"first":"Jon","last":"Anders","age":12}

###########
# Fun

a = ('a'..'z').to_a.shuffle[0..10].join
puts a