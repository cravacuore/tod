# Strategies for obtaining Admin user

case Padrino.env
  when :development then begin
  	AdminManager.set_admin_email 'admin@mail.com'
  	AdminManager.set_admin_name 'bananee'
  end
  when :production  then AdminManager.set_admin_email ENV['ADMIN_USEREMAIL']
  when :test        then AdminManager.set_admin_email 'admin@mail.com'
end
