# config/initializers/pony.rb
 
Pony.options = {
  :to => 'ana.andres@ieee.org',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'acandresdelvalle',
    :password             => 'nchhtqrvrkkprfiw',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
}