// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigation_bloc.dart';

// abstract class NavigationState extends Equatable {
//   final int index;
//   const NavigationState(
//     {required this.index}
//   );

//   @override
//   List<Object> get props => [index];
// }

class SwitchTab extends Equatable {
  final int index;
  const SwitchTab({required this.index});

    @override
  List<Object> get props => [index];
}
