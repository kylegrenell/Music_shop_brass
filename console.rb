require_relative('./models/music_shop')
require_relative('./models/instrument')
require('pry-byebug')

berties = MusicShop.new({'name' => "Berties Brass", 'address' => "1 George Street, Edinburgh", 'type' => "Brass"})

berties.save()



trumpet = Instrument.new({'type' => "trumpet", 'music_shop_id' => berties.id})
bugle = Instrument.new({'type' => "bugle", 'music_shop_id' => berties.id})



binding.pry
nil



