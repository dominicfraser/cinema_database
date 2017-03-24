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

  ###CRUD INSTANCE

  def save()
    sql = "INSERT INTO tickets (film_id, screening_id, customer_id, price_id) VALUES (#{@film_id},#{@screening_id},#{@customer_id},#{@price_id}) RETURNING * "
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end








end