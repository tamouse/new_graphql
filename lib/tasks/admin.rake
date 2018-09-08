namespace :admin do
  desc "Create a new admin user"
  task :new, [:username,:password] => :environment do |task, args|
    puts "creating admin user #{args[:username]}, password #{args[:password]}"
    User.create!(
      username: args[:username],
      admin: true,
      password: args[:password],
      password_confirmation: args[:password]
   )
  end

end
