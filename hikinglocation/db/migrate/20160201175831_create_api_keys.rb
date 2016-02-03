class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :value
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
