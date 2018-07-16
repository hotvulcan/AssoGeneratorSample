class CreateUserSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :user_schools do |t|
      t.references :User, foreign_key: true
      t.references :School, foreign_key: true

      t.timestamps
    end
  end
end
