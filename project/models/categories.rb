class Category

  attr_reader(:id, :type)

  require_relative('../db/sql_runner.rb')

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end
  
  # create a method that will save a category object to a -
  # database table called catergories
  def save
    #create sql to be passed to be run by the sql SqlRunner
    #the sql should insert into the categories table
    # and return all values from the row once the item has been inserted
    # this will also provide us with an unique ID for the user
    sql = 'INSERT INTO categories(type) VALUES ($1) RETURNING *'
    #create a values variable to be used in conjunction with the above SQL to pass in an object type
    values = [@type]
    #pass the sql created above into sql runner and save the results to a variable
    returned_data = SqlRunner.run(sql, values)
    #get the id value created during the insert and assign it to @id to be used within the application
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
