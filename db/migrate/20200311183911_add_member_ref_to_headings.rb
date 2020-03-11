class AddMemberRefToHeadings < ActiveRecord::Migration[6.0]
  def change
    add_reference :headings, :member, null: false, foreign_key: true
  end
end
