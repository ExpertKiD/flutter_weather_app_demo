import 'package:app/resources/colors.dart';
import 'package:app/screens/settings.dart';
import 'package:app/screens/weather_detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.sunshineBlue,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 300,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(height: 300 - 56, color: Colors.red)),
            ),
            title: Image.asset(
              'assets/images/ic_logo.png',
              cacheHeight: 48,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Material(
                color: index % 2 == 0
                    ? Colors.blue.shade200
                    : Colors.blue.shade600,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherDetailScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      textScaleFactor: 5,
                    ),
                  ),
                ),
              );
            }, childCount: 20),
          )
        ],
      ),
    );
  }
}
