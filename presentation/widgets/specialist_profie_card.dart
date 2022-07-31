import 'package:auto_size_text/auto_size_text.dart';
import 'package:eventie_client_app/core/domain/entities/partner_abbr.dart';
import 'package:eventie_client_app/core/presentation/widgets/buttons/card_action_like_button.dart';
import 'package:eventie_client_app/features/explore/presentation/cubit/search_specialists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import '../../../../core/presentation/dialogs/bottom_slidable_dialog.dart';
import '../../../../injector.dart';
import '../../../home/presentation/cubit/partner_details_cubit.dart';
import '../../../home/presentation/partner_card_view.dart';

class SpecialistProfileCard extends StatelessWidget {
  SpecialistProfileCard({Key? key, required this.partner}) : super(key: key);
  final PartnerAbbr partner;

  final NumberFormat formatter = NumberFormat("#,###.##", "ru");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchSpecialistsCubit>(),
      child: InkWell(
        onTap: () {
          bottomSlidableDialog(context,
              isTopPaddingRequired: true,
              builder: (ctx) => BlocProvider(
                    create: (_) => getIt<PartnerDetailsCubit>(),
                    child: PartnerCardView(partner: partner),
                  ));
        },
        child: Container(
          height: 124,
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/images/image_maksim.png',
                  cacheHeight: 118,
                  cacheWidth: 124,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              partner.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  height: 1),
                            ),
                          ),
                          CardActionLikeButton(
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                        child: AutoSizeText(
                          partner.description ?? '',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1C1C1C).withOpacity(0.5),
                              height: 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: RatingBarIndicator(
                                  // itemBuilder: (context, _) => SvgPicture.asset(
                                  //       'assets/images/star-icon.svg',
                                  //       color: Colors.yellow,
                                  //     ),
                                  itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        // size: 20,
                                        color: Color(0xffFFC85F),
                                      ),
                                  rating: partner.rating.average,
                                  // itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                  itemSize: 18,
                              ),
                            ),
                            Text(
                              '(${partner.rating.count})',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C).withOpacity(0.5),
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                      if (partner.totalPrice != null)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${formatter.format(partner.totalPrice)} ₸',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'В рассрочку ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1C1C).withOpacity(0.5),
                                height: 1,
                              ),
                            ),
                            const Text(
                              '20 000₸',
                              style: TextStyle(
                                backgroundColor: Color(0xffFFC45D),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1C1C),
                                height: 1,
                              ),
                            ),
                            Text(
                              ' x 12 мес',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1C1C).withOpacity(0.5),
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
