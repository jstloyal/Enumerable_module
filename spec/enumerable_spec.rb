require './enumerable'

describe Enumerable do

  let (:array) { [2,4,7,3,8,9] }
  let (:result) { [] }
  let (:int_range) {(5..10)}

  describe "my_each" do
    context "when a block is given" do
      it "passes each item to a given block" do
        array.my_each { |item| result << item }
        expect(result).to eql([2,4,7,3,8,9])
      end
    end

    context "block not given" do
      it "returns enumerator" do
        array.my_each
        expect(array).to eql(array)
      end
    end

    context "range when block is given" do
      it "iterates each item of the range" do
        int_range.my_each { |item| result << item * 2 }
        expect(result).to eql([10,12,14,16,18,20])
      end
    end
  end

  describe "my_each_with_index" do
    context "when a block is given" do
      it "passes each item in a given block" do
        array.my_each_with_index { |item, i| result << item if item % 2 == 0 }
        expect(result).to eql([2,4,8])
      end
    end
  end


end