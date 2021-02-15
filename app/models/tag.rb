class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  def created_at
    time = attributes['created_at']
    time.strftime('%A, %B %u')
  end
end
