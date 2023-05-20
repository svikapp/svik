import 'package:flutter/material.dart';
import 'package:svik/presentation/pages/search_view/widgets/search_bar.dart';

class SearchView extends StatelessWidget {
   const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SvikSearchBar()
    );
  }
}