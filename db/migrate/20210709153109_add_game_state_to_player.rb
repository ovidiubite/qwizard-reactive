class AddGameStateToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :game_state, :string
  end
end
