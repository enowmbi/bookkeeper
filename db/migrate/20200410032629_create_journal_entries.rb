class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.decimal :amount
      t.string :post_type
      t.references :account, null: false, foreign_key: true
      t.references :accounting_entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
