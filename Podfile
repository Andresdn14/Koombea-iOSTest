platform :ios, '9.0'

target 'Koombea-iOSTest' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'ChameleonFramework'
  pod 'SwiftyJSON'
  pod 'Alamofire'
  pod 'RealmSwift'
  # Pods for Koombea-iOSTest




end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end
