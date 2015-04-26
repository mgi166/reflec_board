class ChangeColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :name, :username
      t.column :crypted_password, :string, null: false, after: :email
      t.column :password_salt, :string, null: false, after: :crypted_password
      t.column :persistence_token, :string, null: false, after: :password_salt

      t.column :login_count, :integer, null: false, default: 0, after: :persistence_token
      t.column :failed_login_count, :integer, null: false, default: 0, after: :login_count
      t.column :current_login_at, :datetime, after: :failed_login_count
      t.column :last_login_at, :datetime, after: :current_login_at

      t.remove :password
      t.remove :password_digest
    end
  end
end
