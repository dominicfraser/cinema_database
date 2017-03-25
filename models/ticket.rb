require_relative('../db/Sql_runner')

class Ticket

  attr_reader

  def initialize(ticket_hash)
    @id = ticket_hash['id'].to_i
    @film_id = ticket_hash['film_id'].to_i
    @screening_id = ticket_hash['screening_id'].to_i
    @customer_id = ticket_hash['customer_id'].to_i
    @price_id = ticket_hash['price_id'].to_i
  end

  ### INSTANCE METHODS

  def create_and_buy_ticket(customer)
    self.save()
    sql = "SELECT prices.* FROM prices
      INNER JOIN customers ON prices.id=customers.category_id
      WHERE customers.id = #{@customer_id} "
    price = SqlRunner.run(sql).first['price'].to_i
    customer.cash -= price
  end

  ###CRUD INSTANCE

  def save() ##only to be used to test as replaced by create_and_buy method
    sql = "INSERT INTO tickets (film_id, screening_id, customer_id, price_id) VALUES (#{@film_id},#{@screening_id},#{@customer_id},#{@price_id}) RETURNING * "
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE tickets SET (film_id, screening_id, customer_id, price_id) = (#{@film_id},#{@screening_id},#{@customer_id},#{@price_id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  ### CLASS METHODS
  def self.all()
    sql = "SELECT * FROM tickets"
    return Ticket.map_tickets(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

    ##helper
  def self.map_tickets(sql)
    tickets = SqlRunner.run(sql)
    return result = tickets.map { |ticket| Ticket.new(ticket)}
  end






end