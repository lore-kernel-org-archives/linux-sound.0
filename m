From: Jan Niehusmann <jan@gondor.com>
Date: Mon, 29 May 2000 23:44:20 +0000
Subject: cmpci spdif in/out
Message-Id: <marc-linux-sound-95964476831040@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I didn't read this list until yesterday, so I don't know if something 
similar has been discussed here.

The patch below enables S/PDIF input and output on cmi8338 soundcards. 
It's against the current 3.21 cmpci driver from www.cmedia.com.tw.

(lupo@aitek.it provides patches to make it work with 2.3.99-kernels
on http://web.tiscalinet.it/luvassu)

Unfortunately it doesn't give perfect results - a file piped through 
an spdif channel shows lost bytes, duplicated bytes and random corruption.
This corruption can hardly be heard, but I think spidif should allow 
perfect transfers.

Any ideas?

Jan


--- linux/drivers/sound/cmpci.c.orig	Mon May 29 15:29:40 2000
+++ linux/drivers/sound/cmpci.c	Mon May 29 18:03:47 2000
@@ -62,6 +62,7 @@
  *                     Add support for modem, S/PDIF loop and 4 channels.
  *                     (8738 only)
  *                     Fix bug cause x11amp cannot play.
+ *    29.05.00	       Added support for S/PDIF in/out (jan@gondor.com)
  *
  *    28.05.00         Patches for kernel 2.4 compliance (lupo@aitek.it)
  */
@@ -2984,11 +2403,17 @@
 
 #ifdef MODULE
 int	spdif_loop = 0;
+int	spdif_in = 1;
+int	spdif_out = 1;
+int	spdif_32 = 0;
 int	four_ch = 0;
 int	rear_out = 0;
 int	modem = 0;
 int	joystick = 0;
 MODULE_PARM(spdif_loop, "i");
+MODULE_PARM(spdif_in, "i");
+MODULE_PARM(spdif_out, "i");
+MODULE_PARM(spdif_32, "i");
 MODULE_PARM(four_ch, "i");
 MODULE_PARM(rear_out, "i");
 MODULE_PARM(modem, "i");
@@ -2999,6 +2424,15 @@
 #ifdef CONFIG_SOUND_CMPCI_SPDIFLOOP
 int	spdif_loop = 1;
 #endif
+#ifdef CONFIG_SOUND_CMPCI_SPDIFIN
+int	spdif_in = 1;
+#endif
+#ifdef CONFIG_SOUND_CMPCI_SPDIFOUT
+int	spdif_out = 1;
+#endif
+#ifdef CONFIG_SOUND_CMPCI_SPDIF32
+int	spdif_32 = 1;
+#endif
 #ifdef CONFIG_SOUND_CMPCI_4CH
 int	four_ch = 1;
 #endif
@@ -3158,15 +2584,6 @@
 				outb(inb((s->iobase + CODEC_CMI_MISC_CTRL) | 0x80) & ~0x40, s->iobase + CODEC_CMI_MISC_CTRL);
 				printk(KERN_INFO "cm: modem function supported\n");
 			}
-			/* enable SPDIF loop */
-			if (spdif_loop)
-			{
-				/* turn on spdif-in to spdif-out */
-				outb(inb(s->iobase + CODEC_CMI_FUNCTRL1) | 0x80, s->iobase + CODEC_CMI_FUNCTRL1);
-				printk(KERN_INFO "cm: Enable SPDIF loop\n");
-			}
-			else
-				outb(inb(s->iobase + CODEC_CMI_FUNCTRL1) & ~0x80, s->iobase + CODEC_CMI_FUNCTRL1);
 			/* enable 4 channels mode */
 			if (four_ch)
 			{
@@ -3188,6 +2605,41 @@
 			else
 				outb(inb(s->iobase + CODEC_CMI_MISC_CTRL + 3) & ~0x04, s->iobase + CODEC_CMI_MISC_CTRL + 3);
 		}
+		/* enable SPDIF loop */
+		if (spdif_loop)
+		{
+			/* turn on spdif-in to spdif-out */
+			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1) | 0x80, s->iobase + CODEC_CMI_FUNCTRL1);
+			printk(KERN_INFO "cm: Enable SPDIF loop\n");
+		}
+		else
+			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1) & ~0x80, s->iobase + CODEC_CMI_FUNCTRL1);
+		/* enable SPDIF 32-bit-mode (untested) */
+		if (spdif_32)
+		{
+			/* turn on 32 bit (SPD32SEL) */
+			outb(inb(s->iobase + CODEC_CMI_MISC_CTRL + 2) | 0x20, s->iobase + CODEC_CMI_MISC_CTRL + 2);
+			printk(KERN_INFO "cm: Enable SPDIF32 \n");
+		}
+		else
+			outb(inb(s->iobase + CODEC_CMI_MISC_CTRL + 2) & ~0x20, s->iobase + CODEC_CMI_MISC_CTRL + 2);
+		/* enable SPDIF in */
+		if (spdif_in)
+		{
+			/* turn on spdif in */
+			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1 + 1) | 0x02, s->iobase + CODEC_CMI_FUNCTRL1 + 1);
+			printk(KERN_INFO "cm: Enable SPDIF in \n");
+		}
+		else
+			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1 + 1) & ~0x02, s->iobase + CODEC_CMI_FUNCTRL1 + 1);
+		if (spdif_out)
+		{
+			/* turn on spdif out */
+			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1 + 1) | 0x01, s->iobase + CODEC_CMI_FUNCTRL1 + 1);
+			printk(KERN_INFO "cm: Enable SPDIF out \n");
+		}
+		else
+			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1 + 1) & ~0x01, s->iobase + CODEC_CMI_FUNCTRL1 + 1);
 		/* enable joystick */
 		if (joystick)
 			outb(inb(s->iobase + CODEC_CMI_FUNCTRL1) | 0x02, s->iobase + CODEC_CMI_FUNCTRL1);
--- linux/drivers/sound/Config.in.orig	Fri May 12 03:30:14 2000
+++ linux/drivers/sound/Config.in	Mon May 29 15:32:11 2000
@@ -12,6 +12,11 @@
 dep_tristate '  C-Media PCI (CMI8338/8378)' CONFIG_SOUND_CMPCI $CONFIG_SOUND
 if [ "$CONFIG_SOUND_CMPCI" = "y" -o "$CONFIG_SOUND_CMPCI" = "m" ]; then
     bool '    Enable S/PDIF loop for CMI8738' CONFIG_SOUND_CMPCI_SPDIFLOOP
+    bool '    Enable S/PDIF in for CMI8738' CONFIG_SOUND_CMPCI_SPDIFIN
+    bool '    Enable S/PDIF out for CMI8738' CONFIG_SOUND_CMPCI_SPDIFOUT
+    if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
+	    bool '    Enable S/PDIF 32bit-mode for CMI8738' CONFIG_SOUND_CMPCI_SPDIF32
+    fi
     bool '    Enable 4 channel mode for CMI8738' CONFIG_SOUND_CMPCI_4CH
     if [ "$CONFIG_SOUND_CMPCI_4CH" = "y" ]; then
         bool '    Separate rear out jack' CONFIG_SOUND_CMPCI_REAR
