import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finaltask/Features/Home/presintion/manager/assinmentget_cubit.dart';
import 'package:finaltask/Features/Home/presintion/view/widget/gridview.dart';
import 'package:finaltask/Features/add/presention/view/add.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 1;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<adCubit>(context).getcourses("api/ads", currentPage);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateAdWidget()));}, icon: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: BlocBuilder<adCubit, adState>(
        builder: (context, state) {
          if (state is adload) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is adsucess) {
            final task = state.task;
            final data = task['data'];
            if (data.length < 10) {
              hasMoreData = false;
            }
            return Column(
              children: [
                
                Expanded(
                  child: gridview(data: data, pagenamber: currentPage,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage > 1)
                      ElevatedButton(
                        onPressed: () {
                          currentPage--;
                          BlocProvider.of<adCubit>(context)
                              .getcourses("api/ads", currentPage);
                        },
                        child: Text('Load Previous'),
                      ),
                    if (hasMoreData)
                      ElevatedButton(
                        onPressed: () {
                          currentPage++;
                          BlocProvider.of<adCubit>(context)
                              .getcourses("api/ads", currentPage);
                        },
                        child: Text('Load More'),
                      ),
                  ],
                ),
              ],
            );
          } else if (state is adfailuer) {
            return Center(
              child: Text(state.errmass),
            );
          } else {
            return Container(
              color: Colors.black,
            );
          }
        },
      ),
    );
  }
}
