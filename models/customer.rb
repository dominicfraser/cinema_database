require_relative('../db/Sql_runner')

class Customer

  attr_reader :id

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i
    @name = customer_hash['name']
    @category_id = customer_hash['category_id'].to_i
    @cash = customer_hash['cash'].to_i
  end

  ### INSTANCE METHODS
  def films #all films seen NOT all tickets for certain film
    sql = "SELECT films.* FROM films
    INNER JOIN tickets 
    ON tickets.film_id=films.id 
    WHERE tickets.customer_id = #{@id}"
    films_array = SqlRunner.run(sql).uniq
    film_objects = films_array.map{|film| Film.new(film)}
    return film_objects
  end

  ###CRUD INSTANCE

  def save()
    sql = "INSERT INTO customers (name, category_id, cash) VALUES ('#{@name}', #{@category_id},#{@cash}) RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, category_id, cash) = ('#{@name}', #{@category_id},#{@cash}) WHERE id = #{@id}"
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