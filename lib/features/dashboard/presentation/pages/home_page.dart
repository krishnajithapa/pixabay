import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:pixabay/features/favorite/presentation/pages/add_favorite_page.dart';
import 'package:pixabay/shared/widgets/base_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    AddFavoritePage(),
    Container(
      color: Colors.blue,
      child: const Center(child: Text('Favorite Page')),
    ),
    // Add other pages here as needed
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, int>(
        builder: (context, state) {
          return BaseScaffold(
            appbarTitle: "Home",
            body: Container(),
            appBarActionWidget: IconButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => AddFavoritePage()));
              },
              icon: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
