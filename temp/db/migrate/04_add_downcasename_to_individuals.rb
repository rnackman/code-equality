class AddDowncasenameToIndividuals < ActiveRecord::Migration

  def change
    add_column  :individuals, :downcasename,  :string
  end

end
