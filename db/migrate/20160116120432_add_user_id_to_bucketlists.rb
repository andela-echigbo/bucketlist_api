class AddUserIdToBucketlists < ActiveRecord::Migration
  def change
    add_reference :bucketlists, :user, index: true
  end
end
