From: Tim Schmielau <tim@physik3.uni-rostock.de>
Date: Sun, 22 Sep 2002 11:45:50 +0000
Subject: [patch] fix compares of jiffies
Message-Id: <marc-linux-sound-103269521400485@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dear Linux kernel code maintainer,

on rechecking the current stable kernel code, I found some places where jiffies
were compared in a way that seems to break when they wrap. For these,
I made up patches to use the macros "time_before()" or "time_after()"
that are supposed to handle wraparound correctly.

For a small part of the patches, I believe you to be the relevant kernel code
maintainer. Appended to this email you will find some lines explaining
why I decided to mail or cc: you on this (an extract of the copyright notice
or the MAINTAINERS file), followed by the patch itself. If I mailed you
in error, please drop me a short note.

I kindly ask you to approve the correctness of the patch, and pass it on to
the relevant people for inclusion into the mainline kernel.

Thanks,
Tim Schmielau (tim@physik3.uni-rostock.de)



 * 04-07-1999: Anthony Barbachan <barbcode@xmen.cis.fordham.edu>
 *          Added module parameter pss_firmware to allow the user to tell 
 *          the driver where the fireware file is located.  The default 
 *          setting is the previous hardcoded setting "/etc/sound/pss_synth".


--- linux-2.4.20-pre6/drivers/sound/pss.c	Wed Sep 11 13:36:53 2002
+++ linux-2.4.20-pre6-jfix/drivers/sound/pss.c	Wed Sep 11 12:58:44 2002
@@ -263,7 +263,7 @@
 	unsigned long   i, limit = jiffies + HZ/10;
 
 	outw(0x2000, REG(PSS_CONTROL));
-	for (i = 0; i < 32768 && (limit-jiffies >= 0); i++)
+	for (i = 0; i < 32768 && time_before_eq(jiffies, limit); i++)
 		inw(REG(PSS_CONTROL));
 	outw(0x0000, REG(PSS_CONTROL));
 	return 1;
@@ -362,11 +362,11 @@
 		outw(0, REG(PSS_DATA));
 
 		limit = jiffies + HZ/10;
-		for (i = 0; i < 32768 && (limit - jiffies >= 0); i++)
+		for (i = 0; i < 32768 && time_before_eq(jiffies, limit); i++)
 			val = inw(REG(PSS_STATUS));
 
 		limit = jiffies + HZ/10;
-		for (i = 0; i < 32768 && (limit-jiffies >= 0); i++)
+		for (i = 0; i < 32768 && time_before_eq(jiffies, limit); i++)
 		{
 			val = inw(REG(PSS_STATUS));
 			if (val & 0x4000)

