class RemoveTeamFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :team_id, :integer
  end
end
