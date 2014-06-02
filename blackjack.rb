FACE_CARDS = ["J", "Q", "K"]

def hand_value(cards)
  # Move any aces to the end so we can easily grab the suitable value for them:
  numbers = cards.find_all{ |c| c.to_i != 0 }
  faces = (cards - numbers).sort.reverse

  (numbers + faces).inject(0) do |total, c|
    if c == "A"
      total += total <= 10 ? 11 : 1
    elsif FACE_CARDS.include? c
      total += 10
    else
      total += c.to_i
    end
  end
end