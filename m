From: Only me <XSFX@linuxfreak.com>
Date: Tue, 04 May 1999 16:16:55 +0000
Subject: small typo in gus_wave.c (very old but still unfixed) [patch]
Message-Id: <marc-linux-sound-92586206812777@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

well, I just found it annoying :)


--- linux/drivers/sound/gus_wave.c.orig	Tue May  4 18:09:00 1999
+++ linux/drivers/sound/gus_wave.c	Tue May  4 18:09:20 1999
@@ -3061,7 +3061,7 @@
 				}
 			}
 			else
-				printk(KERN_WARNING "GUS: No CS4231 ??");
+				printk(KERN_WARNING "GUS: No CS4231 ??\n");
+				/* '\n' added by XSFX@linuxfreak.com */
 #else
 			printk(KERN_ERR "GUS MAX found, but not compiled in\n");
 #endif
