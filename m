From: Christoph Hellwig <chhellwig@gmx.net>
Date: Sun, 27 Feb 2000 17:12:05 +0000
Subject: [PATCH] Yet another sound/oss cleanup
MIME-Version: 1
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Message-Id: <marc-linux-sound-95168245928396@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii

After I've removed the legacy defines of the old oss code, this is another step towards a clean
sound code.

This patch is at this time only for one sound card (ad1816), but if gets accepted I'll patch
all sound cards in this way.

It removes the need to put each soundcard in the ugly sound_drivers[] array in dev_table.h and
now you don't have to compile the irq/io/dma values into the kernel image. Instead they can be
specified on the kernel comandline using soundcard=<io>,<irq>,<dma>,<dma2>.

Christoph

-- 
Always remember that you are unique.  Just like everyone else.

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sound-4b.diff"

diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/Config.in linux/drivers/sound/Config.in
--- linux.orig/drivers/sound/Config.in	Sun Feb 27 17:42:11 2000
+++ linux/drivers/sound/Config.in	Sun Feb 27 18:10:54 2000
@@ -87,13 +87,6 @@
 
    if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
       dep_tristate '    AD1816(A) based cards (EXPERIMENTAL)' CONFIG_SOUND_AD1816 $CONFIG_SOUND
-      if [ "$CONFIG_SOUND_AD1816" = "y" ]; then
-	 hex 'AD1816 audio I/O base 530, 604, E80 or F40' CONFIG_AD1816_BASE 530
-	 int 'AD1816 audio IRQ 5, 7, 9, 11, 12 or 15' CONFIG_AD1816_IRQ 7
-	 int 'AD1816 audio DMA 0, 1 or 3' CONFIG_AD1816_DMA 0
-	 int 'AD1816 second (duplex) DMA 0, 1 or 3' CONFIG_AD1816_DMA2 3
-	 int 'AD1816 clock chip frequency' CONFIG_AD1816_CLOCK 33000
-      fi
    fi
 
    dep_tristate '    Aztech Sound Galaxy (non-PnP) cards' CONFIG_SOUND_SGALAXY $CONFIG_SOUND_OSS
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/ad1816.c linux/drivers/sound/ad1816.c
--- linux.orig/drivers/sound/ad1816.c	Sun Feb 27 17:44:17 2000
+++ linux/drivers/sound/ad1816.c	Sun Feb 27 17:47:20 2000
@@ -53,9 +53,9 @@
 	
 */
 
-#include <linux/config.h>
 #include <linux/module.h>
 #include <linux/stddef.h>
+#include <linux/init.h>
 #include "soundmodule.h"
 #include "sound_config.h"
 
@@ -97,9 +97,7 @@
 	int            irq_ok;
 	int            *osp;
   
-}
-
-ad1816_info;
+} ad1816_info;
 
 static int  nr_ad1816_devs = 0;
 
@@ -1098,7 +1096,6 @@
 	int tmp;
 	
 	printk("ad1816: AD1816 sounddriver Copyright (C) 1998 by Thorsten Knabe\n");
-	printk("ad1816: $Header: /home/tek/CVSROOT/sound22/ad1816.c,v 1.3 1999/04/18 16:41:41 tek Exp $\n");
 	printk("ad1816: io=0x%x, irq=%d, dma=%d, dma2=%d, clockfreq=%d, options=%d isadmabug=%d\n",
 	       hw_config->io_base,
 	       hw_config->irq,
@@ -1308,6 +1305,7 @@
 				       devc)) >= 0) {
 		audio_devs[my_dev]->min_fragment = 0;
 	}
+	SOUND_LOCK;
 }
 
 void unload_card(ad1816_info *devc)
@@ -1344,52 +1342,11 @@
 	}
 }
 
-void unload_ad1816 (struct address_info *hw_config)
-{
-	int          i;
-	ad1816_info  *devc = NULL;
-  
-	/* remove any soundcard */
-	if (hw_config==NULL) {
-		for (i = 0;  i < nr_ad1816_devs; i++) {
-			devc = &dev_info[i];
-			unload_card(devc);
-		}     
-		nr_ad1816_devs=0;
-	} else { 
-		/* remove specified soundcard */
-		for (i = 0; i < nr_ad1816_devs; i++) {
-		        int j;
-			
-			if (dev_info[i].base == hw_config->io_base) {
-				devc = &dev_info[i];
-				unload_card(devc);
-				nr_ad1816_devs--;
-				for ( j=i; j < nr_ad1816_devs ; j++) {
-					dev_info[j] = dev_info[j+1];
-				}
-				i--;
-			}
-		}
-	}
-}
-
-
-/* ----------------------------- 2.1.xxx module stuff ----------------- */
-
-EXPORT_SYMBOL(ad1816_interrupt);
-EXPORT_SYMBOL(probe_ad1816);
-EXPORT_SYMBOL(attach_ad1816);
-EXPORT_SYMBOL(unload_ad1816);
-
-
 #ifdef MODULE
-
 int             io = -1;
 int             irq = -1;
 int             dma = -1;
 int             dma2 = -1;
-
 MODULE_PARM(io,"i");
 MODULE_PARM(irq,"i");
 MODULE_PARM(dma,"i");
@@ -1397,33 +1354,41 @@
 MODULE_PARM(ad1816_clockfreq,"i");
 MODULE_PARM(options,"i");
 
-struct address_info cfg;
-
-
 int init_module(void)
 {
-        if (io == -1 || irq == -1 || dma == -1 || dma2 == -1) {
-		printk("ad1816: dma, dma2, irq and io must be set.\n");
-                return -EINVAL;
-        }
-        cfg.io_base = io;
-        cfg.irq = irq;
-        cfg.dma = dma;
-        cfg.dma2 = dma2;
+	if (io == -1 || irq == -1 || dma == -1 || dma2 == -1) {
+		printk(KERN_INFO "ad1816: dma, dma2, irq and io must be set.\n");
+		return -EINVAL;
+	}
 	
-        if (probe_ad1816(&cfg) == 0) {
-                return -ENODEV;
+	cfg.io_base     = io;
+	cfg.irq         = irq;
+	cfg.dma         = dma;
+	cfg.dma2        = dma2;
+
+	if (probe_ad1816(&cfg) == 0) {
+		return -ENODEV;
 	}
-        attach_ad1816(&cfg);
-        SOUND_LOCK;
-        return 0;
+	
+	attach_ad1816(&cfg);
 }
 
-
-void cleanup_module(void)
+void cleanup_module (void)
 {
-        unload_ad1816(NULL);
-        SOUND_LOCK_END;
+	int          i;
+	ad1816_info  *devc = NULL;
+  
+	/* remove any soundcard */
+	for (i = 0;  i < nr_ad1816_devs; i++) {
+		devc = &dev_info[i];
+		unload_card(devc);
+	}     
+	nr_ad1816_devs=0;
+
+	SOUND_LOCK_END;
 }
+#endif
 
-#endif /* MODULE */
+EXPORT_SYMBOL(ad1816_interrupt);
+EXPORT_SYMBOL(probe_ad1816);
+EXPORT_SYMBOL(attach_ad1816);
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/dev_table.c linux/drivers/sound/dev_table.c
--- linux.orig/drivers/sound/dev_table.c	Sun Feb 27 17:44:17 2000
+++ linux/drivers/sound/dev_table.c	Sun Feb 27 17:32:01 2000
@@ -15,13 +15,13 @@
 #include <linux/config.h>
 #include <linux/init.h>
 
-
 #define _DEV_TABLE_C_
 #include "sound_config.h"
 
 int softoss_dev = 0;
 int sound_started = 0;
 int sndtable_get_cardcount(void);
+struct address_info cfg;
 
 int snd_find_driver(int type)
 {
@@ -71,6 +71,10 @@
 		sound_preinit_lowlevel_drivers();
 	}
 #endif
+#ifdef CONFIG_SOUND_AD1816
+	if (probe_ad1816(&cfg))
+		attach_ad1816(&cfg);
+#endif
 
 /*
  * Check the number of cards actually defined in the table
@@ -620,3 +624,25 @@
 		sound_timer_devs[dev] = NULL;
 }
 
+#ifndef MODULE
+void soundcard_setup(char *str)
+{
+	/* io, irq, dma, dma2 */
+	int ints[5];
+	str = get_options(str, ARRAY_SIZE(ints), ints);
+
+	cfg.io_base = ints[1];
+	cfg.irq     = ints[2];
+	cfg.dma     = ints[3];
+	cfg.dma2    = ints[4];
+
+	printk("soundcard: io=%x, irq=%d, dma=%d, dma2=%d\n",
+
+	cfg.io_base,
+	cfg.irq,
+	cfg.dma,
+	cfg.dma2);
+}
+
+__setup("soundcard=", soundcard_setup);
+#endif
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/dev_table.h linux/drivers/sound/dev_table.h
--- linux.orig/drivers/sound/dev_table.h	Sun Feb 27 17:44:17 2000
+++ linux/drivers/sound/dev_table.h	Sun Feb 27 17:31:14 2000
@@ -418,11 +418,6 @@
 	{"SGALAXY", 0, SNDCARD_SGALAXY,	"Sound Galaxy WSS",		attach_sgalaxy, probe_sgalaxy, unload_sgalaxy},
 #endif
 
-#ifdef CONFIG_SOUND_AD1816
-        {"AD1816", 0, SNDCARD_AD1816,   "AD1816",               attach_ad1816, 
-probe_ad1816, unload_ad1816},
-#endif
-
 #ifdef CONFIG_SOUND_YM3812
 	{"OPL3", 0, SNDCARD_ADLIB,	"OPL-2/OPL-3 FM",		attach_adlib_card, probe_adlib, unload_adlib},
 #endif
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/soundcard.c linux/drivers/sound/soundcard.c
--- linux.orig/drivers/sound/soundcard.c	Sun Feb 27 17:44:17 2000
+++ linux/drivers/sound/soundcard.c	Sun Feb 27 17:36:32 2000
@@ -484,10 +484,8 @@
 	}
 	in_use++;
 
-#ifdef CONFIG_MODULES
 	notifier_call_chain(&sound_locker, 1, 0);
 	lock_depth++;
-#endif
 
 	return 0;
 }
@@ -522,10 +520,8 @@
 	}
 	in_use--;
 
-#ifdef CONFIG_MODULES
 	notifier_call_chain(&sound_locker, 0, 0);
 	lock_depth--;
-#endif
 
 	return 0;
 }
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/soundmodule.h linux/drivers/sound/soundmodule.h
--- linux.orig/drivers/sound/soundmodule.h	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/soundmodule.h	Sun Feb 27 17:36:47 2000
@@ -2,12 +2,11 @@
 #define _SOUNDMODULE_H
 
 #include <linux/notifier.h>
+#include <linux/module.h>
 
 extern struct notifier_block *sound_locker;
 extern void sound_notifier_chain_register(struct notifier_block *);
 
-#ifdef MODULE
-
 #define SOUND_LOCK		sound_notifier_chain_register(&sound_notifier); 
 #define SOUND_LOCK_END		notifier_chain_unregister(&sound_locker, &sound_notifier)
 
@@ -27,5 +26,4 @@
 	0
 };
 
-#endif
 #endif

--opJtzjQTFsWo+cga--
