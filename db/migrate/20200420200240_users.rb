class Users < ActiveRecord::Migration[6.0]
  create_table :users do |t|
    t.string :email
    t.string :password_digest
    t.string :api_key

    t.timestamps
  end
end
