class Artist

  attr_reader(:id, :first_name, :last_name)

  require_relative('../db/sql_runner.rb')

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    sql = 'INSERT INTO artists (first_name, last_name) VALUES ($1, $2) RETURNING *'
    values = [@first_name, @last_name]
    returned_data = SqlRunner.run(sql, values)
    @id = returned_data[0]['id'].to_i
  end

  def delete
    sql = 'DELETE FROM artists WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM artists'
    SqlRunner.run(sql)
  end

  def self.show_all
    sql = 'SELECT * FROM artists'
    artist_data = SqlRunner.run(sql)
    artist_data.map {|artist| Artist.new(artist)}
  end

  def self.find( id )
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Artist.new( results.first )
  end

  
end
