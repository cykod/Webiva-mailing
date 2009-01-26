class UserUnsubscription < DomainModel
  validates_as_email :email
  validates_uniqueness_of :email, :message => 'has already been unsubscribed '
  
  def before_save
    unsubscribed_at = Time.now unless unsubscribed_at
  end
end
