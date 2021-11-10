class String
    def palindrome?(str)
        str == str.reverse
    end
end

w = String.new
p w.class
p w.class.superclass
p w.class.superclass.superclass

# User class
class User
    attr_accessor :name, :email
    def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
    end
    def formatted_email
    "#{@name} <#{@email}>"
    end
end