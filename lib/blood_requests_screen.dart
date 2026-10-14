import 'package:flutter/material.dart';

class BloodRequestsScreen extends StatelessWidget {
  const BloodRequestsScreen({super.key});

  static const Color navy = Color(0xFF183A78);
  static const Color red = Color(0xFFC74450);
  static const Color muted = Color(0xFF7D8798);

  @override
  Widget build(BuildContext context) {
    const requests = [
      BloodRequest(
        bloodGroup: 'O-',
        units: 3,
        location:
        'Khulna City Medical College Hospital, KDA Avenue, Khulna',
      ),
      BloodRequest(
        bloodGroup: 'O+',
        units: 2,
        location:
        'Khulna City Medical College Hospital, KDA Ave...',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding =
            constraints.maxWidth < 400 ? 18.0 : 28.0;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                28,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 520,
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),

                      const Text(
                        'Blood Requests',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF202B42),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),

                      const SizedBox(height: 28),

                      ...requests.map(
                            (request) => Padding(
                          padding:
                          const EdgeInsets.only(bottom: 20),
                          child: BloodRequestCard(
                            request: request,
                          ),
                        ),
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
}

class BloodRequest {
  final String bloodGroup;
  final int units;
  final String location;

  const BloodRequest({
    required this.bloodGroup,
    required this.units,
    required this.location,
  });
}

class BloodRequestCard extends StatelessWidget {
  final BloodRequest request;

  const BloodRequestCard({
    super.key,
    required this.request,
  });

  static const Color navy = BloodRequestsScreen.navy;
  static const Color red = BloodRequestsScreen.red;
  static const Color muted = BloodRequestsScreen.muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF172B4D)
                .withValues(alpha: 0.07),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 6,
              color: red,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  15, 17, 15, 16,
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE8E9),
                            borderRadius:
                            BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'URGENT',
                            style: TextStyle(
                              color: red,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),

                        const Spacer(),

                        const Icon(
                          Icons.water_drop_rounded,
                          color: red,
                          size: 17,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          '${request.units} Units',
                          style: const TextStyle(
                            color: Color(0xFF283247),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    Text(
                      '${request.bloodGroup} Blood Needed',
                      style: const TextStyle(
                        color: Color(0xFF202B42),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: muted,
                          size: 19,
                        ),

                        const SizedBox(width: 5),

                        Expanded(
                          child: Text(
                            request.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: muted,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: navy,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
