class CreateWebsiteVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :website_visits do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.datetime :visit_time

      t.timestamps
    end
  end
end
