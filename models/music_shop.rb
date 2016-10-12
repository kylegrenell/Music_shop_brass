require_relative('../db/sql_runner')

class MusicShop

  attr_reader :id
  attr_accessor :name, :address, :type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO music_shops (name, address, type) VALUES ('#{@name}', '#{@address}','#{@type}') RETURNING *"
    music_shop = SqlRunner.run( sql ).first
    @id = music_shop['id']
  end

  def instruments()
    sql = "SELECT * FROM instruments WHERE music_shop_id = #{@id}"
    instruments = SqlRunner.run(sql).map {|instrument| Instrument.new(instrument)}
    return instruments
  end

  def self.find(id)
    sql = "SELECT * FROM music_shops WHERE id = #{id}"
    music_shop = SqlRunner.run( sql ).first
    return MusicShop.new(music_shop)
  end

  def edit()
    sql = "UPDATE music_shops SET
          name = '#{@name}',
          address = '#{@address}',
          type = '#{@type}' WHERE
          id = #{@id}"
    SqlRunner.run ( sql )
  end 

end