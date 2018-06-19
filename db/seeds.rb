# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Add the roles
Role.create(name: 'Captain')
Role.create(name: 'Moderator')
Role.create(name: 'Viewer')
Role.create(name: 'Patient')

# Add the categories.
Category.create(name: 'Food')
Category.create(name: 'Medicine')

# Seed some users.
User.create!(
  first_name: 'Joey JoJo Jr.',
  last_name: 'Shabadoo',
  email: 'a@all.com',
  password: '123123',
)

User.create!(
  first_name: 'Benson',
  last_name: 'Burner',
  email: 'b@b.com',
  password: 'abcabc',
)

# Add some circles.
Circle.create(super_admin: User.first)
Circle.create(super_admin: User.last)

# Add some positions to circles.
Position.create(user: User.first, role: Role.first, circle: Circle.first)

# Add some invitations
position = Position.first
Invitation.create(position: position, sender: position.user, email: "some_dude@someemail.com")