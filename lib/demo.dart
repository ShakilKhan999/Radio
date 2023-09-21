import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relaks_media/provider/home_page_provider.dart';
import 'package:relaks_media/provider/news_api_provider.dart';
import 'package:relaks_media/screens/audio_play_screen.dart';
import 'models/news_model.dart';
import 'models/upcoming_show_model.dart'; // Import your UpcomingShowProvider

class Demo extends StatefulWidget {
  static const String routeName = '/demo';

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsApiProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: (){
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
            );*/
          },
            child: Text('Your API Data')
        ),
      ),
      body: Consumer<NewsApiProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final List<News>? dataList = provider.dataList;
            return ListView.builder(
              itemCount: dataList?.length ?? 0,
              itemBuilder: (context, index) {
                final News data = dataList![index];
                return ListTile(
                  title: Text(data.title ?? 'No Title'),
                  subtitle: Text(data.subtitle ?? 'No Subtitle'),
                  // Add other properties as needed
                );
              },
            );
          }
        },
      ),
    );  }
}
