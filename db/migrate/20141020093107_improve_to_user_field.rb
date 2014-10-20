class ImproveToUserField < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :github, :string
    add_column :users, :skill, :text
    add_column :users, :work_experience, :text
       
  end
end
