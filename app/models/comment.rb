class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def created_at
    time = attributes['created_at']
    time.strftime('%A, %B %u')
  end
end
