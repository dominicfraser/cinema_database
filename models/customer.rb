require_relative('../db/Sql_runner')

class Customer

  attr_reader :id

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i
    @name = customer_hash['name']
    @category_id = customer_hash['category_id'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, category_id) VALUES ('#{@name}', #{@category_id}) RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

end