require 'minitest/autorun'

class Book
	attr_accessor :title, :description

	def initialize title, author
		binding.pry
		@description = "Written by #{author.name}"
	end

end

describe Book do

	it "uses author's name in description" do
		tim_author = MiniTest::Mock.new
		tim_author.expect(:name, "Tim Hickey")
		book = Book.new("Introduction to 3D graphics", author: tim_author)
		book.description.must_equal 'Written by Tim Hickey'
		#tim_author.verify
	end
end