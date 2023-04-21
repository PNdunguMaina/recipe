class CreateRecips < ActiveRecord::Migration[7.0]
  def change
    create_table :recips do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.text :description
      t.boolean :public, default:false

      t.timestamps
    end
  end
end
