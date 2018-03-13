if User.count == 0
  gambit     = User.create!(name: 'Gambit')
  rogue      = User.create!(name: 'Rogue')
  _wolverine = User.create!(name: 'Wolverine')
  _jean      = User.create!(name: 'Jean Grey')
  _cyclops   = User.create!(name: 'Cyclops')
  _storm     = User.create!(name: 'Storm')

  Article.create!(user: gambit, title: 'How to throw cards?', published_at: Date.new(2018, 2, 15))
  Article.create!(user: gambit, title: 'Kinetic conversion and acceleration theory', published_at: nil)
  Article.create!(user: rogue, title: 'Dying hair', published_at: Date.new(2018, 3, 1))
end

MatUserArticleStat.refresh