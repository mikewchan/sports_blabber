class ChangePostColumnNames < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.rename :summary, :content
  	end
  end
end
