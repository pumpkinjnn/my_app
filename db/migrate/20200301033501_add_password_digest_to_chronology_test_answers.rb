class AddPasswordDigestToChronologyTestAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :chronology_test_answers, :password_digest, :string
  end
end
