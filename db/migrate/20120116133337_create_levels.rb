class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.string :levelname
      t.string :levelcreator
      t.binary :xml

      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
