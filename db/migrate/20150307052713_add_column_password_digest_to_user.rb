class AddColumnPasswordDigestToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string, after: 'password'
  end
end
