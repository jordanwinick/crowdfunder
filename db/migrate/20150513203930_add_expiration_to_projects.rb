class AddExpirationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :expired, :boolean, :default => false
  end
end
