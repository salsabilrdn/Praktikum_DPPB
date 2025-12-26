import 'package:flutter/material.dart';

class LamaranPage extends StatefulWidget {
  const LamaranPage({super.key});

  @override
  State<LamaranPage> createState() => _LamaranPageState();
}

class _LamaranPageState extends State<LamaranPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample data for applications
  final List<Map<String, dynamic>> _lamaranProses = [
    {
      'posisi': 'Staff IT',
      'perusahaan': 'PT Maju Jaya',
      'tanggal': '12-11-2025 08:30',
      'status': 'Diproses',
      'statusColor': Colors.orange,
    },
    {
      'posisi': 'Marketing Officer',
      'perusahaan': 'PT Berkah Mandiri',
      'tanggal': '15-11-2025 10:00',
      'status': 'Interview',
      'statusColor': Colors.blue,
    },
  ];

  final List<Map<String, dynamic>> _lamaranDiterima = [
    {
      'posisi': 'Admin Gudang',
      'perusahaan': 'CV Sumber Rejeki',
      'tanggal': '15-11-2025 09:00',
      'status': 'Diterima',
      'statusColor': Colors.green,
    },
  ];

  final List<Map<String, dynamic>> _lamaranDitolak = [
    {
      'posisi': 'Customer Service',
      'perusahaan': 'PT Pelayanan Prima',
      'tanggal': '10-11-2025 14:00',
      'status': 'Ditolak',
      'statusColor': Colors.red,
    },
  ];
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Lamaran'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Proses', icon: Icon(Icons.hourglass_empty)),
            Tab(text: 'Diterima', icon: Icon(Icons.check_circle)),
            Tab(text: 'Ditolak', icon: Icon(Icons.cancel)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLamaranList(_lamaranProses),
          _buildLamaranList(_lamaranDiterima),
          _buildLamaranList(_lamaranDitolak),
        ],
      ),
    );
  }

  Widget _buildLamaranList(List<Map<String, dynamic>> lamaranList) {
    if (lamaranList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Belum ada lamaran',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        // TODO: Implement refresh functionality
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lamaranList.length,
        itemBuilder: (context, index) {
          final lamaran = lamaranList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                _showLamaranDetail(context, lamaran);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lamaran['posisi'],
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                lamaran['perusahaan'],
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: lamaran['statusColor'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: lamaran['statusColor'],
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            lamaran['status'],
                            style: TextStyle(
                              color: lamaran['statusColor'],
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'Dilamar: ${lamaran['tanggal']}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLamaranDetail(BuildContext context, Map<String, dynamic> lamaran) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      lamaran['posisi'],
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: lamaran['statusColor'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: lamaran['statusColor'],
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      lamaran['status'],
                      style: TextStyle(
                        color: lamaran['statusColor'],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                lamaran['perusahaan'],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              _buildDetailRow(
                context,
                Icons.calendar_today,
                lamaran['tanggal'],
              ),
              const SizedBox(height: 24),
              const Text(
                'Timeline Lamaran:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTimeline(lamaran['status']),
              const SizedBox(height: 24),
              if (lamaran['status'] == 'Interview')
                FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur jadwal interview')),
                    );
                  },
                  icon: const Icon(Icons.event),
                  label: const Text('Lihat Jadwal Interview'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildTimeline(String status) {
    return Column(
      children: [
        _buildTimelineItem(
          'Lamaran Dikirim',
          'Lamaran Anda telah diterima',
          true,
          false,
        ),
        _buildTimelineItem(
          'Seleksi Administrasi',
          status == 'Diproses' ? 'Dalam proses' : 'Selesai',
          status != 'Diproses',
          status == 'Diproses',
        ),
        _buildTimelineItem(
          'Interview',
          status == 'Interview' ? 'Sedang berlangsung' : 'Menunggu',
          status == 'Diterima' || status == 'Ditolak',
          status == 'Interview',
        ),
        _buildTimelineItem(
          'Hasil Akhir',
          status == 'Diterima'
              ? 'Selamat! Anda diterima'
              : status == 'Ditolak'
              ? 'Mohon maaf, belum beruntung kali ini'
              : 'Menunggu',
          status == 'Diterima' || status == 'Ditolak',
          false,
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    String title,
    String subtitle,
    bool isCompleted,
    bool isCurrent,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? Colors.green
                    : isCurrent
                    ? Colors.blue
                    : Colors.grey[300],
                border: Border.all(
                  color: isCompleted
                      ? Colors.green
                      : isCurrent
                      ? Colors.blue
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            if (title != 'Hasil Akhir')
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? Colors.green : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isCurrent ? Colors.blue : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
