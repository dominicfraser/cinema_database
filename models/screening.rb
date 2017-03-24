require_relative('../db/Sql_runner')

class Screening

  attr_reader :id

  def initialize(screening_hash)
    @id = screening_hash['id'].to_i
    @show_date = screening_hash['show_date']
    @film_id = screening_hash['film_id'].to_i
    @amount_tickets = screening_hash['amount_tickets'].to_i
  end

  ###CRUD INSTANCE

  def save()
    sql = "INSERT INTO screenings
     (show_date, film_id, amount_tickets)
      VALUES 
      ('#{@show_date}', #{@film_id}, #{@amount_tickets}) 
      RETURNING *"
    screening = SqlRunner.run(sql).first
    @id = screening['id'].to_i
  end

  ### CLASS METHODS
  def self.all()
    sql = "SELECT * FROM screenings"
    return Screening.map_screenings(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

    ##helper
  def self.map_screenings(sql)
    screenings = SqlRunner.run(sql)
    return result = screenings.map { |screning| Screening.new(screning)}
  end

end