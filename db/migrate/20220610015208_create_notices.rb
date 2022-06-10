class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string   :title
      t.text     :text
      t.datetime :start_at
      t.datetime :end_at
      t.boolean  :published,    :default => false
      t.timestamps
    end
  end
end
