class ChangeNameOfBodyColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :body, :question_body
    rename_column :answers, :body, :answer_body
  end
end
