class ChangeContenttoBlabber < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.rename :content, :blabber
  	end
  end
end
