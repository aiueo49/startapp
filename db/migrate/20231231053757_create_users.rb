class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :body
      t.string :avatar

      t.timestamps
    end
  end
end
