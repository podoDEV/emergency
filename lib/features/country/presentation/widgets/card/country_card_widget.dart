import 'package:emergency/features/country/presentation/bloc/country_bloc.dart';
import 'package:emergency/features/country/presentation/pages/list/widgets/country_edit_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/country.dart';
import '../../pages/detail/country_detail_page.dart';
import '../separator_widget.dart';
import '../tag/country_precaution_level_tag_bar.dart';
import 'country_covid_widget.dart';

class CountryCardWidget extends StatelessWidget {
  final Country country;

  const CountryCardWidget({this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 230, 233, 1),
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color.fromRGBO(255, 255, 255, 1),
              onPressed: () => Navigator.pushNamed(
                  context, CountryDetailPage.routeName,
                  arguments: CountryDetailPageArguments(country)),
              child: Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 16, right: 20, bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CountryPrecautionLevelTagBar(country: country),
                        SizedBox(height: 14),

                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              country.displayName,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(48, 48, 48, 1)),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                      child: Text(
                                    '일정을 등록해주세요.',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromRGBO(116, 116, 116, 1)),
                                  )),
                                  Container(
                                      width: 24,
                                      height: 24,
                                      child: FlatButton(
                                          padding: EdgeInsets.zero,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onPressed: () {
                                            final bloc =
                                                BlocProvider.of<CountryBloc>(
                                                    context);
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (BuildContext bc) {
                                                  return CountryEditBottomSheet(
                                                      bloc: bloc,
                                                      country: country);
                                                });
                                          },
                                          child: Image.asset(
                                              'images/btn_more.png'))),
                                ]),
                          ],
                        )),
                        // SizedBox(height: 12),
                        // SeparatorWidget(
                        //     height: 2, color: Color.fromRGBO(236, 236, 236, 1)),
                        // SizedBox(height: 16),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.end,
                        //     children: [
                        //       Expanded(
                        //           child:
                        //               CountryCovidWidget(covid: country.covid)),
                        //       Container(
                        //           width: 24,
                        //           height: 24,
                        //           child: FlatButton(
                        //               padding: EdgeInsets.zero,
                        //               splashColor: Colors.transparent,
                        //               highlightColor: Colors.transparent,
                        //               onPressed: () {
                        //                 final bloc =
                        //                     BlocProvider.of<CountryBloc>(
                        //                         context);
                        //                 showModalBottomSheet(
                        //                     context: context,
                        //                     builder: (BuildContext bc) {
                        //                       return CountryEditBottomSheet(
                        //                           bloc: bloc, country: country);
                        //                     });
                        //               },
                        //               child:
                        //                   Image.asset('images/btn_more.png'))),
                        //     ])
                      ])))),
    );
  }
}
