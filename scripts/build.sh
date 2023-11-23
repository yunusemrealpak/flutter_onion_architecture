RED=$(tput setaf 1)
POWDER_BLUE=$(tput setaf 153)

case $1 in
    -launcher|--launcher_icons)
        printf "Running launcher..."
        dart run flutter_launcher_icons && printf "Done"
        ;;
    -cl|--clean)
        printf "Running clean..."
        flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && printf "Done"
        ;;
    -l|--launcher_icons)
        printf "Running launcher icons..."
        flutter pub pub run flutter_launcher_icons:main && printf "Done"
        ;;
    -ios|--ios_build)
        printf "Running ios build..."
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
        open ios -a "Xcode"
        ;;    
    -apk|--apk_build)
        printf "\nRunning apk build...\n"
        if [ "$2" = "" ]; then
            echo ""
            echo -e "${POWDER_BLUE}Without flavors, the default build is used."
            echo ""
            flutter clean
            flutter build apk --release --no-tree-shake-icons
        else
            flutter clean
            flutter build apk --release --flavor $2 -t lib/main/flavor/main_$2.dart --no-tree-shake-icons
        fi
        
        ;;
    -bundle|--appbundle_build)
        printf "\nRunning appbundle build...\n"
        if [ "$2" = "" ]; then
            echo ""
            echo -e "${POWDER_BLUE}Without flavors, the default build is used"
            echo ""
            flutter clean
            flutter build appbundle
        else
            flutter clean
            flutter build appbundle --flavor $2 -t lib/main/flavor/main_$2.dart
        fi
        ;;
    *)
        echo ""
        echo "${RED}Error: Invalid option"
        ;;
esac