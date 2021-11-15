Pod::Spec.new do |s|
s.name         = 'ChabokKit'
s.module_name  = 'ChabokKit'
s.version      = '0.9.0'
s.summary      = 'Connect your users with Chabok realtime messaging or send push notifications to them.'
s.description  = <<-DESC
Blow some breath to your app with Chabok realtime messaging and receive push notifications cross any platform with zero code. Know your users's better, push them content based on their location or track their presence/location withoud headache.
Chabok help mobile application marketers to optimize their acquisition campaigns and increase user engagement & retention.

Chabok co
DESC

s.requires_arc = true

s.homepage     = 'https://github.com/chabok-io/chabok-ios'
s.license =    { :type => 'proprietary', :text => <<-LICENSE
Copyright 2021 - present Chabok. All rights reserved.
LICENSE
}
s.author       = { 'Chabok.io' => 'info@chabok.io' }
s.source = { :http => 'https://github.com/chabok-io/chabok-ios/releases/download/'+ s.version.to_s+'/ChabokKit.zip' }

s.platform = :ios
s.ios.deployment_target = '9.0'

s.vendored_frameworks  = 'ChabokKit.framework'
end
