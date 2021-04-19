require 'rails_helper'

RSpec.describe "lobbies/index", type: :view do
  before(:each) do
    assign(:lobbies, [
      Lobby.create!(
        code: "Code",
        status: 2,
        current_question_index: 3
      ),
      Lobby.create!(
        code: "Code",
        status: 2,
        current_question_index: 3
      )
    ])
  end

  it "renders a list of lobbies" do
    render
    assert_select "tr>td", text: "Code".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
