User.destroy_all
Post.destroy_all
Comment.destroy_all

def User.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
end

## Create Users
riley = User.create(
  name: "Riley Slayden",
  email: "slaydenriley@gmail.com",
  description: "My name is Riley Slayden and this is my portfolio",
  password_digest: "#{User.digest('codydog')}",
  admin: true)

riley.save
