Pod::Spec.new do |s|
s.name         = 'ChabokKit'
s.module_name  = 'ChabokKit'
s.version      = '0.11.4'
s.summary      = 'BOOST YOUR BUSINESS WITH A STRONG CUSTOMER DATA PLATFORM'
s.description  = <<-DESC
Chabok simplifies marketing strategies from acquisition to churn by providing an attribution system,user journey, personalized engine, real-time segmentation, and cross-channel engagement.

DESC

s.requires_arc = true

s.homepage     = 'https://github.com/chabok-io/chabok-ios'
s.license =    { :type => 'proprietary', :text => <<-LICENSE
Copyright 2021 - present Chabok. All rights reserved.
LICENSE
}
s.author       = { 'Chabok.io' => 'dev.chabok@gmail.com' }
s.source = { :http => 'https://github.com/chabok-io/chabok-ios/releases/download/'+ s.version.to_s+'/ChabokKit.zip' }

s.platform = :ios
s.ios.deployment_target = '9.0'

s.vendored_frameworks  = 'ChabokKit.framework'
end
