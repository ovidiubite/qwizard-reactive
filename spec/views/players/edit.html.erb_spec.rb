require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      name: "MyString",
      hat: 1
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input[name=?]", "player[name]"

      assert_select "input[name=?]", "player[hat]"
    end
  end
end
