import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;

  CustomAppBar({
    required this.title,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[800],
      elevation: 0,
      leading: leading != null
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0), // Ajusta el espacio
              child: leading!,
            )
          : null,
      actions: [
        if (trailing != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0), // Ajusta el espacio
            child: trailing!,
          ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      top:
                          25.0), // Ajusta este valor para mover el título más abajo
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth *
                          0.6, // Ajusta según sea necesario
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
