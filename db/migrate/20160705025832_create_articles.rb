class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      # creates two colums inside our table named "created at" and "updated_at"
      # Rails manages these for us
      t.timestamps
    end
  end
end
