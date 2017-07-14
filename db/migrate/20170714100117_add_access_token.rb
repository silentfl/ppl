class AddAccessToken < ActiveRecord::Migration[5.1]
  def change
    add_column :gateways, :access_token, :string, index: true
  end
end
