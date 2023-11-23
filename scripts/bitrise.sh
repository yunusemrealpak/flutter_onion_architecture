green=`tput setaf 2`

flutter clean
rm -rf ios/Pods
rm -rf ios/Podfile.lock
rm -rf ios/.symlinks
rm -rf ios/Flutter/Flutter.framework
rm -rf ios/Flutter/Flutter.podspec
flutter pub get
cd ios
pod install

cd ..

flutter packages pub run build_runner build --delete-conflicting-outputs && echo "${green}Done"
dart run easy_localization:generate -S assets/i10n -f keys -O lib/_core/localization -o locale_keys.g.dart && echo "${green}Localization Done"
