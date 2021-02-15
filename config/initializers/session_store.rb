if Rails.env.production?
    Rails.application.config.session_store :cookie_store, :key => '_frontend', domain: 'https://slayden-frontend.herokuapp.com/'
  else
    Rails.application.config.session_store :cookie_store, key: '_frontend'
  end
