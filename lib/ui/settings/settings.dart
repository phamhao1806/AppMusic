import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
      ),
      body: const SettingsList(), // Sử dụng widget con để quản lý trạng thái
    );
  }
}

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  _SettingsListState createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  bool isDarkMode = false;
  double playbackSpeed = 1.0;
  String audioQuality = 'Cao';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Chế độ tối
        SwitchListTile(
          title: const Text('Chế độ tối'),
          value: isDarkMode,
          onChanged: (bool value) {
            setState(() {
              isDarkMode = value;
            });
          },
        ),
        // Tốc độ phát lại
        ListTile(
          title: const Text('Tốc độ phát lại'),
          subtitle: Slider(
            value: playbackSpeed,
            min: 0.5,
            max: 2.0,
            divisions: 6,
            label: playbackSpeed.toString(),
            onChanged: (double value) {
              setState(() {
                playbackSpeed = value;
              });
            },
          ),
        ),
        // Chất lượng âm thanh
        ListTile(
          title: const Text('Chất lượng âm thanh'),
          subtitle: DropdownButton<String>(
            value: audioQuality,
            items: const <DropdownMenuItem<String>>[
              DropdownMenuItem<String>(
                value: 'Thấp',
                child: Text('Thấp'),
              ),
              DropdownMenuItem<String>(
                value: 'Trung bình',
                child: Text('Trung bình'),
              ),
              DropdownMenuItem<String>(
                value: 'Cao',
                child: Text('Cao'),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                audioQuality = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
