class AddContentsSummaryToVideo < ActiveRecord::Migration
  def change
    add_column :downloads, :contents_summary, :text
  end
end
