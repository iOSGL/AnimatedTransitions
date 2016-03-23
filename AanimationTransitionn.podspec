
Pod::Spec.new do |s|
  s.name         = "AanimationTransitionn"
  s.version      = "0.0.1"
  s.summary  = "UBER imitate animated transitions"
  
  s.homepage     = "https://github.com/geng199200/AnimatedTransitions"

  s.license      = 'MIT'

  s.author        = { "耿磊" => "171973956@qq.com" }

  s.source       = { :git => "https://github.com/geng199200/AnimatedTransitions.git", :tag => "0.0.1" }

  s.platform     = :ios, "8.0"

  s.source_files = "Source/*.{h,m}"

  s.requires_arc = true

end