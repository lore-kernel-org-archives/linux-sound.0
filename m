From: =?ISO-8859-1?Q?P=E5l-Kristian?= Engstad <engstad@worldnet.att.net>
Date: Fri, 26 May 2000 04:27:19 +0000
Subject: Patch for Creative SB AWE64 Gold ISAPnP card.
Message-Id: <marc-linux-sound-95931685010223@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

The following patch worked like a charm for me.
No more need for isapnp tools!

PKE.

--- sb_card.c.orig Thu May 25 09:15:18 2000
+++ sb_card.c   Thu May 25 21:22:17 2000
@@ -40,7 +40,9 @@
  *  Thanks to Ga=EBl Qu=E9ri and Alessandro Zummo for testing and fixes.
  *  Paul E. Laufer <pelaufer@csupomona.edu>
  *
- * 06-05-2000 added another card. Daniel M. Newman <dmnewman@pobox.com>
+ * 06-05-2000 Added another card. Daniel M. Newman <dmnewman@pobox.com>
+ *
+ * 25-05-2000 Added Creative SB AWE64 Gold. P=E5l-Kristian Engstad <engsta=
d@att.net>
  *
  */
=20
@@ -452,6 +454,11 @@
        ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x2001),
        ISAPNP_VENDOR('@','H','@'), ISAPNP_FUNCTION(0x0001),
        1,0,0,0},
+   {"Creative SB AWE64 Gold",
+           ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x00B2),
+           ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0044),
+           0,0,0,0,
+           0,1,1,-1},
    {0}
 };
                      =20
