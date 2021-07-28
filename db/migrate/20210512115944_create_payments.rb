class CreatePayments< ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :spend
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
