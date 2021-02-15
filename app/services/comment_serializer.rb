class CommentSerializer
  def initialize(comment)
    @comment = comment
  end

  def to_serialized_json
    options = {:only => [:id, :content, :post_id, :user_id, :created_at, :updated_at]}

    @comment.to_json(options)
  end

end
