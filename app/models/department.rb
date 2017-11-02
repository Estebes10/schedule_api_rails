class Department < ApplicationRecord

  # Associations
  belongs_to :campu

  has_many :careers

  # validate attributes
  validates :name,
    presence:   true,
    length:     { maximum: 128 },
    uniqueness: true

  validates :code,
    presence:   true,
    length:     { maximum: 32 },
    uniqueness: true

  validates :description,
    length: { maximum: 512 }

  validates :status,
    inclusion: { in: [true, false] }

end
