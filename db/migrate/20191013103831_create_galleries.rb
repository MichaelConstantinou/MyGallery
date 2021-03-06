# frozen_string_literal: true

class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :cover_image

      t.timestamps
    end
  end
end
