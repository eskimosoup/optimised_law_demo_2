class CreateServiceRelatedServices < ActiveRecord::Migration
  def change
    create_table :service_related_services do |t|
      t.belongs_to :service, index: true, foreign_key: true
      t.belongs_to :related_service, index: true
      t.integer :position

      t.timestamps null: false
    end
    add_foreign_key :service_related_services, :services, column: :related_service_id
  end
end
