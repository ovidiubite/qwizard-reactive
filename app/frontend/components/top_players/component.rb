class TopPlayers::Component < ApplicationViewComponent
  option :score

  FRAMES = {
    0 => "Red",
    1 => "Blue",
    2 => "Green"
  }
end
