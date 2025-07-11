import 'package:weather/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _navigating = false;

  void _handleTap(BuildContext ctx) async {
    if (_navigating) return;
    setState(() => _navigating = true);

    await Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => const MapPage()),
    );

    setState(() => _navigating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Testing!')),
      body: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: _navigating ? null : () => _handleTap(context),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [Text('Weather API'), Icon(Icons.cloud)],
            ),
          ),
        ),
      ),
    );
  }
}
