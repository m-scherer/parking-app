class Seed

  def self.start
    seed = Seed.new
    seed.blake_lot
    seed.union_station
    seed.coors_field
    seed.capitol
    seed.cheesman
  end

  def blake_lot
    create_spots(
      Lot.create!(
        name: 'Blake Street Lot',
        lat: 39.7496354,
        long: -105.0001058
      )
    )
    puts "Created blake lot"
  end

  def union_station
    create_spots(
      Lot.create!(
        name: 'Union Station Lot',
        lat: 39.7511873,
        long: -105.0031571
      )
    )
    puts "Created union station lot"
  end

  def coors_field
    create_spots(
      Lot.create!(
        name: 'Coors Field Lot',
        lat: 39.7485147,
        long: -104.9963336
      )
    )
    puts "Created coors field lot"
  end

  def capitol
    create_spots(
      Lot.create!(
        name: 'State Capitol Lot',
        lat: 39.7466999,
        long: -104.9878364
      )
    )
    puts "Created capitol lot"
  end

  def cheesman
    create_spots(
      Lot.create!(
        name: 'Cheesman Lot',
        lat: 39.7345036,
        long: -104.9748398
      )
    )
    puts "Created cheesman lot"
  end

  def create_spots(lot)
    10.times do |n|
      Spot.create!(
      lot: lot,
      number: n
      )
      puts "Created spot for #{lot.name}"
    end
  end

Seed.start

end
