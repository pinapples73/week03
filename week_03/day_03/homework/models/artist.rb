require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :artist_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_name = options['artist_name']
  end

  def save()
    sql = "INSERT INTO artists (artist_name)
    VALUES ($1)
    RETURNING *"
    values = [@artist_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.display_all()
    sql = "SELECT * FROM artists"
    pg_result = SqlRunner.run(sql)
    return pg_result.map{|person| Artist.new(person)}
  end

  def self.by_album(album_title)
    sql = "SELECT * FROM albums WHERE title = $1"
    values = [album_title]
    pg_result = SqlRunner.run(sql, values)
    artist_id = pg_result[0]['artist_id'].to_i

    sql = "SELECT * FROM artists WHERE id = $1"
    values = [artist_id]
    pg_result = SqlRunner.run(sql, values)
    # return pg_result.map{|person| Artist.new(person)}
    artist_hash =  pg_result.first()
    return Artist.new(artist_hash)
  end

  def update()
    sql = "UPDATE artists SET artist_name = $1 WHERE id = $2"
    values = [@artist_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    pg_results = SqlRunner.run(sql, values)
    return pg_results[0]
  end

end
