require_relative('../db/Sql_runner')

class Film

  attr_reader :id

  def initialize(film_hash)
    @id = film_hash['id'].to_i
    @title = film_hash['title']
  end

  ###CRUD INSTANCE

  def save()
    sql = "INSERT INTO films (title) VALUES ('#{@title}') RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title) = ('#{@title}') WHERE id = #{@id} "
    SqlRunner.run(sql)
  end

  ### CLASS METHODS
  def self.all()
    sql = "SELECT * FROM films"
    return Film.map_films(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

    ##helper
  def self.map_films(sql)
    films = SqlRunner.run(sql)
    return result = films.map { |film| Film.new(film)}
  end


end