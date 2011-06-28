Factory.define :user do |u|
  u.sequence( :username ) { |n| "teache#{'r' * n}" }
  u.sequence( :email )    { |n| "teacher#{n}@school.com" }
  u.password  'supersecret'
  u.confirmed_at Time.now
end
