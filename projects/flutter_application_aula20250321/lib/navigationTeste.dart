import 'package:flutter/material.dart';
import 'package:flutter_application_aula20250321/main.dart';
import 'package:flutter_application_aula20250321/resenhaApp.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(useMaterial3: true), home: const NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.redAccent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          // NavigationDestination(
          //   icon: Badge(child: Icon(Icons.person)),
          //   label: 'aula20250321',
          // ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.star)),
            label: 'Resenhas de filmes',
          ),
        ],
      ),
      body:
          <Widget>[
            /// Home page
            Card(
              shadowColor: Colors.transparent,
              margin: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                child: Center(child: Text('Professor Examples', style: theme.textTheme.titleLarge)),
              ),
            ),

            

            // /// Profile page
            // ListaComprasApp(),

            /// Resenhas de filmes page
            ResenhaApp(),
          ][currentPageIndex],
    );
  }
}