require_relative('../db/Sql_runner')

class Price

  attr_reader :id

  def initialize(price_hash)
    @id = price_hash['id'].to_i
    @category = price_hash['category']
    @price = price_hash['price'].to_i
  end

  def save()
    sql = "INSERT INTO prices (category, price) VALUES ('#{@category}', #{@price}) RETURNING *"
    price = SqlRunner.run(sql).first
    @id = price['id'].to_i
  end

end