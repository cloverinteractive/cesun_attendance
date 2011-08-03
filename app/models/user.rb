class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable, :lockable

  validates_presence_of   :username
  validates_uniqueness_of :username
  validates_format_of     :username, :with => /\A[a-z\-_.]+\Z/i

  attr_accessor   :login, :role_tokens
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me, :role_tokens

  acts_as_authorization_subject :association_name => :roles

  def role_names
    roles.map { |role| role.name.titleize }.join(', ')
  end

  def role_tokens=(ids)
    self.role_ids = ids.split( ',' )
  end

  has_many :assignments

  protected

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }
    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |key, value| value.blank? }

    if attributes.size == required_attributes.size
      if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else
       record = where(attributes).first
      end
    end

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end
    end
    record
  end

  def self.find_record(login)
    where(["username = :value OR email = :value", { :value => login }]).first
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where([ 'username = :value OR lower(email) = :value', { :value => login.downcase } ]).first
  end
end
