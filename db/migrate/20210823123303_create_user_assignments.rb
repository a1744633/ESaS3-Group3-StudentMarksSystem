class CreateUserAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_assignments do |t|
      t.string :studentid
      t.timestamps
    end
  end
end
