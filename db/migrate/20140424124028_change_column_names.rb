class ChangeColumnNames < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.rename :name, :URL
  		t.rename :content, :summary
  	end
  end
end
