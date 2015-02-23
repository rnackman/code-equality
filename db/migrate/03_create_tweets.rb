class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.belongs_to :individual, index: true
    end
  end
end