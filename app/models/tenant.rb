class Tenant < ApplicationRecord
    has_many :apartments, through: :leases
    has_many :leases 

    validates :name, presence: true
    validates :age, numericality: {greater_than: 17}
end
