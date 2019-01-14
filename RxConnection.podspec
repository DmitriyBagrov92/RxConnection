Pod::Spec.new do |s|
  s.name         		= "RxConnection"
  s.version      		= "0.0.1"
  s.summary      		= "Basic services for Dialog SDK networking"
  s.homepage            = "https://github.com/DmitriyBagrov92/RxConnection"
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.author       		= { "Dmitriy Bagrov" => "dmitriybagrov92@gmail.com" }
  s.source              = { :git => "https://github.com/DmitriyBagrov92/RxConnection.git" }
  s.source_files        = "Sources/*.{swift}"
  s.platform     		= :ios, "10.0"
  s.requires_arc 		= true

  # Core
  s.dependency 'Alamofire'
  s.dependency 'RxSwift'

  s.preserve_paths = 'Frameworks'
  s.vendored_framework = 'Frameworks/RxConnection.framework'

end
