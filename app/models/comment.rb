class Comment < ApplicationRecord
  before_save :check_author
  belongs_to :topic

  # @comment.save
  # @comment.update
  def check_author
    if self.author.blank?
      self.author = 'anon coward'
    end
  end

end
