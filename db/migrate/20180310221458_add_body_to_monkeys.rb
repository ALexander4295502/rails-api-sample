class AddBodyToMonkeys < ActiveRecord::Migration[5.0]
  def change
    add_column :monkeys, :body, :text
  end
end
