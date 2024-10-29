import 'package:flutter/material.dart';

class DiscoveryTab extends StatelessWidget {
  const DiscoveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khám Phá'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Danh sách album nổi bật
          const SectionTitle(title: 'Album Nổi Bật'),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                AlbumCard(title: 'Jack 98', imageUrl: 'assets/images/j97.png'),
                AlbumCard(title: 'Sơn Tùng MTP', imageUrl: 'assets/images/sontung.png'),
                AlbumCard(title: 'Vũ', imageUrl: 'assets/images/vu.png'),
                // Thêm các album khác
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Danh sách bài hát mới
          const SectionTitle(title: 'Bài Hát Mới'),
          Column(
            children: const [
              SongCard(title: 'Em gái mưa', artist: 'Hương Tràm'),
              SongCard(title: 'Vừa hận vừa yêu', artist: 'Trung Tự'),
              SongCard(title: '1 Phút', artist: 'Vũ'),
              // Thêm các bài hát khác
            ],
          ),
          const SizedBox(height: 20),

          // Danh sách nghệ sĩ nổi bật
          const SectionTitle(title: 'Nghệ Sĩ Nổi Bật'),
          SizedBox(
            height: 120, // Giới hạn chiều cao
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ArtistCard(name: 'Sơn Tùng MTP', imageUrl: 'assets/images/sontung.png'),
                ArtistCard(name: 'Đen', imageUrl: 'assets/images/den.png'),
                ArtistCard(name: 'Noo Phước Thịnh', imageUrl: 'assets/images/noo.png'),
                // Thêm các nghệ sĩ khác
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Danh sách playlist theo chủ đề
          const SectionTitle(title: 'Playlist Theo Chủ Đề'),
          Column(
            children: const [
              PlaylistCard(title: 'Playlist 1', description: 'Mô tả playlist 1'),
              PlaylistCard(title: 'Playlist 2', description: 'Mô tả playlist 2'),
              PlaylistCard(title: 'Playlist 3', description: 'Mô tả playlist 3'),
              // Thêm các playlist khác
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// Widget tiêu đề phần
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft, // Canh trái tiêu đề
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18, // Kích thước chữ tùy chỉnh nếu cần
          ),
        ),
      ),
    );
  }
}

// Widget hiển thị album
class AlbumCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const AlbumCard({required this.title, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget hiển thị bài hát
class SongCard extends StatelessWidget {
  final String title;
  final String artist;

  const SongCard({required this.title, required this.artist, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note),
      title: Text(title),
      subtitle: Text(artist),
      contentPadding: EdgeInsets.zero,
    );
  }
}

// Widget hiển thị nghệ sĩ
class ArtistCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ArtistCard({required this.name, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget hiển thị playlist
class PlaylistCard extends StatelessWidget {
  final String title;
  final String description;

  const PlaylistCard({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: const Icon(Icons.playlist_play),
        title: Text(title),
        subtitle: Text(description),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
