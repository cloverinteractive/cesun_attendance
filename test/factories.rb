Factory.define :user do |u|
  u.username  'teacher'
  u.email     'teacher@school.com'
  u.password  'supersecret'
  u.confirmed_at Time.now
end
