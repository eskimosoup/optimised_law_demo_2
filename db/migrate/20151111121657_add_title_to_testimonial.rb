class AddTitleToTestimonial < ActiveRecord::Migration
  def change
    add_column :testimonials, :testimonial_type, :string, default: 'client'
  end
end
