require "enumerables"

describe Enumerable do 
  let(:ary) { [-1,0,1,2] }
  
  describe "#my_each" do
    context "when given a block" do
      it "acts on each element of array" do
          new_ary = []
          ary.my_each{ |n| new_ary <<  n + 1 }
          expect(new_ary).to eql([0,1,2,3])
      end
    end
  end

  describe "#my_each_with_index" do
    context "when given a block" do
      it "acts on each element of array" do
        new_ary = []
        ary.my_each_with_index{ |n| new_ary <<  n + 1 }
        expect(new_ary).to eql([0,1,2,3])
      end
      it "increases index" do
        current_i = 0
        ary.my_each_with_index{ |n, i| current_i = i}
        expect(current_i).to eql(3)
      end
    end
  end

  describe "#my_select" do
    context "when given a block" do
      it "selects matching elements" do
        expect(ary.my_select{|n| n}).to eql(ary)
        expect(ary.my_select{|n| n == 1}).to eql([1])
      end
    end
  end

  describe "#my_all?" do
    context "when given a block" do
      it "returns true if all elements match" do
        expect(ary.my_all?{|n| n < 5 } ).to eql(true)
      end
      it "returns false if any match is false" do
        expect(ary.my_all?{|n| n < 2 } ).to eql(false)
      end
    end
  end
end