require 'rails_helper'

RSpec.describe "lobbies/show", type: :view do
  before(:each) do
    @lobby = assign(:lobby, Lobby.create!(
      code: "Code",
      status: 2,
      current_question_index: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
