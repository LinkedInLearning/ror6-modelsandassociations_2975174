class PageAssignment < ApplicationRecord

  belongs_to :page
  belongs_to :user

  ROLES = ['manager', 'editor']
  
end
