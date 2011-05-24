if Rails.env.development?
  User.delete_all
end

admin = User.new :username => 'admin', :password => 'administrator', :email => 'sysadmin@cesun.mx'
admin.confirmed_at = Time.now
admin.save!
