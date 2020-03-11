class AddTitleRefToHeadings < ActiveRecord::Migration[6.0]
  def change
    add_column :headings, :title, :text
  end
end
