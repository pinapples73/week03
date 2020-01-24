# frozen_string_literal: true

require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :c_id, :name, :funds

  def initialize(options)
    @c_id = options['c_id'].to_i if options['c_id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save
    sql = 'INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING *'
    values = [@name, @funds]
    returned_data = SqlRunner.run(sql, values)
    @c_id = returned_data[0]['c_id'].to_i
  end

  def by_film
    sql = "SELECT * FROM films
    INNER JOIN tickets ON films.f_id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@c_id]
    returned_data = SqlRunner.run(sql, values)
    returned_data.map { |film_data| Film.new(film_data) }
  end
end
