class Document < ApplicationRecord
  belongs_to :profile

  mount_uploaders :docs, PictureUploader
  validates_integrity_of :docs
  serialize :docs

  validates :profile_id, uniqueness: true

end
