require 'minitest/autorun'

def fact(n)
   if n <= 1
      1
   else
      fact(n-1) * n
   end
end

describe "factorials" do
   it "works for 1" do
      fact(1).must_equal 1
   end

   it "works for 2" do
      fact(2).must_equal 2
   end

   it "works for 20" do
      fact(20).must_equal 2432902008176640000
   end

   it "works for zero" do
      fact(0).must_equal 0
   end
end
