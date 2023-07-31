part of 'form_bloc.dart';

@immutable
class FormState {
  final String? textValue1;
  final String? textValue2;
  final bool allowSubmit;

  const FormState({this.textValue1, this.textValue2, this.allowSubmit = false});
}
