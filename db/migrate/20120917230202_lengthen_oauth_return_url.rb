class LengthenOauthReturnUrl < ActiveRecord::Migration[4.2]
  tag :predeploy

  def self.up
    change_column :oauth_requests, :return_url, :string, :limit => 4.kilobytes
  end

  def self.down
    change_column :oauth_requests, :return_url, :string, :limit => 255
  end
end
