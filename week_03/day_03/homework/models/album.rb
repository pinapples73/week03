require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3)
    RETURNING *"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.display_all()
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    return result.map{|record| Album.new(record)}
  end

  def self.by_artist(artist_name)
    sql = "SELECT id FROM artists WHERE artist_name = $1"
    values = [artist_name]
    artist_results = SqlRunner.run(sql, values)
    artist_id = artist_results[0]['id'].to_i

    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    results = SqlRunner.run(sql, values)
    return results.map{|record| Album.new(record)}
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3)
          WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    pg_results = SqlRunner.run(sql, values)
    return pg_results[0]
  end

end
