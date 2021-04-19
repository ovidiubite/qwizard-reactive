require 'rails_helper'

RSpec.describe "lobbies/edit", type: :view do
  before(:each) do
    @lobby = assign(:lobby, Lobby.create!(
      code: "MyString",
      status: 1,
      current_question_index: 1
    ))
  end

  it "renders the edit lobby form" do
    render

    assert_select "form[action=?][method=?]", lobby_path(@lobby), "post" do

      assert_select "input[name=?]", "lobby[code]"

      assert_select "input[name=?]", "lobby[status]"

      assert_select "input[name=?]", "lobby[current_question_index]"
    end
  end
end
