class TagSerializer
  def initialize(tag)
    @tag = tag
  end

  def to_serialized_json
    options = {:only => [:id, :name]}

    @tag.to_json(options)
  end

end
