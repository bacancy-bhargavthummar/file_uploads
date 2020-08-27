class Document < ApplicationRecord
  belongs_to :profile

  mount_uploader :docs, PictureUploader
  validates_integrity_of :docs
  serialize :docs

end
