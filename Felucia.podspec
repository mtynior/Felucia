Pod::Spec.new do |s|

  s.name         = "Felucia"
  s.version      = "0.9.0"
  s.summary      = "UIColor extensions in swift."

  s.homepage     = "https://github.com/mtynior/Felucia"
  s.license      = "MIT"
  
  s.author             = { "Michał Tynior" => "mtynior@gmail.com" }
  s.social_media_url   = "http://twitter.com/cadious_"

  s.platform     = :ios
  s.platform     = :ios, "8.1"

  s.source       = { :git => "https://github.com/mtynior/Felucia.git", :tag =>  s.version }
  s.source_files  = "Felucia/*.swift"
 
  s.requires_arc = true

end
