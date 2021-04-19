require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      title: "MyString",
      is_correct: false
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input[name=?]", "answer[title]"

      assert_select "input[name=?]", "answer[is_correct]"
    end
  end
end
