require 'rails_helper'

RSpec.describe "quizzes/show", type: :view do
  before(:each) do
    @quiz = assign(:quiz, Quiz.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
