require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(db, hp = nil)
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp

    @@all << self
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id) 
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute "SELECT * FROM pokemon WHERE id = (?)",id
    poke = poke[0]

    new_poke = Pokemon.new(db, hp = 60)

    new_poke.id = poke[0]
    new_poke.name = poke[1]
    new_poke.type = poke[2]
    new_poke.hp = poke[3]

    new_poke
  end

  def self.create_hp_column(db)
    db.execute "ALTER TABLE pokemon ADD hp integer = 60"
  end


end ### End of Pokemon Class
