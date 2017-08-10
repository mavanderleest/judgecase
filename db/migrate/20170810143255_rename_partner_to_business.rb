class RenamePartnerToBusiness < ActiveRecord::Migration[5.0]
  def change
    rename_table :partners, :businesses
  end
end
