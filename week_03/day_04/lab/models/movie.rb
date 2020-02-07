# frozen_string_literal: true

require_relative('../db/sql_runner')

class Movie
  attr_accessor :id, :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save
    sql = "INSERT INTO movies (title,genre,budget) VALUES ($1,$2,$3)
    RETURNING id"
    values = [@title, @genre, @budget]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete
    sql = 'DELETE FROM movies WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stars
    sql = "SELECT stars.* FROM stars
    INNER JOIN  castings ON castings.star_id = stars.id
    WHERE castings.movie_id = $1"
    values = [@id]
    star_data = SqlRunner.run(sql, values)
    results = star_data.map { |star| Star.new(star) }
  end

  def castings
    sql = 'SELECT * FROM castings WHERE movie_id = $1'
    values = [@id]
    casting_data = SqlRunner.run(sql, values)
    casting = casting_data.map { |castings| Casting.new(castings) }
    casting
  end

  def remaining_budget
    sql = "SELECT castings.* FROM movies
    INNER JOIN castings ON movies.id = castings.movie_id
    WHERE castings.movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    adjusted_budget = @budget
    result.each { |row| adjusted_budget -= row['fee'].to_i }
    adjusted_budget
  end

  def remaining_budget2
    castings = self.castings()
    castings_fees = castings.map(&:fee)
    combined_fees = castings_fees.sum
    @budget - combined_fees
  end

  def self.all
    sql = 'SELECT * FROM movies'
    movie_data = SqlRunner.run(sql)
    result = movie_data.map { |movie| Movie.new(movie) }
    result
  end
end
