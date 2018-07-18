class Attribute < ApplicationRecord

  #attributes
  validates :name,
    presence:   true,
    length:     { maximum: 64 },
    uniqueness: true

  validates :code,
    presence:   true,
    length:     { maximum: 8 },
    uniqueness: true

  validates :description,
    length: { maximum: 1024 }

  validates :status,
    presence:  true,
    inclusion: { in: [true, false] }

end
