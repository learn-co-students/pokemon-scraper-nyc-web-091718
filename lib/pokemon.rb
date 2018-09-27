require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, database_connection)
      result = database_connection.execute("SELECT * FROM pokemon WHERE id = (?)", id_num).first()

      self.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: database_connection)
  end

  def alter_hp(hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
  end



end
