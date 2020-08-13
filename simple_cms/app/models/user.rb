class User < ApplicationRecord

  scope :sorted, lambda { order(:last_name, :first_name) }

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
