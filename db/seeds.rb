User.destroy_all
Post.destroy_all
Comment.destroy_all

riley = User.new(
  name: "Riley Slayden",
  email: "slaydenriley@gmail.com",
  description: "My name is Riley Slayden and this is my portfolio",
  password_digest: "$2a$12$cbXs9bws3GN5vP1XrbItFeziDHieupzgJ74lL6iN5onPUSFN9HWJ6",
  admin: true)

riley.save
