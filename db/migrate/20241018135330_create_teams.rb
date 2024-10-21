# frozen_string_literal: true

# db/migrate/20241018135330_create_teams.rb
class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps
    end
  end
end
