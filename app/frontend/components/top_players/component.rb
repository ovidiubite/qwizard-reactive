class TopPlayers::Component < ApplicationViewComponent
  param :score

  FRAMES = {
    0 => "Red",
    1 => "Blue",
    2 => "Green"
  }
end
