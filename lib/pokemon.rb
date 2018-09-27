class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ? )", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon where id = ?", id)[0]
    Pokemon.new(id:row[0], name:row[1], type:row[2], db:db)
  end

  # The find method creates a new Pokemon after selecting their row from the database by their id number.
end
