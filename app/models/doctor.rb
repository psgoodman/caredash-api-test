class Doctor < ActiveRecord::Base
    has_many :reviews

    validates :name, presence: true

    default_scope { includes(:reviews) }
end