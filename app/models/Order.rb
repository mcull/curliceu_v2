class Order
    include Dynamoid::Document

    table :name => :orders, :key => :id, :read_capacity => 400, :write_capacity => 400

    field :id
    field :order_date, :datetime
    field :amount, :integer
    field :text
    field :font
    field :material
    field :cardBrand
    field :last4
    field :billName
    field :billAddress1
    field :billAddress2
    field :billCity
    field :billState
    field :billZip
    field :shippingMethod
    field :shipName
    field :shipAddress1
    field :shipAddress2
    field :shipCity
    field :shipState
    field :shipZip
    field :customer_email
    field :customer_sms
end
