users= [
{ email: 'ichiro@user.com', password: 'ichiro16' },
]
users.each do |record|
 User.create!(record) unless User.find_by(email: record[:email])
end

admins= [
{ email: 'ichiro@admin.com', password: 'ichiro16' }
]
admins.each do |record|
 Admin.create!(record) unless Admin.find_by(email: record[:email])
end