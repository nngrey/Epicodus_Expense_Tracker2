class Category

  attr_reader :description, :id

  def initialize(category_hash)
    @description = category_hash[:description]
    @id = category_hash[:id]
  end

  def self.create(category_hash)
    new_category = Category.new(category_hash)
    new_category.save
    new_category
  end

  def self.all
    categories = []
    results = DB.exec("SELECT * FROM categories;")
    results.each do |result|
      description = result['description']
      id = result['id']
      categories << Category.new({:description => description, :id => id})
    end
    categories
  end

  def save
    results = DB.exec("INSERT INTO categories (description) VALUES ('#{@description}') RETURNING id;")
    @id = id
  end

  def ==(another_category)
    @description == another_item.description && @id == another_item.id
  end
end
