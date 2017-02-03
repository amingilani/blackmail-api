class ChangeNameToFullnameInOrganization < ActiveRecord::Migration[5.0]
  def change
    rename_column :organizations, :name, :full_name
  end
end
