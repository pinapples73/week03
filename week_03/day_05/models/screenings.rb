# frozen_string_literal: true

require_relative('../db/sql_runner.rb')

class Screening
  attr_reader :s_id, :film_time, :tickets_left

  def initialize(options)
    @s_id = options['s_id'].to_i if options['s_id']
    @film_time = options['film_time']
    @tickets_left = options['tickets_left'].to_i
  end

  def save
    sql = 'INSERT INTO screenings (film_time, tickets_left) VALUES ($1, $2) RETURNING *'
    values = [@film_time, @tickets_left]
    returned_data = SqlRunner.run(sql, values)
    @s_id = returned_data[0]['s_id'].to_i
  end

  def self.return_ticket_amount(screening_id)
    sql = 'SELECT screenings.tickets_left FROM screenings
    WHERE s_id = $1'
    values = [screening_id]
    ticket_data = SqlRunner.run(sql, values)
    available_tickets = ticket_data[0]['tickets_left'].to_i
    available_tickets
  end

  def self.update_tickets_left(available_tickets, screening_id)
    sql = 'UPDATE screenings SET tickets_left = $1
    WHERE s_id = $2'
    values = [available_tickets, screening_id]
    SqlRunner.run(sql, values)
  end
end
