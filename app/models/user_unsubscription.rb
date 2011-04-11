class UserUnsubscription < DomainModel
  validates_as_email :email
  validates_uniqueness_of :email, :message => 'has already been unsubscribed '

  before_save :set_unsubscribe_time
  
  def set_unsubscribe_time
    self.unsubscribed_at = Time.now unless self.unsubscribed_at
  end
end
