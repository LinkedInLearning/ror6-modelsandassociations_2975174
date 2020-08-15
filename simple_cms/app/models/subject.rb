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

  before_validation :titleize_name
  after_create :log_create
  after_update :log_update, if: Proc.new {|s| s.position == 1}
  after_save :log_save, if: Proc.new {|s| s.pages.visible.any? }
  after_commit :cleaning_reminder, :if => :too_many_records?


  private

    def titleize_name
      self.name = name.titleize
    end

    def log_create
      logger.info("Subject ID #{id} was created")
    end

    def log_update
      logger.info("Subject ID #{id} was updated")
    end

    def log_save
      logger.info("Subject ID #{id} was saved")
    end

    def cleaning_reminder
      logger.info("Remember to prune old subjects")
    end

    def too_many_records?
      Subject.count > 4
    end

end
