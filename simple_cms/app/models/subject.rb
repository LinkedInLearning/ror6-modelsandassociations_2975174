class Subject < ApplicationRecord

  has_many :pages

  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order(:position) }
  scope :search, lambda {|kw| where("LOWER(name) LIKE ?", "%#{kw.downcase}%") }
  # scope :search, -> (kw) { where("LOWER(name) LIKE ?", "%#{kw.downcase}%") }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 50
  validates :name, :presence => true, :length => {:maximum => 50}

end
