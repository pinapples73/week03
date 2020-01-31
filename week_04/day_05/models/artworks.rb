class Artwork

  attr_reader(:id, :title, :details, :date_created, :artist_id)

  require_relative('../db/sql_runner.rb')

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @details = options['details']
    @date_created = options['date_created']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = 'INSERT INTO artworks (title, details, date_created, artist_id) VALUES ($1, $2, $3, $4) RETURNING *'
    values = [@title, @details, @date_created, @artist_id]
    returned_data = SqlRunner.run(sql, values)
    @id = returned_data[0]['id'].to_i
  end

  def self.delete(id)
    sql = 'DELETE FROM artworks WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM artworks'
    SqlRunner.run(sql)
  end

  def self.show_all
    sql = 'SELECT * FROM artworks'
    artworks_data = SqlRunner.run(sql)
    return artworks_data.map { |artwork| Artwork.new(artwork) }
  end

  def self.find( id )
    sql = "SELECT * FROM artworks
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Artwork.new( results.first )
  end

  def self.delete_by_artist(id)
    sql = "DELETE FROM artworks WHERE artist_id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
