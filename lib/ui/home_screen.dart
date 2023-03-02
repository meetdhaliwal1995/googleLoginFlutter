import 'dart:async';

import 'package:dynamic_search/model/country_model.dart';
import 'package:dynamic_search/repository/country_repo.dart';
import 'package:dynamic_search/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CountryRepository _repo = CountryRepository();
  List<Country> _countryList = <Country>[];
  Timer? _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await _repo.getCountry(query).then((value) {
        setState(() => _countryList = value.country ?? <Country>[]);
      });
    });
  }

  Future<void> _onLogoutPressed(BuildContext context) async {
    await GoogleSignIn().disconnect().whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (builder) => const LoginScreen()),
        );
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: 'Search...',
                ),
              ),
            ),
            Expanded(
              child: _countryList.isEmpty
                  ? const Center(
                      child: Text('No result found!'),
                    )
                  : ListView.separated(
                      itemCount: _countryList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      separatorBuilder: (_, index) => const Divider(
                        height: 1.0,
                        thickness: 1.0,
                      ),
                      itemBuilder: (_, index) => Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(_countryList[index].countryId ?? ''),
                      ),
                    ),
            ),
            ElevatedButton(
              onPressed: () async => await _onLogoutPressed(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
