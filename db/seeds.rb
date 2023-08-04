# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "uuidtools"

user = User.create(
  id: UUIDTools::UUID.random_create,
  first_name: "John", last_name: "Doe",
  email: "example@example.com",
  password: Argon2::Password.create("12345678").to_s
)
Post.create(
  id: UUIDTools::UUID.random_create,
  title: "My first post",
  user_id: user.id,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam faucibus turpis non metus commodo porta. Phasellus nec dui sem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum eu blandit odio. Pellentesque at magna in justo imperdiet tempor quis vitae odio. Sed lobortis arcu vel sapien congue posuere. Curabitur in massa sit amet ipsum condimentum convallis. Suspendisse nec ipsum ex. Morbi vestibulum diam dui, nec placerat magna condimentum ut. Suspendisse rhoncus ornare nisl in scelerisque. Cras laoreet leo vel urna aliquam, a vulputate felis hendrerit. Quisque ultricies congue arcu, et vestibulum urna pretium eu.
Donec vitae nulla feugiat lectus ultricies pellentesque. Aliquam erat volutpat. Morbi nec magna ipsum. Maecenas et iaculis dolor. Maecenas nec quam auctor, vehicula justo id, sollicitudin dolor. Praesent urna tortor, consequat nec odio eu, venenatis feugiat risus. Integer a diam sit amet risus tincidunt cursus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas vulputate pharetra nunc a vulputate. Integer ut metus lorem. Suspendisse nec pharetra tellus. Fusce convallis ante eu fermentum faucibus. Ut tellus est, pellentesque at pulvinar quis, sodales et diam. Pellentesque sed diam erat. Nunc placerat aliquet cursus.
Vivamus eget velit lorem. Cras est ante, pellentesque at commodo a, ornare at elit. Suspendisse dui massa, fringilla ac tincidunt vel, feugiat id est. Praesent luctus nisl eu sapien blandit, cursus vehicula lacus fringilla. Nam vitae velit vehicula, lacinia massa porta, egestas nulla. Sed vestibulum a nisi et tincidunt. Vivamus eu varius odio."
)
