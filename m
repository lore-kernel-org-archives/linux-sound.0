From: Armin Groesslinger <groessli@fmi.uni-passau.de>
Date: Fri, 26 May 2000 13:03:32 +0000
Subject: [PATCH] 2.4.0-test1 & (old) Soundblaster 16 PnP
Message-Id: <marc-linux-sound-95934647700093@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I've got a (probably old?) Soundblaster 16 PnP sound card which is not
detected by Linux 2.4.0-test1's SB driver.

Here's how ISAPNP reports my SB 16:

$ cat /proc/isapnp
Card 1 'CTL0028:Creative SB16 PnP' PnP version 1.0 Product version 1.0
  Logical device 0 'CTL0031:Audio'
[...]


Below is the patch I used to make the SB driver recognize my sound card.
I hope I made the patch correctly and it can be included in the kernel.



Armin



--- 2.4.0-test1/drivers/sound/sb_card.c	Fri May 26 01:32:43 2000
+++ linux/drivers/sound/sb_card.c	Fri May 26 08:41:01 2000
@@ -265,6 +265,11 @@
 		0,0,0,0,
 		0,1,1,-1},
 	{"Sound Blaster 16", 
+		ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0028), 
+		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0031),
+		0,0,0,0,
+		0,1,1,-1},
+	{"Sound Blaster 16", 
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_DEVICE(0x0029), 
 		ISAPNP_VENDOR('C','T','L'), ISAPNP_FUNCTION(0x0031),
 		0,0,0,0,
