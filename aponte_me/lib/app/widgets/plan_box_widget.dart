import 'package:flutter/material.dart';

class PlanBoxWidget extends StatefulWidget {
  const PlanBoxWidget({
    super.key,
    required int previousSelectedCard,
  });

  @override
  State<PlanBoxWidget> createState() => _PlanBoxWidgetState();
}

class _PlanBoxWidgetState extends State<PlanBoxWidget> {
  final List<OptionItem> annualPlanOptions = [
    OptionItem(
      icon: Icons.pedal_bike,
      description: 'Frete Grátis',
    ),
    OptionItem(
      icon: Icons.diversity_3,
      description: 'Até 5 contatos de emergência',
    ),
    OptionItem(
      icon: Icons.qr_code,
      description: '3 QrCodes',
    ),
  ];

  final List<OptionItem> monthlyPlanOptions = [
    OptionItem(
      icon: Icons.diversity_3,
      description: 'Até 3 contatos de emergência',
    ),
    OptionItem(
      icon: Icons.qr_code,
      description: '2 QrCodes',
    ),
  ];

  int selectedCardIndex = -1;

  /*_PlanBoxWidgetState() {
    selectedCardIndex = 0;
  }*/

  void selectCard(previousSelectedCard) {
    setState(() {
      selectedCardIndex = previousSelectedCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlanBoxCardWidget(
          cardKey: Key(selectedCardIndex.toString()),
          cardColor: Theme.of(context).colorScheme.primary,
          cardTitle: '1 ano',
          cardTitleFontColor: Theme.of(context).colorScheme.onPrimary,
          cardTitleFontSize: 20.0,
          cardTitleFontWeight: FontWeight.bold,
          cardDiscountAvaliable: true,
          cardDiscount: '31% OFF',
          cardDiscountSavings: 'Economize R\$54,00',
          cardAnnualPlan: true,
          cardOptions: annualPlanOptions,
          cardSelected: selectedCardIndex == 0,
          cardOnSelected: () => selectCard(0),
        ),
        const SizedBox(height: 8.0),
        PlanBoxCardWidget(
          cardKey: Key(selectedCardIndex.toString()),
          cardColor: Theme.of(context).colorScheme.primaryContainer,
          cardTitle: '1 mês',
          cardTitleFontColor: Theme.of(context).colorScheme.onPrimaryContainer,
          cardTitleFontSize: 20.0,
          cardTitleFontWeight: FontWeight.bold,
          cardAnnualPlan: false,
          cardOptions: monthlyPlanOptions,
          cardSelected: selectedCardIndex == 1,
          cardOnSelected: () => selectCard(1),
        ),
      ],
    );
  }
}

class OptionItem {
  OptionItem({
    required this.icon,
    required this.description,
  });

  final IconData icon;
  final String description;
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.description,
    required this.descriptionFontColor,
    required this.descriptionFontSize,
    required this.descriptionFontWeight,
  });

  final IconData icon;
  final Color iconColor;
  final String description;
  final Color descriptionFontColor;
  final double descriptionFontSize;
  final FontWeight descriptionFontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.0,
            color: iconColor,
          ),
          const SizedBox(width: 4.0),
          Text(
            description,
            style: TextStyle(
              color: descriptionFontColor,
              fontSize: descriptionFontSize,
              fontWeight: descriptionFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}

class PlanBoxCardWidget extends StatefulWidget {
  PlanBoxCardWidget({
    super.key,
    required this.cardKey,
    required this.cardColor, // Initialize the color parameter
    required this.cardTitle,
    required this.cardTitleFontColor,
    required this.cardTitleFontSize,
    required this.cardTitleFontWeight,
    this.cardDiscountAvaliable = false,
    this.cardDiscount,
    this.cardDiscountSavings,
    required this.cardOptions,
    required this.cardAnnualPlan,
    required this.cardOnSelected,
    required this.cardSelected,
  });

  final Key cardKey;
  final Color cardColor;
  final String cardTitle;
  final Color cardTitleFontColor;
  final double cardTitleFontSize;
  final FontWeight cardTitleFontWeight;
  bool cardDiscountAvaliable = false;
  final String? cardDiscount;
  final String? cardDiscountSavings;
  final List<OptionItem> cardOptions;
  final bool cardAnnualPlan;
  bool cardSelected = false;
  final VoidCallback? cardOnSelected;

  @override
  State<PlanBoxCardWidget> createState() => _PlanBoxCardWidgetState();
}

class _PlanBoxCardWidgetState extends State<PlanBoxCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.cardOnSelected,
      child: Container(
        decoration: widget.cardSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.inverseSurface,
                    Theme.of(context).colorScheme.surfaceTint,
                    Theme.of(context).colorScheme.onSurfaceVariant,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0.0, 5.0),
                  ),
                ],
              )
            : null,
        transform: widget.cardSelected
            ? Matrix4.translationValues(0.0, -5.0, 0.0)
            : Matrix4.translationValues(0.0, 0.0, 0.0),
        width: 235.0,
        constraints: const BoxConstraints(
          minHeight: 160.0, // Set your desired minimum height
          // maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Card(
          key: widget.cardKey,
          color: widget.cardColor,
          elevation: widget.cardSelected ? 15.0 : 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.cardTitle,
                      style: TextStyle(
                        color: widget.cardTitleFontColor,
                        fontSize: widget.cardTitleFontSize,
                        fontWeight: widget.cardTitleFontWeight,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    if (widget.cardDiscountAvaliable)
                      SizedBox(
                        height: 11.0,
                        child: Text(
                          widget.cardDiscount ?? '',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                if (widget.cardDiscountAvaliable)
                  Center(
                    child: Text(
                      widget.cardDiscountSavings ?? '',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 12.0,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 16.0),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.cardAnnualPlan)
                          for (OptionItem option in widget.cardOptions)
                            OptionWidget(
                              icon: option.icon,
                              iconColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              description: option.description,
                              descriptionFontColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              descriptionFontSize: 14.0,
                              descriptionFontWeight: FontWeight.bold,
                            )
                        else if (!widget.cardAnnualPlan)
                          for (OptionItem option in widget.cardOptions)
                            OptionWidget(
                              icon: option.icon,
                              iconColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              description: option.description,
                              descriptionFontColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              descriptionFontSize: 14.0,
                              descriptionFontWeight: FontWeight.bold,
                            ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Column(
                  children: [
                    /*if (widget.cardDiscountAvaliable)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'R\$174,00',
                            style: TextStyle(
                              color: widget.cardAnnualPlan
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),*/
                    // const SizedBox(width: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cardAnnualPlan ? 'R\$120,00*' : 'R\$14,90',
                          style: TextStyle(
                            color: widget.cardAnnualPlan
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.cardAnnualPlan ? 'por ano' : 'por mês',
                          style: TextStyle(
                            color: widget.cardAnnualPlan
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
