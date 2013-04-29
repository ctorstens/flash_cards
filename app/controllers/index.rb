
get '/' do
  # Typically the index of a resource returns a collection of the resources
  # For instances, a blog may have a '/' route that returns all the articles
  # @resources = Resource.all

  # erg :user_profile unless current_user == nil
  if current_user
    redirect '/user_profile'
  else
    erb :index
  end
end
