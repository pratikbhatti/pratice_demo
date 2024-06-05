import 'package:flutter/material.dart';
import 'package:pratik_testing/src/presentation/view/homePage/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratik_testing/src/presentation/view/homePage/model/get_api_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.when(
            initial: () => Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            loaded: (List<GetApiCall> data) {
              return Scaffold(
                body: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(data[index].title.toString() ?? ""));
                  },
                ),
              );
            },
            loading: () => Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            error: (String errorString) {
              return Scaffold(
                body: Center(
                  child: Text(errorString.toString()),
                ),
              );
            });
      },
    );
  }
}
