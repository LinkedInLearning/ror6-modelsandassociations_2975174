class User < ApplicationRecord

  has_and_belongs_to_many :departments
  
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  scope :sorted, lambda { order(:last_name, :first_name) }

  validates :first_name, :presence => true, :length => {:maximum => 25}
  validates :last_name, :presence => true, :length => {:maximum => 50}

  validates :email, :presence => true,
                    :length => {:maximum => 100},
                    :format => {:with => EMAIL_REGEX},
                    :confirmation => true

  validates_acceptance_of :terms


  validate :edits_are_allowed_today

  def full_name
    [first_name, last_name].join(' ')
  end

  def abbrev_name
    initial = first_name.chars.first + '.'
    [initial, last_name].join(' ')
  end


  private

    def edits_are_allowed_today
      if Time.now.wday == 3
        errors.add(:base, "No edits are allowed today.")
      end
    end

end
