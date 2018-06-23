class CreateDarkLords < ActiveRecord::Migration[5.2]
  def change
    create_table :dark_lords do |t|
      t.string :name

      t.timestamps
    end
  end
end
