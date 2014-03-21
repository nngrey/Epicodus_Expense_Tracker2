class Item

  attr_reader :description, :amount, :purchase_date, :category_id, :id

  def initialize(item_hash)
    @description = item_hash[:description]
    @amount = item_hash[:amount]
    @purchase_date = item_hash[:purchase_date]
    @category_id = item_hash[:category_id]
    @id = item_hash[:id]
  end

  def self.create(item_hash)
    new_item = Item.new(item_hash)
    new_item.save
    new_item
  end

  def self.all
    items = []
    results = DB.exec("SELECT * FROM items;")
    results.each do |result|
      description = result['description']
      amount = result['amount'].to_f
      purchase_date = result['purchase_date']
      category_id = result['category_id'].to_i
      id = result['id'].to_i
      items << Item.new({:description => description, :amount => amount, :purchase_date => purchase_date, :category_id => category_id, :id => id})
    end
    items
  end

  def save
    results = DB.exec("INSERT INTO items (description, amount, purchase_date, category_id) VALUES ('#{@description}', '#{amount}', '#{purchase_date}', '#{category_id}') RETURNING id;")
    @id = results
  end

  def delete
    DB.exec("DELETE FROM items WHERE id = #{@id};")
  end

  def ==(another_item)
    @description == another_item.description && (@amount == another_item.amount && @purchase_date == another_item.purchase_date && @category_id == another_item.category_id) && @id == another_item.id
  end
end
