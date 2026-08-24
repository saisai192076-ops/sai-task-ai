import 'package:flutter/material.dart';

void main() {
  runApp(const SaiTaskApp());
}

class SaiTaskApp extends StatelessWidget {
  const SaiTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sai Task AI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SaiTaskHomeScreen(),
    );
  }
}

class SaiTaskHomeScreen extends StatefulWidget {
  @override
  _SaiTaskHomeScreenState createState() => _SaiTaskHomeScreenState();
}

class _SaiTaskHomeScreenState extends State<SaiTaskHomeScreen> {
  final TextEditingController _taskController = TextEditingController();
  
  List<Map<String, dynamic>> todayTasks = [
    {
      "title": "မနက် ၁၀ နာရီ ဂျာဗစ်နှင့် အစည်းအဝေး",
      "priority": "High",
      "time": "10:00 AM",
      "score": 0.95
    },
    {
      "title": "Sai Task AI Backend API စစ်ဆေးခြင်း",
      "priority": "Medium",
      "time": "02:00 PM",
      "score": 0.78
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text('Sai Task AI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_active, color: Colors.blueAccent), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.amber, size: 30),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "မင်္ဂလာပါ မစ်စတာစိုင်း! ဒီနေ့ ဦးစားပေး လုပ်ရမည့် အလုပ် ၂ ခုကို AI က ပြင်ဆင်ထားပါတယ်။",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("ယနေ့အတွက် အချိန်ဇယား (AI Prioritized)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: todayTasks.length,
                itemBuilder: (context, index) {
                  final task = todayTasks[index];
                  return Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: task['priority'] == 'High' ? Colors.redAccent : Colors.orangeAccent,
                        child: const Icon(Icons.task_alt, color: Colors.white),
                      ),
                      title: Text(task['title'], style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text("အချိန်: ${task['time']} | Priority Score: ${task['score']}"),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  hintText: "အလုပ်အသစ် ရိုက်ထည့်ပါ သို့မဟုတ် အသံဖြင့် ပြောပါ...",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FloatingActionButton.small(
              backgroundColor: const Color(0xFF2563eb),
              onPressed: () {},
              child: const Icon(Icons.send, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
