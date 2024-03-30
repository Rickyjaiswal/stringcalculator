require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum for a string with multiple numbers separated by commas" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "allows new lines between numbers and returns the sum" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports different delimiters and returns the sum" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "throws an exception for negative numbers and shows all negative numbers in the message" do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error("Negative numbers not allowed: -1,-3")
    end
  end
end
