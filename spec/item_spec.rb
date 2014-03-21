require 'spec_helper'

describe Item do
  it 'initializes an expense item with description, amount, and date' do
    new_item = Item.new({:description => 'Burger King', :amount => 5.4, :purchase_date => '1994-09-09'})
    new_item.should be_an_instance_of Item
    new_item.description.should eq 'Burger King'
    new_item.amount.should eq 5.4
    new_item.purchase_date.should eq '1994-09-09'
  end

  describe '#save' do
    it 'creates an array for all of the instances of Item' do
      new_item = Item.new({:description => 'Ninja', :amount => 17.23, :category_id => 3, :purchase_date => '03/14/2014'})
      new_item.save
      Item.all.length.should eq 1
    end
  end

  describe '.all' do
    it 'initializes and saves the instance at the same time' do
      new_item = Item.create({:description => "Peter", :amount => 1.21, :category_id => 1, :purchase_date => '11/13/2013'})
      Item.all.length.should eq 1
      Item.all[0].description.should eq 'Peter'
    end
  end

  describe '#==' do
    it 'tells you that two instances with the same values are equal' do
      new_item = Item.new({:description => 'Monkey', :amount => 2.50, :purchase_date => "1/2/2012", :id => 1})
      new_item2 = Item.new({:description => 'Monkey', :amount => 2.50, :purchase_date => "1/2/2012", :id => 1})
      new_item.should eq new_item2
    end
  end
end
