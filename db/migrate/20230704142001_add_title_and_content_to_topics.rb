class AddTitleAndContentToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :title, :string
    add_column :topics, :content, :text
  end
end
