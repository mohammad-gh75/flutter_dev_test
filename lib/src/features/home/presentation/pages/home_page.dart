import 'package:flutter/material.dart';

import '../../../../routes/app_route_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: const Text(
        'Home Page',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'please select page',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoute.postList.path);
              },
              child: Container(
                height: 48,
                width: 148,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blueAccent,
                ),
                padding: const EdgeInsetsDirectional.all(16),
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'post list',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    height: 16 / 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoute.customInput.path);
              },
              child: Container(
                height: 48,
                width: 148,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blueAccent,
                ),
                padding: const EdgeInsetsDirectional.all(16),
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'custom input',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    height: 16 / 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
