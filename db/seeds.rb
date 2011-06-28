if Rails.env.development?
  User.delete_all
  Role.delete_all
end

%w/admin coordinator student_control teacher/.each { |role| Role.create! :name => role }
admin = User.new :username => 'admin', :password => 'administrator', :email => 'sysadmin@cesun.mx'
admin.confirmed_at = Time.now
admin.save!
admin.has_role! :admin
