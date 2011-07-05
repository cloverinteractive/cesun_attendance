Factory.define :user do |u|
  u.sequence( :username ) { |n| "teache#{'r' * n}" }
  u.sequence( :email )    { |n| "teacher#{n}@school.com" }
  u.password  'supersecret'
  u.confirmed_at Time.now
end

Factory.define :campus do |c|
  c.sequence( :name ) { |n| "campus #{n}" }
end

Factory.define :study_plan do |s|
  s.sequence( :name ) { |n| "study plan #{n}" }
  s.association :campus
end

Factory.define :shift do |f|
  f.description 'test123'
end
