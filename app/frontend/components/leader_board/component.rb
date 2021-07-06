class LeaderBoard::Component < ApplicationViewComponent
  param :score
  param :current_player

  option :hide_to_three, default: proc { false }

  def highlighted?(player_id)
    return false if current_player.nil?

    current_player.id === player_id
  end

  def scores
    hide_to_three ? score.slice(3, score.length) : score
  end
end
