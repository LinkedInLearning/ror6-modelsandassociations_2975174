class CreatePageAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :page_assignments do |t|
      t.references :page, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.timestamps
      t.index [:page_id, :user_id]
      t.index [:user_id, :page_id]
    end
  end
end
