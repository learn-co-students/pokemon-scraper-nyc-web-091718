class Pokemon
  attr_accessor :id,:name,:type, :db,:hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
  end

  def self.save(name,type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id IS ? LIMIT 1", id).flatten
    Pokemon.new(id:id,name:poke[1],type:poke[2],db:db)
  end

end
