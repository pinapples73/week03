# frozen_string_literal: true

require_relative('../db/sql_runner.rb')

class Ticket
  attr_accessor :t_id, :customer_id, :film_id

  def initialize(options)
    @t_id = options['t_id'].to_i if options['t_id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save
    sql = 'INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING *'
    values = [@customer_id, @film_id]
    returned_data = SqlRunner.run(sql, values)
    @t_id = returned_data[0]['t_id'].to_i
  end

  def update
    sql = 'UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3'
    values = [@customer_id, @film_id, @t_id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM tickets WHERE id = $1'
    values = [@t_id]
    sql_runner.run(sql, values)
  end

  def self.show_tickets
    sql = 'SELECT * FROM tickets'
    results = SqlRunner.run(sql)
    results.map { |ticket_data| Ticket.new(ticket_data) }
  end
end
