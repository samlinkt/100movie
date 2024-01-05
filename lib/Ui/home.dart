import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/movie_bloc.dart';
import '../Repository/ModelClass/MovieModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late MovieModel data;

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(FetchMovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieBlocLoading) {
                return Center(child: CircularProgressIndicator(),);
              }
              if (state is MovieBlocError) {
                return Center(child: Text("ERROR"),);
              }
              if (state is MovieBlocLoaded) {
                data = BlocProvider
                    .of<MovieBloc>(context)
                    .movieModel;



                  return Container(
                    height: 80, color: Colors.red,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(data.thumbnail.toString()),
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.rating.toString()),
                          ],
                        )
                      ],
                    ),
                  );

              } else {
                return SizedBox();
              }
            },
        )
    );
  }
}
