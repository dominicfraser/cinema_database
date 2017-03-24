require_relative('../db/Sql_runner')

class Price

  attr_reader :id

  def initialize(price_hash)
    @id = price_hash['id'].to_i
    @category = price_hash['category']
    @price = price_hash['price'].to_i
  end

  ###CRUD INSTANCE METHODS

  def save()
    sql = "INSERT INTO prices (category, price) VALUES ('#{@category}', #{@price}) RETURNING *"
    price = SqlRunner.run(sql).first
    @id = price['id'].to_i
  end

  def delete()
    sql = "DELETE FROM prices WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE prices SET (category, price) = ('#{@category}',#{@price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


  ### CLASS METHODS
  def self.all()
    sql = "SELECT * FROM prices"
    return Price.map_prices(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM prices"
    SqlRunner.run(sql)
  end

    ##helper
  def self.map_prices(sql)
    prices = SqlRunner.run(sql)
    return result = prices.map { |price| Price.new(price)}
  end



end