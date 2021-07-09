class Answers::Component < ApplicationViewComponent
  option :lobby
  option :current_player_id
  option :answers

  def players
    @players ||= lobby.players
  end

  def correct(answer)
    answer.is_correct
  end

  def state(answer)
    return false unless finalised

    answer.is_correct || active(answer.id)
  end

  def finalised
    player_answers.any? do |pa|
      pa.answer.question.order == lobby.current_question_index
    end
  end

  def active(answer_id)
    player_answers.any? do |pa|
      pa.answer.question.order == lobby.current_question_index && pa.answer.id == answer_id
    end
  end

  def player
    @player ||= players.find_by(id: current_player_id)
  end

  def player_answers
    @player_answers ||= player.player_answers
  end
end
