class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate  :clickbait

  def clickbait
    if title.present?
      unless title.match /Won't Believe | Secret | Top \d+ | Guess/
        errors.add(:title, 'not clickbait')
      end
    end
  end


end
