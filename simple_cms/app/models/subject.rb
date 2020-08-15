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

  validates_presence_of :position
  validates_numericality_of :position, :greater_than => 0

  after_create :log_create
  after_update :log_update
  after_save :log_save


  private

    def log_create
      logger.info("Subject ID #{id} was created")
    end

    def log_update
      logger.info("Subject ID #{id} was updated")
    end

    def log_save
      logger.info("Subject ID #{id} was saved")
    end

end
