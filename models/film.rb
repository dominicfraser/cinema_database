require_relative('../db/Sql_runner')

class Film

  attr_reader :id

  def initialize(film_hash)
    @id = film_hash['id'].to_i
    @title = film_hash['title']
  end

  def save()
    sql = "INSERT INTO films (title) VALUES ('#{@title}') RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end



end