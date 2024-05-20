import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomScrollView Example'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Interactive Grid'),
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://source.unsplash.com/random/800x600', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 200,
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  // Generate a unique URL for each item
                  String imageUrl = 'https://source.unsplash.com/random/400x400?item=$index';
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Item $index'),
                          content: Text('You tapped on item $index'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.blueGrey[(index % 9) * 100 + 100],
                      child: Image.network(
                        imageUrl, // Use the unique URL for each item
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
