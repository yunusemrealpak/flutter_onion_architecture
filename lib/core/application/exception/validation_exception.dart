import 'package:busenet/busenet.dart';

final class ValidationException extends Failure {
  ValidationException({super.message = "Validation Error"});
}
