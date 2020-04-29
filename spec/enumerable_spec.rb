require './enumerable'

RSpec.describe Enumerable do

  let (:array) { [2,4,7,3,8,9] }
  let (:result) { [] }
  let (:int_range) { (5..10) }
  let (:str_array) { %w[ball grain guitar top buttom right left] }
  let (:mix_array) { ["ball", 23, "grain", ["guitar", "top"]] }
  let (:nil_array) { ["ball", 23, "grain", ["guitar", "top"], nil] }
  let (:only_nil_array) { [false, nil] }

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

  # describe "#my_all?" do
  #   context "if argument given" do
  #     context "when argument is a Regex" do
  #       it "returns false when not all elements contain an a" do
  #         expect(str_array.my_all?(/[a]/)).to be false
  #       end

  #       it "returns true when all elements contain a or t" do
  #         expect(str_array.my_all?(/[at]/)).to be true
  #       end
  #     end

  #     context "when argument is a class name" do
  #       it "returns false when all elements are not strings" do
  #         expect(mix_array.my_all?(String)).to be false
  #       end

  #       it "returns true when all elements are integers" do
  #         expect(array.my_all?(Integer)).to be true
  #       end
  #     end

  #     context "when argument is an object" do
  #       it "returns true if all elements of the array are 1" do
  #         expect([1,1,1].my_all?(1)).to be true
  #       end

  #       it "returns false if all elements of the array are not 2" do
  #         expect(array.my_all?(2)).to be false
  #       end
  #     end
  #   end

  #   context "if a block is given and no arguments" do
  #     it "returns true if all elements are positive numbers" do
  #       expect(array.my_all? { |x| x.positive? }).to be true
  #     end

  #     it "returns false if all not elements are Strings" do
  #       expect(mix_array.my_all? { |x| x.is_a?(String) }).to be false
  #     end
      
  #     it "returns true if all elements are Strings" do
  #       expect(str_array.my_all? { |x| x.is_a?(String) }).to be true
  #     end
  #   end

  #   context "if no block is given" do
  #     it "returns true if all elements are truthy" do
  #       expect(mix_array.my_all?).to be true
  #     end

  #     it "returns false if not all elements are truthy" do
  #       expect(nil_array.my_all?).to be false
  #     end
  #   end
  # end
  
  # ball grain guitar top buttom right left

  describe "#my_any" do
    context "if an arguments is given" do
      context "if argument is Regex" do
        it "returns false when none of the elements contain a z" do
          expect(str_array.my_any?(/[z]/)).to be false
        end

        it "returns true when any of the elements contains r" do
          expect(str_array.my_any?(/[r]/)).to be true
        end
      end

      context "if argument is class name" do
        it "returns true if any of the elements is an Array" do
          expect(mix_array.my_any?(Array)).to be true
        end

        it "returns false if any of the elements is a String" do
          expect(array.my_any?(String)).to be false
        end
      end

      context "if argument is an object" do
        it "returns true if any of the elements is 2" do
          expect(array.my_any?(2)).to be true
        end

        it "returns false if any of the elements is 10" do
          expect(array.my_any?(10)).to be false
        end
      end
    end

    context "if a block is given but no argument" do
      it "returns true if any of the elements is a positive number" do
        expect(array.my_any? { |x| x.positive? }).to be true
      end

      it "returns false if none of the elements is a String" do
        expect(array.my_any? { |x| x.is_a?(String) }).to be false
      end
      
      it "returns true if any of the elements is a String" do
        expect(mix_array.my_any? { |x| x.is_a?(String) }).to be true
      end

    end

    context "if no block is given nor an argument" do
      it "returns true if any of the elements is a truthy value" do
        expect(mix_array.my_any?).to be true
      end

      it "returns false if none of the elements is a truthy value" do
        expect(only_nil_array.my_any?).to be false
      end
    end
  end
end