require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO
      pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    poke_row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    #binding.pry
    Pokemon.new(id: poke_row[0], name: poke_row[1], type: poke_row[2], db: db)
  end

end
