require './enumerable'

RSpec.describe Enumerable do

  let (:array) { [2,4,7,3,8,9] }
  let (:result) { [] }
  let (:int_range) { (5..10) }
  let (:str_array) { %w[ball grain guitar top buttom right left] }
  let (:mix_array) { ["ball", 23, "grain", ["guitar", "top"]] }

  # describe "#my_each" do
  #   context "when a block is given" do
  #     it "passes each item to a given block" do
  #       array.my_each { |item| result << item if item % 2 == 1 }
  #       expect(result).to eql([7,3,9])
  #     end
  #   end

  #   context "block not given" do
  #     it "returns enumerator" do
  #       expect(array.my_each).to be_kind_of(Enumerator)
  #     end
  #   end

  #   context "range when block is given" do
  #     it "iterates each item of the range" do
  #       int_range.my_each { |item| result << item * 2 }
  #       expect(result).to eql([10,12,14,16,18,20])
  #     end
  #   end
  # end

  # describe "#my_each_with_index" do
  #   context "when a block is given" do
  #     it "passes each item in a given block" do
  #       array.my_each_with_index { |item, i| result << item if item % 2 == 0 }
  #       expect(result).to eql([2,4,8])
  #     end
  #   end

  #   context "block not given" do
  #     it "it returns the enumerator" do
  #       expect(array.my_each_with_index).to be_kind_of(Enumerator)
  #     end
  #   end

  #   context "range and block given" do
  #     it "iterate each item in a given block" do
  #       int_range.my_each_with_index { |item| result << item if item % 2 ==1 }
  #       expect(result).to eql([5,7,9])
  #     end
  #   end
  # end

  # describe "#my_count" do
  #   context "when block is given" do
  #     it "returns number items that match the condition in the block" do
  #       array.my_count { |item| result << item if item % 2 == 0}
  #       expect(result.count).to eql(3)
  #     end
  #   end

  #   context "when block is not given" do
  #     it "returns the number of items in the array" do
  #       expect(array.my_count).to eql(6)
  #     end
  #   end

  #   context "when an argument is given" do
  #     it "returns the number of times an item appear" do
  #       expect(array.count(2)).to eql(1)
  #     end
  #   end
  # end

  # describe "#my_select" do
  #   context "when block is given" do
  #     it "return items from the array that are true about the block" do
  #       array.my_select { |item| result << item if item % 2 == 1 }
  #       expect(result).to eql([7,3,9])
  #     end
  #   end

  #   context "when no block is given" do
  #     it "returns enumerator" do
  #       expect(array.my_select).to be_kind_of(Enumerator)
  #     end
  #   end
  # end

  #[ball grain guitar top buttom right left] 

  describe "#my_all?" do
    context "if argument given" do
      context "when argument is a Regex" do
        it "returns false when not all elements contain an a" do
          expect(str_array.my_all?(/[a]/)).to be false
        end

        it "returns true when all elements contain a or t" do
          expect(str_array.my_all?(/[at]/)).to be true
        end
      end

      context "when argument is a class name" do
        it "returns false when all elements are not strings" do
          expect(mix_array.my_all?(String)).to be false
        end

        it "returns true when all elements are integers" do
          expect(array.my_all?(Integer)).to be true
        end
      end

      context "when argument is an object" do
        it "returns true if all elements of the array are 1" do
          expect([1,1,1].my_all?(1)).to be true
        end

        it "returns false if all elements of the array are not 2" do
          expect(array.my_all?(2)).to be false
        end
      end
    end

    # context "if a block is given and no arguments" do

    # end

    # context "if no block is given"

    # end
  end
end