Rails.application.config.session_store :cookie_store, {
  :key => '_slayden-portfolio',
  :domain => :all,
  :same_site => :none,
  :secure => :true,
  :tld_length => 2
}
