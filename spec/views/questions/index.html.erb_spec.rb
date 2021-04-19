require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        title: "Title",
        time_limit: 2,
        points: 3,
        answer_type: 4,
        order: 5
      ),
      Question.create!(
        title: "Title",
        time_limit: 2,
        points: 3,
        answer_type: 4,
        order: 5
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
  end
end
