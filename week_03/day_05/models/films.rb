# frozen_string_literal: true

require_relative('../db/sql_runner.rb')

class Film
  attr_reader :f_id, :title, :price

  def initialize(options)
    @f_id = options['f_id'].to_i if options['f_id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = 'INSERT INTO films (title, price) VALUES ($1, $2) RETURNING *'
    values = [@title, @price]
    returned_data = SqlRunner.run(sql, values)
    @f_id = returned_data[0]['f_id'].to_i
  end

  def show_customers
    sql = 'SELECT * FROM customers
    INNER JOIN tickets ON customers.c_id = tickets.customer_id
    WHERE tickets.film_id = $1'
    values = [@f_id]
    returned_data = SqlRunner.run(sql, values)
    returned_data.map { |customer_data| Customer.new(customer_data) }
  end

  def number_of_customers
    sql = "SELECT COUNT(tickets.t_id) FROM tickets
    INNER JOIN films ON films.f_id = tickets.film_id
    WHERE tickets.film_id = $1"
    values = [@f_id]
    returned_data = SqlRunner.run(sql, values)
    returned_data[0]['count'].to_i
  end
end
