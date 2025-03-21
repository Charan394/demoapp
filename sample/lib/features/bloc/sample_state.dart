// Suggested code may be subject to a license. Learn more: ~LicenseLog:3270331478.
part of 'sample_bloc.dart';



final class SampleState extends Equatable  {
  final List<SampleResponse> data;
  final Status status;
 const SampleState({required this.data,required this.status});

  factory SampleState.initial(){
    return SampleState(data: [], status: Status.initial);
  }

  SampleState copyWith({
    List<SampleResponse>? data,
    Status? status,
  }){
    return SampleState(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props =>[
      data,
      status

  ];



}


enum Status{
  initial,
  success,
  error,
  loading
}

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;

  bool get isLoading => this == Status.loading;

 

}