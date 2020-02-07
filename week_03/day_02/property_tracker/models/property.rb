require('pg')

class Property

  attr_accessor :address, :address, :value, :bedrooms, :year_built
  attr_reader :id

  def initialize(options)  
    @address = options['address']
    @value = options['value'].to_i
    @bedrooms = options['bedrooms'].to_i
    @year_built = options['year_built'].to_i
    @id = options['id']
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO properties (address, value, bedrooms, year_built)
          VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@address, @value, @bedrooms, @year_built]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "UPDATE properties SET (address, value, bedrooms, year_built)
          = ($1, $2, $3, $4) WHERE id = $5"
    values = [@address, @value, @bedrooms, @year_built, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM properties;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete_one()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM properties WHERE id = $1"
    values = [@id]
    db.prepare('delete_one', sql)
    db.exec_prepared('delete_one', values)
    db.close()
  end

  def Property.find(id)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE id=$1"
    values = [id]
    db.prepare('find', sql)
    result = db.exec_prepared('find', values)
    db.close()
    return Property.new(result.first)
  end

  def Property.find_by_address(address)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE address=$1"
    values = [address]
    db.prepare('find_by_address', sql)
    result = db.exec_prepared('find_by_address', values)
    db.close()
    if result.first != nil
      return Property.new(result.first)
    else
      return nil
    end

  end


end
