class CreateUtxo < ActiveRecord::Migration[6.1]
  def change
    create_table :glueby_utxos do |t|
      t.string     :txid
      t.integer    :index
      t.bigint     :value
      t.string     :script_pubkey
      t.string     :label, index: true
      t.integer    :status
      t.belongs_to :key, null: true
      t.timestamps
    end

    add_index :glueby_utxos, [:txid, :index], unique: true
  end
end
