class AddIndividualsToTweets < ActiveRecord::Migration

  def change
    add_column  :tweets, :individual_id,  :integer
  end

end
