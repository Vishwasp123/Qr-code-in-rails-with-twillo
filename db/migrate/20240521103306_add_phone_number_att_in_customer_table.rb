class AddPhoneNumberAttInCustomerTable < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :phone_number, :integer
  end
end
