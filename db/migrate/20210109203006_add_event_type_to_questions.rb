class AddEventTypeToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :event_type, :integer
  end
end
