class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :project, index: true, foreign_key: true
      t.belongs_to :reward, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
