require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      title: "MyString",
      time_limit: 1,
      points: 1,
      answer_type: 1,
      order: 1
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[title]"

      assert_select "input[name=?]", "question[time_limit]"

      assert_select "input[name=?]", "question[points]"

      assert_select "input[name=?]", "question[answer_type]"

      assert_select "input[name=?]", "question[order]"
    end
  end
end
