

Pod::Spec.new do |spec|
  spec.name         = "JHCreateViewTool"
  spec.version      = "1.0.3"
  spec.summary      = "OC快捷创建IOS控件"
  spec.description  = "OC链式创建控件"
  spec.homepage     = "https://github.com/976971956/JHCreateViewTool"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  #spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "jianghuli" => "976971956@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/976971956/JHCreateViewTool.git", :tag => "1.0.3" }
  spec.source_files  = "JHCreateViewTool", "*.{h,m}"
  spec.requires_arc = true
end
