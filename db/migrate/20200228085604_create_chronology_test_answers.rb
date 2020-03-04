class CreateChronologyTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :chronology_test_answers do |t|
      t.string :name
      t.string :answer

      t.timestamps
    end
  end
end
