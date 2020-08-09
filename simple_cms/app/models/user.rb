class User < ApplicationRecord

  def full_name
    [first_name, last_name].join(' ')
  end

  def abbrev_name
    initial = first_name.chars.first + '.'
    [initial, last_name].join(' ')
  end

end
