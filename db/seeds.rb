require 'faker'

5.times do 
  Email.create(object: Faker::JapaneseMedia::OnePiece.character, body: Faker::JapaneseMedia::OnePiece.quote) #=> "ONE PIECE IS REAL!")
end