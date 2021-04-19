require 'rails_helper'

RSpec.describe "lobbies/new", type: :view do
  before(:each) do
    assign(:lobby, Lobby.new(
      code: "MyString",
      status: 1,
      current_question_index: 1
    ))
  end

  it "renders new lobby form" do
    render

    assert_select "form[action=?][method=?]", lobbies_path, "post" do

      assert_select "input[name=?]", "lobby[code]"

      assert_select "input[name=?]", "lobby[status]"

      assert_select "input[name=?]", "lobby[current_question_index]"
    end
  end
end
