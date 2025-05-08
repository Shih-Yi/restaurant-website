class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :intro_image
      t.string :menu_image

      t.timestamps
    end
  end
end
