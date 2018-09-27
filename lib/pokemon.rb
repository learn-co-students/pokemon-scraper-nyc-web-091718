class Pokemon
  attr_accessor :id , :name, :type, :hp, :db

  def initialize(id:,name:,type:,db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db  = db
    @hp = hp
  end

  def self.save(name_in,type_in,db)
    db.execute("INSERT INTO pokemon(name,type) VALUES (?,?);",name_in,type_in)
  end

  def self.find(id,db)
    temp = db.execute("SELECT * FROM pokemon WHERE id = #{id} LIMIT 1;")
    Pokemon.new(id: temp[0][0],name: temp[0][1], type: temp[0][2], db: db,hp:temp[0][3])
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{@id} LIMIT 1;")
    @hp = db.execute("SELECT hp FROM pokemon WHERE id = #{@id} LIMIT 1;").flatten[0]
  end

  

end
