Pod::Spec.new do |s|
s.name         = "LLSlideMenu"
s.version      = "1.0.4"
s.summary      = "This is a way to create a spring slide menu use LLSlideMenu."
s.homepage     = "https://github.com/lilei644/LLSlideMenu"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "lilei644" => "1793161563@qq.com" }
s.platform     = :ios, "6.0"
s.source       = { :git => "https://github.com/lilei644/LLSlideMenu.git", :tag => s.version.to_s }
s.requires_arc = true
s.source_files  = "LLSlideMenu/*.{h,m}"
s.framework = "UIKit","QuartzCore"
end
