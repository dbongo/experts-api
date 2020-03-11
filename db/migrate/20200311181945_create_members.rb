class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.text :long_url
      t.text :short_url

      t.timestamps
    end
  end
end
