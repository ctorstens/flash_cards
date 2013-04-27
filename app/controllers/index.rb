
get '/' do
  # Typically the index of a resource returns a collection of the resources
  # For instances, a blog may have a '/' route that returns all the articles
  # @resources = Resource.all
  erb :index
end
