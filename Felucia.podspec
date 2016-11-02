Pod::Spec.new do |s|

  s.name         = "Felucia"
  s.version      = "1.5.0"
  s.summary      = "UIColor extensions in swift."

  s.homepage     = "https://github.com/mtynior/Felucia"
  s.license      = "MIT"
  
  s.author             = { "Michał Tynior" => "mtynior@gmail.com" }
  s.social_media_url   = "http://twitter.com/mtynior"

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source       = { :git => "https://github.com/mtynior/Felucia.git", :tag =>  s.version }
  s.source_files  = "Felucia/*.swift"
 
  s.requires_arc = true

end
