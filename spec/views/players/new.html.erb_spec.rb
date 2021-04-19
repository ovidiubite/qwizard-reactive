require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      name: "MyString",
      hat: 1
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input[name=?]", "player[name]"

      assert_select "input[name=?]", "player[hat]"
    end
  end
end
