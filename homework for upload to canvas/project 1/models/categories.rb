class Category

  attr_reader(:id, :type)

  require_relative('../db/sql_runner.rb')

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save
    sql = 'INSERT INTO categories(type) VALUES ($1) RETURNING *'
    values = [@type]
    returned_data = SqlRunner.run(sql, values)
    @id = returned_data[0]['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM categories'
    SqlRunner.run(sql)
  end

  def self.show_all
    sql = 'SELECT * FROM categories ORDER BY type'
    cat_data = SqlRunner.run(sql)
    cat_data.map {|cat| Category.new(cat)}
  end


end
