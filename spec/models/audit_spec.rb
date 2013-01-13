require 'spec_helper'

describe Audit  do
  
  describe 'audit math' do
    it 'should require arguments' do
      lambda { Tab.filtered_random }.should raise_error
    end

    it 'should require arguments' do
      lambda { Tab.filtered_random }.should raise_error
    end

    it 'adds supplied you_owe_mes and subtracts supplied payments' do
      you_owe_mes Random.rand(1...5).times.collect { |y| FactoryGirl.build(:you_owe_me)}
      payments Random.rand(1...5).times.collect { |p| FactoryGirl.build(:payment)}
    end
  end
  
end