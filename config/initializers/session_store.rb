if Rails.env.production?
    Rails.application.config.session_store :cookie_store, :key => '_frontend', :domain => :all, :same_site => :none,
      :secure => :true, :tld_length => 2
  else
    Rails.application.config.session_store :cookie_store, key: '_frontend'
  end
