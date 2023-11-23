case $1 in
    "test")
        bundle exec fastlane test
        ;;
    "beta")
        bundle exec fastlane beta
        ;;
    "release")
        bundle exec fastlane release
        ;;
    "deploy")
        bundle exec fastlane deploy
        ;;
    "update")
        bundle exec fastlane update
        ;;