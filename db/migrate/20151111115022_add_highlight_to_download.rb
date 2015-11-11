class AddHighlightToDownload < ActiveRecord::Migration
  def change
    add_column :downloads, :highlight, :boolean
  end
end
