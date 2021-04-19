require 'rails_helper'

RSpec.describe "quizzes/index", type: :view do
  before(:each) do
    assign(:quizzes, [
      Quiz.create!(),
      Quiz.create!()
    ])
  end

  it "renders a list of quizzes" do
    render
  end
end
