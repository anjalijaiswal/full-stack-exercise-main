class CreateStatusHistory < ActiveRecord::Migration[7.0]
  def change
    create_table :status_history do |t|
      t.references :applicant, null: false, foreign_key: true
      t.text :comment
      t.integer :previous_status
      t.integer :current_status

      t.timestamps
    end
  end
end
