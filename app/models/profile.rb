class Profile < ApplicationRecord

  has_many :documents, dependent: :destroy

  mount_uploaders :picture, PictureUploader
  validates_integrity_of :picture
  serialize :picture

  validates :name, presence: true
end
