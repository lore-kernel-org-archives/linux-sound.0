From: Gael Queri <gael@abul.org>
Date: Sun, 09 Dec 2001 22:28:46 +0000
Subject: patch for detection of another SB Vibra 16C brand
MIME-Version: 1
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Message-Id: <marc-linux-sound-100793706908637@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, here is a patch to enable sb_card.c to recognize another
vibra 16 card. (This was tested with 2.4.16)

Regards, Gael

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: attachment; filename=patch-v16c
Content-Transfer-Encoding: quoted-printable

--- drivers/sound/sb_card.c.old	Thu Oct 11 18:43:30 2001
+++ drivers/sound/sb_card.c	Sun Dec  9 23:26:22 2001
@@ -56,6 +56,9 @@
  *
  * 01-10-2001 Added a new flavor of Creative SB AWE64 PnP (CTL00E9).
  *      Jerome Cornet <jcornet@free.fr>
+ *
+ * 09-12-2001 Added a new flavor of Creative SB Vibra 16C (CTL0072).
+ *      Ga=EBl Qu=E9ri <gael@lautre.net>=20
  */
=20
 #include <linux/config.h>
@@ -337,6 +340,11 @@
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0001),
 		0,0,0,0,
 		0,1,1,-1},
+	{"Sound Blaster Vibra16C",
+		ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0072),
+		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0001),
+		0,0,0,0,
+		0,1,1,-1},
 	{"Sound Blaster Vibra16CL",=20
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0080),=20
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0041),
@@ -572,6 +580,9 @@
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0001), 0 },
=20
 	{	ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0070),=20
+		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0001), 0 },
+
+	{	ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0072),
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0001), 0 },
=20
 	{	ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0080),=20

--h31gzZEtNLTqOjlF--
