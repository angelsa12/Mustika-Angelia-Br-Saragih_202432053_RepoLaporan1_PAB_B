
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Nama: Mustika Angelia Br Saragih
// NIM: 202432053
// Mata Kuliah: Pemrograman Aplikasi Bergerak

class Skill {
  final String title;
  final int targetHours;
  final String category;
  final double progress;

  const Skill({
    required this.title,
    required this.targetHours,
    required this.category,
    required this.progress,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillPath',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE86A92),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE86A92),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE86A92),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            textStyle: const TextStyle(fontSize: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const LayarUtama(),
    );
  }
}

class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    const daftarSkill = [
      Skill(
        title: 'Flutter Development',
        targetHours: 20,
        category: 'Mobile Development',
        progress: 0.65,
      ),
      Skill(
        title: 'UI/UX Design',
        targetHours: 15,
        category: 'User Interface & Experience',
        progress: 0.40,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SkillPath',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'My Learning Goals 💗',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF74334B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Small steps, big progress!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFB34D70),
                    ),
                  ),
                  const SizedBox(height: 12),
                  for (final skill in daftarSkill)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: KartuSkill(skill: skill),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// CUSTOM WIDGET KARTU PELAJARAN
class KartuSkill extends StatelessWidget {
  final Skill skill;

  const KartuSkill({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFEAF1),
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: Color(0xFFF8C6D7),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEAF1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    skill.title == 'Flutter Development'
                        ? Icons.phone_android_rounded
                        : Icons.palette_rounded,
                    color: const Color(0xFFE86A92),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skill.title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF74334B),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        skill.category,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFFB34D70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Learning Progress',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF74334B),
                    ),
                  ),
                ),
                Text(
                  '${(skill.progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE04F83),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: skill.progress,
                minHeight: 6,
                backgroundColor: Colors.white,
                color: const Color(0xFFE86A92),
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                const Icon(
                  Icons.schedule_rounded,
                  size: 13,
                  color: Color(0xFFB34D70),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Target: ${skill.targetHours} jam',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF8E5B6D),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Semangat belajar ${skill.title}!',
                      ),
                    ),
                  );
                },
                child: const Text('Mulai Belajar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
