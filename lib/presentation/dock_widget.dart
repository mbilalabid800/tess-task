import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/dock_provider.dart';

class DockWidget extends StatelessWidget {
  const DockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dockProvider = context.watch<DockProvider>();

    return Container(
      color: Colors.black12.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(dockProvider.items.length, (index) {
          final item = dockProvider.items[index];

          return DragTarget<IconData>(
            onWillAccept: (_) => true,
            onAccept: (receivedItem) {
              final oldIndex = dockProvider.items.indexOf(receivedItem);
              dockProvider.reorderItems(oldIndex, index);
            },
            builder: (context, candidateData, rejectedData) {
              return Draggable<IconData>(
                data: item,
                feedback: Material(
                  color: Colors.transparent,
                  child: _buildIcon(item),
                ),
                childWhenDragging: const SizedBox.shrink(),
                child: _buildIcon(item),
              );
            },
          );
        }),
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      constraints: const BoxConstraints(minWidth: 48),
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.primaries[icon.hashCode % Colors.primaries.length],
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }
}
