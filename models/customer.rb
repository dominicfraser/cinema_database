require_relative('../db/Sql_runner')

class Customer

  attr_reader :id

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i
    @name = customer_hash['name']
    @category_id = customer_hash['category_id'].to_i
  end

  ###CRUD INSTANCE

  def save()
    sql = "INSERT INTO customers (name, category_id) VALUES ('#{@name}', #{@category_id}) RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end



  ### CLASS METHODS
  def self.all()
    sql = "SELECT * FROM customers"
    return Customer.map_customers(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

    ##helper
  def self.map_customers(sql)
    customers = SqlRunner.run(sql)
    return result = customers.map { |customer| Customer.new(customer)}
  end

end