# app/models/inquiry.rb
 
class Inquiry
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::TextHelper
  
  attr_accessor :name, :email, :message, :surname
  
  validates :name, 
            :presence => true
  
  validates :email,
            :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  
  validates :message,
            :length => { :minimum => 10, :maximum => 1000 }
			
  validates :surname, 
            :format => { :with => /^$/, :multiline => true }
  
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def deliver
    return false unless valid?
    Pony.mail({
	  
      :from => %("#{name}" <#{email}>),
     # :from => email, it does not work - it always takes the smpt address
      :reply_to => email,
      :subject => "ACAV Tech - Web Inquiry",
      :body => "\n\nName:    " + name + "\n\nEmail:   " + email + "\n\nQuestion:\n\n\t" + message + "\n\n\n-- End of request --" ,
    #  :html_body => "<div>" + name + " <BR/>     " + email + " <BR/>     " + message + "</div>"
    })
  end
      
  def persisted?
    false
  end
end