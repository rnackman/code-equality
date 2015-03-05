class CreateTweets < ActiveRecord::Migration

  def change
    create_table  :tweets do |t|
      t.string    :html
    end
  end

end
