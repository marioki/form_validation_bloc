part of 'form_bloc.dart';

@immutable
abstract class FormEvent {}

class FormValuesChanged extends FormEvent {
  final String textValue1;
  final String textValue2;
  FormValuesChanged(this.textValue1, this.textValue2);

  @override
  List<Object> get props => [textValue1, textValue2];
}
