class RemoveColumnsFromCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :courseid, :string
  end
end
