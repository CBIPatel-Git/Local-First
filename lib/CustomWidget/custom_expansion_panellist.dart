import '../Utility/utility_export.dart';

RxList<SubscriptionItem> subscriptionDesList = [
  SubscriptionItem(
      monthlyPrice: "\$5/Month",
      yerlyPrice: "\$50/Year",
      description: 'Get access to our model portfolio with expert investment advice',
      title: "Basic",
      isExpanded: false,
      isAnnualRunningPlan: false,
      isMonthlyRunningPlan: false),
].obs;

class CustomExpansionPanelList extends StatelessWidget {
  const CustomExpansionPanelList(
      {Key? key,
      this.children = const <ExpansionPanel>[],
      this.expansionCallback,
      this.animationDuration = kThemeAnimationDuration})
      : assert(children != null),
        assert(animationDuration != null),
        super(key: key);

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback? expansionCallback;

  final Duration animationDuration;

  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[];
    const EdgeInsets kExpandedEdgeInsets = EdgeInsets.symmetric(vertical: 0.0 - 0.0);

    for (int index = 0; index < children.length; index += 1) {
      if (_isChildExpanded(index) && index != 0 && !_isChildExpanded(index - 1)) {
        items.add(Divider(
          key: _SaltedKey<BuildContext, int>(context, index * 2 - 1),
          height: 15.0,
          color: Colors.transparent,
        ));
      }

      final Row header = Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              margin: _isChildExpanded(index) ? kExpandedEdgeInsets : EdgeInsets.zero,
              child: SizedBox(
                child: children[index].headerBuilder(
                  context,
                  children[index].isExpanded,
                ),
              ),
            ),
          ),
          ExpandIcon(
            isExpanded: _isChildExpanded(index),
            padding: const EdgeInsets.only(right: 10.0),
            onPressed: (bool isExpanded) {
              if (expansionCallback != null) expansionCallback!(index, isExpanded);
            },
          ),
        ],
      );

      items.add(
        Container(
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: offWhite),
            borderRadius: BorderRadius.circular(5),
          ),
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          child: Material(
            elevation: 0.0,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Column(
              children: <Widget>[
                header,
                AnimatedCrossFade(
                  firstChild: Container(height: 0.0),
                  secondChild: children[index].body,
                  firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                  secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                  sizeCurve: Curves.fastOutSlowIn,
                  crossFadeState: _isChildExpanded(index)
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: animationDuration,
                ),
              ],
            ),
          ),
        ),
      );

      if (_isChildExpanded(index) && index != children.length - 1) {
        items.add(Divider(
          key: _SaltedKey<BuildContext, int>(context, index * 2 + 1),
          height: 15.0,
        ));
      }
    }

    return Column(
      children: items,
    );
  }
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt && value == typedOther.value;
  }

  @override
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}

class SubscriptionItem {
  SubscriptionItem({
    this.isExpanded = false,
    required this.title,
    required this.description,
    required this.monthlyPrice,
    required this.yerlyPrice,
    required this.isAnnualRunningPlan,
    required this.isMonthlyRunningPlan,
  });

  String description;
  String title;
  String monthlyPrice;
  String yerlyPrice;
  bool isExpanded;
  bool isAnnualRunningPlan;
  bool isMonthlyRunningPlan;
}
