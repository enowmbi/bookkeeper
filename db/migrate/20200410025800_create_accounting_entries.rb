class CreateAccountingEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :accounting_entries do |t|
      t.date :date_prepared
      t.date :date_posted
      t.text :memo

      t.timestamps
    end
  end
end
