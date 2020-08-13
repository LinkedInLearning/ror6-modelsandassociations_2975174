class Page < ApplicationRecord

  belongs_to :subject

  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order(:position) }

  validates :name, :presence => true, :length => {:maximum => 50}

  validates_presence_of :position
  validates_numericality_of :position, :greater_than => 0

  validates :permalink,
    :presence => true,
    :length => {:maximum => 50},
    :uniqueness => true,
    :format => { :with => /\A\w+\Z/ }

end
