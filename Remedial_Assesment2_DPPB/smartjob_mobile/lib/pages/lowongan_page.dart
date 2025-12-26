import 'package:flutter/material.dart';

class LowonganPage extends StatefulWidget {
  const LowonganPage({super.key});

  @override
  State<LowonganPage> createState() => _LowonganPageState();
}

class _LowonganPageState extends State<LowonganPage> {
  // Sample data for job listings
  final List<Map<String, dynamic>> _lowonganList = [
    {
      'posisi': 'Staff IT',
      'perusahaan': 'PT Maju Jaya',
      'lokasi': 'Soreang',
      'tipe': 'Full-time',
    },
    {
      'posisi': 'Admin Gudang',
      'perusahaan': 'CV Sumber Rejeki',
      'lokasi': 'Cileunyi',
      'tipe': 'Kontrak',
    },
    {
      'posisi': 'Marketing Officer',
      'perusahaan': 'PT Berkah Mandiri',
      'lokasi': 'Baleendah',
      'tipe': 'Full-time',
    },
    {
      'posisi': 'Operator Produksi',
      'perusahaan': 'CV Karya Sejahtera',
      'lokasi': 'Majalaya',
      'tipe': 'Shift',
    },
    {
      'posisi': 'Customer Service',
      'perusahaan': 'PT Pelayanan Prima',
      'lokasi': 'Dayeuhkolot',
      'tipe': 'Full-time',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Lowongan Pekerjaan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter functionality
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Implement refresh functionality
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _lowonganList.length,
          itemBuilder: (context, index) {
            final lowongan = _lowonganList[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {
                  // TODO: Navigate to detail page
                  _showJobDetail(context, lowongan);
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
                            child: Text(
                              lowongan['posisi'],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {
                              // TODO: Implement bookmark functionality
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        lowongan['perusahaan'],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16),
                          const SizedBox(width: 4),
                          Text(lowongan['lokasi']),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              lowongan['tipe'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
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
      ),
    );
  }

  void _showJobDetail(BuildContext context, Map<String, dynamic> job) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Text(
                job['posisi'],
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                job['perusahaan'],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              _buildDetailRow(context, Icons.location_on, job['lokasi']),
              _buildDetailRow(context, Icons.work, job['tipe']),
              const SizedBox(height: 24),
              const Text(
                'Deskripsi Pekerjaan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Navigate to apply page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur melamar akan segera tersedia'),
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Lamar Sekarang'),
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
}
