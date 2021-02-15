class UserSerializer
  def initialize(listing_object)
    @listing = listing_object
  end

  def to_serialized_json
    options = {:only => [:id, :name, :email, :description, :admin]}

    @listing.to_json(options)

  end
end
