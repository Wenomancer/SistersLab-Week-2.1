import 'package:flutter/material.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView({super.key});

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  List<String> myList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
    'Item 14',
    'Item 15',
    'Item 16',
    'Item 17',
    'Item 18',
    'Item 19',
    'Item 20',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10,
        shadowColor: Colors.blueGrey[900],
        title: const Text('Home Detail View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(myList[index]),
                  onTap: () {
                    print('Item ${index + 1}');
                  },
                );
              },
            ),
          ),
          const Divider(
            height: 5,
            thickness: 5,
            color: Colors.red,
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  print('Item 1');
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  print('Item 2');
                },
              ),
              ListTile(
                title: Text('Item 3'),
                onTap: () {
                  print('Item 3');
                },
              ),
              ListTile(
                title: Text('Item 4'),
                onTap: () {
                  print('Item 4');
                },
              ),
              ListTile(
                title: Text('Item 5'),
                onTap: () {
                  print('Item 5');
                },
              ),
              ListTile(
                title: Text('Item 6'),
                onTap: () {
                  print('Item 6');
                },
              ),
              ListTile(
                title: Text('Item 4'),
                onTap: () {
                  print('Item 4');
                },
              ),
              ListTile(
                title: Text('Item 4'),
                onTap: () {
                  print('Item 4');
                },
              ),
              ListTile(
                title: Text('Item 5'),
                onTap: () {
                  print('Item 5');
                },
              ),
              ListTile(
                title: Text('Item 4'),
                onTap: () {
                  print('Item 4');
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
