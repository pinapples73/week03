require('pg')
require_relative('../db/sql_runner')

class PizzaOrder

  attr_accessor :topping, :quantity
  attr_reader :id, :customer_id

  def initialize(options)
    @topping = options['topping']
    @quantity = options['quantity'].to_i
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO pizza_orders
    (
      topping,
      quantity,
      customer_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @customer_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i

  end

  def update()
    db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
    sql = "
    UPDATE pizza_orders SET (
      topping,
      quantity,
      customer_id
    ) =
    (
      $1,$2, $3
    )
    WHERE id = $4"
    values = [@first_name, @last_name, @customer_id, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    sql = "DELETE FROM pizza_orders where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM pizza_orders WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    order_hash = results.first
    order = PizzaOrder.new(order_hash)
    return order
  end


  def self.delete_all()
    sql = "DELETE FROM pizza_orders"
    result = SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM pizza_orders;"
    orders = SqlRunner.run(sql)
    return orders.map{|order| PizzaOrder.new(order)}
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    customer_data = results[0]
    customer = Customer.new(customer_data)
    return customer
  end

end
