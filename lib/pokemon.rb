class Pokemon
  attr_reader :id, :name, :type, :db

  @@all = []

  def self.all
    @@all
  end

  def self.find(id, db)
    # binding.pry
    pokemon = db.execute("SELECT * FROM pokemon WHERE id is (?)", id)[0]
    # binding.pry
    id = pokemon[0]
    name = pokemon[1]
    type = pokemon[2]
    Pokemon.new(id: id, name: name, type: type, db: db)
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
  end

  def initialize(id: , name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

    self.class.all << self
  end
end
