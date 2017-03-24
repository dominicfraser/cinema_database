require_relative('../db/SqlRunner')

class Customer

  attr_reader :id

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i
    @name = customer_hash['name']
    @category = customer_hash['category'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, category) VALUES ('#{name}', #{category} RETURNING *"
    customer = SqlRunner.run(sql)
    @id = customer['id'].to_i
  end

end