flutter test --coverage
lcov --remove coverage/lcov.info \
'lib/main.dart' \
'lib/*/*.freezed.dart' \
'lib/*/*.g.dart' \
'lib/di/*' \
'lib/common/*' \
'lib/infrastructure/persistence/network/*' \
'lib/presentation/common/*' \
-o coverage/lcov.info
genhtml coverage/lcov.info --output=coverage

if [ "$1" = "windows" ]; then
    start coverage/index.html
else
    open coverage/index.html
fi