import 'package:beverage_express/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  static const _green = Color(0xFF2E7D1E);
  static const _dark = Color(0xFF1F2340);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   String? userName = 'Loading...';
   String? initials;
  
  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('userName')?.trim() ??"";
    setState(() {
      userName = name.isEmpty ? 'utilisateur' : name;
      initials = name.isEmpty ? 'XX' : name.trim().split(RegExp(r'\s+')).map((name) => name[0].toUpperCase()).join();

    });

  }

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItem>[
      _MenuItem(Icons.inventory_2_rounded, const Color(0xFFB5683A), 'My orders', () { Navigator.pushNamed(context, '/myorderspage'); }),
      _MenuItem(Icons.location_on_rounded, const Color(0xFFE91E63), 'My addresses', () { Navigator.pushNamed(context, '/myaddressespage'); }),
      _MenuItem(Icons.credit_card_rounded, const Color(0xFF1E88E5), 'Payment methods', () {}),
      _MenuItem(Icons.star_rounded, const Color(0xFFFFC107), 'My reviews', () {}),
      _MenuItem(Icons.notifications_rounded, const Color(0xFFFFB300), 'Notifications', () {Navigator.pushNamed(context, '/notificationpage');}),
      _MenuItem(Icons.settings_rounded, const Color(0xFF90A4AE), 'Settings', () { Navigator.pushNamed(context, '/settingpage'); }),
      _MenuItem(Icons.logout_rounded, const Color(0xFFE57373), 'Log out', () async { 
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (_) => const Login()), 
          (route) => false,
        );
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', false); 
      }),
    ];
  
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildStats(),
              const SizedBox(height: 16),
              ...items.map(_buildMenuTile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ProfilePage._green,
            borderRadius: BorderRadius.circular(18),
          ),
          child:  Text(
            '$initials',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                '$userName',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: ProfilePage._dark,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '+237 652 472 779',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFC8F2DC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Premium customer',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B6B45),
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE3E8FA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.settings, size: 20, color: Color(0xFF3F51B5)),
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(value: '23', label: 'Orders'),
          _StatItem(value: '4.8', label: 'Avg. rating'),
          _StatItem(value: '47 500', label: 'FCFA saved'),
        ],
      ),
    );
  }

  Widget _buildMenuTile(_MenuItem item) {
    final isLogout = item.label == 'Log out';
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Icon(item.icon, color: item.color, size: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isLogout ? Colors.red.shade400 : ProfilePage._dark,
                    ),
                  ),
                ),
                if (!isLogout)
                  Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1F2340),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  _MenuItem(this.icon, this.color, this.label, this.onTap);
}
