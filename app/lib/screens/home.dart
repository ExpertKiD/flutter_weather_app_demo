import 'package:app/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(oneCallWeatherProvider).when(
        data: (weatherData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Latitude ${weatherData.latitude}"),
                Text("Logitude ${weatherData.longitude}"),
                Text("Timezone ${weatherData.timezone}"),
                Text("Timezone offset ${weatherData.timezoneOffset}"),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          print(error);
          print(stackTrace);

          return Container(child: Center(child: Text('Error')));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
      // body: CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       pinned: true,
      //       snap: false,
      //       floating: false,
      //       expandedHeight: 300,
      //       actions: [
      //         IconButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => const SettingsScreen()),
      //             );
      //           },
      //           icon: const Icon(Icons.more_vert),
      //         ),
      //       ],
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Align(
      //             alignment: Alignment.bottomCenter,
      //             child: Container(height: 300 - 56, color: Colors.red)),
      //       ),
      //       title: Image.asset(
      //         'assets/images/ic_logo.png',
      //         cacheHeight: 48,
      //       ),
      //     ),
      //     const SliverToBoxAdapter(
      //       child: SizedBox(
      //         height: 20,
      //       ),
      //     ),
      //     SliverList(
      //       delegate:
      //           SliverChildBuilderDelegate((BuildContext context, int index) {
      //         return Material(
      //           color: index % 2 == 0
      //               ? Colors.blue.shade200
      //               : Colors.blue.shade600,
      //           child: InkWell(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => WeatherDetailScreen(),
      //                 ),
      //               );
      //             },
      //             child: Center(
      //               child: Text(
      //                 '${index + 1}',
      //                 textScaleFactor: 5,
      //               ),
      //             ),
      //           ),
      //         );
      //       }, childCount: 20),
      //     )
      //   ],
      // ),
    );
  }
}
