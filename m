From: Rui Sousa <rsousa@grad.physics.sunysb.edu>
Date: Wed, 11 Aug 1999 15:53:20 +0000
Subject: [PATCH] MAD16 module
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------A689E0AC59CC3F9CE4810AF2"
Message-Id: <marc-linux-sound-93439969129444@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------A689E0AC59CC3F9CE4810AF2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Patch to correct the problem I mentioned before.
Now the cdrom controller gets properly initialized and
for the people not using the cdrom controller (like me)
things don't get messed up.



-- 
Rui Sousa
--------------A689E0AC59CC3F9CE4810AF2
Content-Type: text/plain; charset=us-ascii;
 name="mad16.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mad16.patch"

diff -ur linux-2.2/Documentation/sound/MAD16 linux-2.2.new/Documentation/sound/MAD16
--- linux-2.2/Documentation/sound/MAD16	Thu Apr 29 19:53:41 1999
+++ linux-2.2.new/Documentation/sound/MAD16	Wed Aug 11 16:23:09 1999
@@ -32,3 +32,22 @@
 options mad16 io=0x530 irq=7 dma=0 dma16=1 mpu_io=816 mpu_irq=5 && /usr/local/bin/aumix -w 15 -p 20 -m 0 -1 0 -2 0 -3 0 -i 0
 
 The addition of the "mpu_io=816 mpu_irq=5" to the mad16 options line is
+
+------------------------------------------------------------------------
+The mad16 module in addition supports the following options:
+
+option:			meaning:			default:
+joystick=0,1 		disabled, enabled 		disabled
+cdtype=0x00,0x02,0x04,	disabled, Sony CDU31A,		disabled
+       0x06,0x08,0x0a   Mitsumi, Panasonic,
+			Secondary IDE, Primary IDE 
+cdport=0x340,0x320,					0x340
+       0x330,0x360
+cdirq=0,3,5,7,9,10,11 	disabled, IRQ3, ... 		disabled
+cddma=0,5,6,7 		disabled, DMA5, ... 		DMA5 for Mitsumi or IDE
+cddma=0,1,2,3 		disabled, DMA1, ... 		DMA3 for Sony or Panasonic
+opl4=0,1 		OPL3, OPL4 			OPL3	
+
+for more details see linux/drivers/sound/mad16.c
+
+Rui Sousa
diff -ur linux-2.2/drivers/sound/mad16.c linux-2.2.new/drivers/sound/mad16.c
--- linux-2.2/drivers/sound/mad16.c	Tue Aug 10 14:42:26 1999
+++ linux-2.2.new/drivers/sound/mad16.c	Wed Aug 11 16:04:55 1999
@@ -889,7 +889,7 @@
 int             cdtype = 0;
 int             cdirq = 0;
 int             cdport = 0x340;
-int             cddma = 3;
+int             cddma = -1;
 int             opl4 = 0;
 int             joystick = 0;
 
@@ -949,23 +949,28 @@
 			break;
 		case 0x02:
 			printk("Sony CDU31A");
-			dmatype = 2;
+			dmatype = 1;
+			if(cddma == -1) cddma = 3;
 			break;
 		case 0x04:
 			printk("Mitsumi");
-			dmatype = 1;
+			dmatype = 0;
+			if(cddma == -1) cddma = 5;
 			break;
 		case 0x06:
 			printk("Panasonic Lasermate");
-			dmatype = 2;
+			dmatype = 1;
+			if(cddma == -1) cddma = 3;
 			break;
 		case 0x08:
 			printk("Secondary IDE");
-			dmatype = 1;
+			dmatype = 0;
+			if(cddma == -1) cddma = 5;
 			break;
 		case 0x0A:
 			printk("Primary IDE");
-			dmatype = 1;
+			dmatype = 0;
+			if(cddma == -1) cddma = 5;
 			break;
 		default:
 			printk("\n");
@@ -973,8 +978,16 @@
 			return -EINVAL;
 	}
 
-	if (dmatype)
-	{
+ 	/*
+         *    Build the config words
+         */
+
+        mad16_conf = (joystick ^ 1) | cdtype;
+	mad16_cdsel = 0;
+        if (opl4)
+                mad16_cdsel |= 0x20;
+
+	if(cdtype){
 		if (cddma > 7 || cddma < 0 || dma_map[dmatype][cddma] == -1)
 		{
 			printk("\n");
@@ -985,58 +998,51 @@
 			printk(", DMA %d", cddma);
 		else
 			printk(", no DMA");
-	}
-	if (cdtype && !cdirq)
-		printk(", no IRQ");
-	else if (cdirq < 0 || cdirq > 15 || irq_map[cdirq] == -1)
-	{
-		  printk(", invalid IRQ (disabling)");
-		  cdirq = 0;
-	}
-	else printk(", IRQ %d", cdirq);
-
-	printk(".\n");
-	printk(KERN_INFO "Joystick port ");
-	if (joystick == 1)
-		printk("enabled.\n");
-	else
-	{
-		joystick = 0;
-		printk("disabled.\n");
-	}
 
-	/*
-	 *    Build the config words
-	 */
+		if (!cdirq)
+			printk(", no IRQ");
+		else if (cdirq < 0 || cdirq > 15 || irq_map[cdirq] == -1)
+		{
+		  	printk(", invalid IRQ (disabling)");
+		  	cdirq = 0;
+		}
+		else printk(", IRQ %d", cdirq);
 
-	mad16_conf = (joystick ^ 1) | cdtype;
-	mad16_cdsel = 0;
-	if (opl4)
-		mad16_cdsel |= 0x20;
-	mad16_cdsel |= dma_map[dmatype][cddma];
+		mad16_cdsel |= dma_map[dmatype][cddma];
 
-	if (cdtype < 0x08)
-	{
-		switch (cdport)
+		if (cdtype < 0x08)
 		{
-			case 0x340:
-				mad16_cdsel |= 0x00;
-				break;
-			case 0x330:
-				mad16_cdsel |= 0x40;
-				break;
-			case 0x360:
-				mad16_cdsel |= 0x80;
-				break;
-			case 0x320:
-				mad16_cdsel |= 0xC0;
-				break;
-			default:
-				printk(KERN_ERR "Unknown CDROM I/O base %d\n", cdport);
-				return -EINVAL;
+			switch (cdport)
+			{
+				case 0x340:
+					mad16_cdsel |= 0x00;
+					break;
+				case 0x330:
+					mad16_cdsel |= 0x40;
+					break;
+				case 0x360:
+					mad16_cdsel |= 0x80;
+					break;
+				case 0x320:
+					mad16_cdsel |= 0xC0;
+					break;
+				default:
+					printk(KERN_ERR "Unknown CDROM I/O base %d\n", cdport);
+					return -EINVAL;
+			}
 		}
+		mad16_cdsel |= irq_map[cdirq];
 	}
-	mad16_cdsel |= irq_map[cdirq];
+
+	printk(".\n");
+        printk(KERN_INFO "Joystick port ");
+        if (joystick == 1)
+                printk("enabled.\n");
+        else
+        {
+                joystick = 0;
+                printk("disabled.\n");
+        }
 
 	config.io_base = io;
 	config.irq = irq;
Only in linux-2.2.new: log

--------------A689E0AC59CC3F9CE4810AF2--
