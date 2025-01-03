import 'package:equatable/equatable.dart';

class PhoneInputState extends Equatable {
  final String phoneNumber;
  final bool isLoading;
  final String? error;

  const PhoneInputState({
    this.phoneNumber = '',
    this.isLoading = false,
    this.error,
  });

  bool get isValid => phoneNumber.length >= 9;

  PhoneInputState copyWith({
    String? phoneNumber,
    bool? isLoading,
    String? error,
  }) {
    return PhoneInputState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, isLoading, error];
}
