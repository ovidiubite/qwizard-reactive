class LeaderBoard::Component < ApplicationViewComponent
  option :score
  option :current_player_id

  option :hide_to_three, default: proc { false }

  def highlighted?(player_id)
    return false if current_player_id.nil?

    current_player_id == player_id
  end

  def scores
    hide_to_three ? score.slice(3, score.length) : score
  end
end
