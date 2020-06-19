class CreateUser < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :username, unique: true
      t.string :digest_password
    end
    execute " INSERT INTO USERS (USERNAME, DIGEST_PASSWORD) VALUES ('admin', '#{Digest::SHA1.hexdigest("admin123")}') "
  end

  def down
    drop_table :users
  end
end
