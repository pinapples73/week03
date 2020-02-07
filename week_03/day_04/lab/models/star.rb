# frozen_string_literal: true

require_relative('../db/sql_runner')

class Star
  attr_accessor :id, :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    sql = "INSERT INTO stars (first_name, last_name) VALUES ($1,$2)
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update
    sql = 'UPDATE stars SET (first_name,last_name) = ($1, $2) WHERE id = $3'
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM stars WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
