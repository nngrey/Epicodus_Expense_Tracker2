require 'spec_helper'

describe Category do
  it 'initializes an expense category with description, amount, and date' do
    new_category = Category.new({:description => 'Burger King'})
    new_category.should be_an_instance_of Category
    new_category.description.should eq 'Burger King'
  end

  describe '#save' do
    it 'creates an array for all of the instances of Category' do
      new_category = Category.new({:description => 'Ninja'})
      new_category.save
      Category.all.length.should eq 1
    end
  end

  describe '.all' do
    it 'initializes and saves the instance at the same time' do
      new_category = Category.create({:description => "Peter"})
      Category.all.length.should eq 1
      Category.all[0].description.should eq 'Peter'
    end
  end

  describe '#==' do
    it 'tells you that two instances with the same values are equal' do
      new_category = Category.new({:description => 'Monkey', :id => 1})
      new_category2 = Category.new({:description => 'Monkey', :id => 1})
      new_category.should eq new_category2
    end
  end
end
