class AddCreatorAttributeToNote < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :creator, :integer
  end
end
