import 'package:flutter/material.dart';

import '../components/image_header_default.dart';
import '../components/subtitle_widget.dart';
import '../components/tasks/list.dart';
import '../components/title_widget.dart';
import '../routes/routes_generator.dart';
import '../shared/constants.dart';
import '../shared/styles.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required String userName}) : _userName = userName, super(key: key);
  const MyHomePage({super.key, required String userName})
      : _userName = userName;

  final String _userName;
  get name => _userName;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyle.primaryColor,
                image: DecorationImage(
                  //image: AssetImage
                  image: NetworkImage(
                    'https://picsum.photos/seed/picsum/200/300',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox.shrink(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(AppConstants.home),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.homePage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(AppConstants.category),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.categoryPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text(AppConstants.calendar),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.calendarPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.toc_outlined),
              title: const Text(AppConstants.about),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.aboutPage);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ImageHeaderDefault(),
        //title: Image.network(
        //  'https://cdn1.iconfinder.com/data/icons/sharovar-outline/128/Pie_chart-512.png',
        //),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // padding: EdgeInsets.symmetric(),
          // padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubtitleDefault(title: AppConstants.welcome),
              TitleDefault(title: widget.name),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListTasks(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //chamar a página de cadastro
          Navigator.of(context).pushNamed(RoutesGenerator.addPage);
        },
        tooltip: AppConstants.newPage,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
