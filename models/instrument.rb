require_relative('../db/sql_runner')

class Instrument 

  attr_reader :id, :type, :music_shop_id

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @music_shop_id = options['music_shop_id'].to_i
  end

  def save()
    sql = "INSERT INTO instruments (type, music_shop_id) VALUES ('#{@type}', '#{@music_shop_id}') RETURNING *"
    instrument = SqlRunner.run(sql).first
    @id = instrument['id']
  end

  def music_shop()
    sql = "SELECT * FROM music_shops WHERE id = #{music_shop_id}"
    music_shop = SqlRunner.run(sql).first
    return MusicShop.new(music_shop)
  end

  def delete()
    sql = "DELETE FROM instruments WHERE id = #{@id}"
    SqlRunner.run( sql )
  end


end