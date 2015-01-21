
Pod::Spec.new do |s|

  s.name         = "ALAlertUtil"
  s.version      = "0.0.2"
  s.summary      = "ALAlertUtil uses alert or toast to show error messages."
  s.homepage     = "https://github.com/AugMeganZhou/ALAlertUtil"
  s.license      = "MIT"

  s.author             = { "Megan" => "meganzhou2013@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AugMeganZhou/ALAlertUtil.git", :tag => "0.0.2" }
s.source_files  =  "ALAlertUtil/*.{h,m}"

  s.dependency 'Toast', '~> 2.2'

end
