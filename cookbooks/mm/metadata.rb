name		  "mm"
maintainer        "Mike Schuette"
maintainer_email  "mike.schuette@gmail.com"
license           "GPL"
description       "Installs and configures the Making Music website"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

depends "apache2"
depends "mysql"
%w{ apache2 mysql php git }.each do |book|
  depends book
end
