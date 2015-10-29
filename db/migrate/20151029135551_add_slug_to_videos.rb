class AddSlugToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :slug, :string
    add_column :videos, :suggested_url, :string
  end
end
