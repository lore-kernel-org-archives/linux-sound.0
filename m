From: Christoph Hellwig <chhellwig@gmx.net>
Date: Thu, 16 Mar 2000 13:53:46 +0000
Subject: [PATH] isapnp for ad1816 (2.3.99pre1)
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Message-Id: <marc-linux-sound-95326175230359@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii

This patch adds pnp support for the ad1816 audio driver.
The pnp logic is mostly stolen from Alessandro Zummo's pnp code
in sb_card.c.

The ad1815 pnp id is from alsa, the 1816 one from my card.

Besides that, the patch changes ad1816.c to be conform to CodingStyle.

Christoph

-- 
Always remember that you are unique.  Just like everyone else.

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sound-pnp-1.diff"

diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/Makefile linux/drivers/sound/Makefile
--- linux.orig/drivers/sound/Makefile	Wed Mar 15 19:27:08 2000
+++ linux/drivers/sound/Makefile	Wed Mar 15 22:28:28 2000
@@ -18,7 +18,7 @@
 
 export-objs	:=  ad1848.o audio_syms.o midi_syms.o mpu401.o \
 		    msnd.o opl3.o sb_common.o sequencer_syms.o \
-		    sound_core.o sound_syms.o uart401.o ad1816.o \
+		    sound_core.o sound_syms.o uart401.o	\
 		    nm256_audio.o ac97.o ac97_codec.o
 
 
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/ad1816.c linux/drivers/sound/ad1816.c
--- linux.orig/drivers/sound/ad1816.c	Tue Mar 14 22:32:46 2000
+++ linux/drivers/sound/ad1816.c	Wed Mar 15 22:29:10 2000
@@ -6,16 +6,8 @@
  *
  * Based on the CS4232/AD1848 driver Copyright (C) by Hannu Savolainen 1993-1996
  *
- * This software is still under development. New versions of the driver 
- * are available from:
- * http://www.student.informatik.tu-darmstadt.de/~tek/projects/linux.html
- * or http://www.tu-darmstadt.de/~tek01/projects/linux.html
- * 
- * Please report any bugs to: tek@rbg.informatik.tu-darmstadt.de
  *
- *
- * version: 1.3
- * cvs: $Header: /home/tek/CVSROOT/sound22/ad1816.c,v 1.3 1999/04/18 16:41:41 tek Exp $
+ * version: 1.3.1
  * status: experimental
  * date: 1999/4/18
  *
@@ -34,18 +26,22 @@
  *	required by some Aztech/Newcom SC-16 cards.		1999/04/18
  *
  *	Christoph Hellwig: Adapted to module_init/module_exit.	2000/03/03
+ *
+ *	Christoph Hellwig: Added isapnp support			2000/03/15
  */
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/isapnp.h>
 #include <linux/stddef.h>
+
 #include "soundmodule.h"
 #include "sound_config.h"
 
 #define DEBUGNOISE(x)
-#define DEBUGINFO(x) 
-#define DEBUGLOG(x) x
-#define DEBUGWARN(x) x
+#define DEBUGINFO(x)
+#define DEBUGLOG(x)
+#define DEBUGWARN(x)
 
 #define CHECK_FOR_POWER { int timeout=100; \
   while (timeout > 0 && (inb(devc->base)&0x80)!= 0x80) {\
@@ -356,7 +352,7 @@
 	unsigned long flags;
 	ad1816_info    *devc = (ad1816_info *) audio_devs[dev]->devc;
 
-	DEBUGINFO (printk("ad1816: trigger called! (devc=%d,devc->base=%d\n",devc,devc->base));
+	DEBUGINFO (printk("ad1816: trigger called! (devc=%d,devc->base=%d\n", devc, devc->base));
 
 	/* mode may have changed */
 
@@ -427,70 +423,38 @@
 {
 	ad1816_info    *devc = (ad1816_info *) audio_devs[dev]->devc;
 	
-	static struct format_tbl
-	{
+	static struct format_tbl {
 		int             format;
 		unsigned char   bits;
-	}
-	format2bits[] =
-	{
-		{
-			0, 0
-		}
-		,
-		{
-			AFMT_MU_LAW, 1
-		}
-		,
-		{
-			AFMT_A_LAW, 3
-		}
-		,
-		{
-			AFMT_IMA_ADPCM, 0
-		}
-		,
-		{
-			AFMT_U8, 0
-		}
-		,
-		{
-			AFMT_S16_LE, 2
-		}
-		,
-		{
-			AFMT_S16_BE, 6
-		}
-		,
-		{
-			AFMT_S8, 0
-		}
-		,
-		{
-			AFMT_U16_LE, 0
-		}
-		,
-		{
-			AFMT_U16_BE, 0
-		}
-  };
+	} format2bits[] = {
+		{ 0, 0 },
+		{ AFMT_MU_LAW, 1 },
+		{ AFMT_A_LAW, 3 },
+		{ AFMT_IMA_ADPCM, 0 },
+		{ AFMT_U8, 0 },
+		{ AFMT_S16_LE, 2 },
+		{ AFMT_S16_BE, 6 },
+		{ AFMT_S8, 0 },
+		{ AFMT_U16_LE, 0 },
+		{ AFMT_U16_BE, 0 }
+  	};
+
 	int  i, n = sizeof (format2bits) / sizeof (struct format_tbl);
 
 	/* return current format */
-	if (arg == 0) {     
+	if (arg == 0)
 		return devc->audio_format;
-	}
 	
 	devc->audio_format = arg;
 
 	/* search matching format bits */
-	for (i = 0; i < n; i++) {
+	for (i = 0; i < n; i++)
 		if (format2bits[i].format == arg) {
 			devc->format_bits = format2bits[i].bits;
 			devc->audio_format = arg;
 			return arg;
 		}
-	}
+
 	/* Still hanging here. Something must be terribly wrong */
 	devc->format_bits = 0;
 	return devc->audio_format = AFMT_U8;
@@ -500,9 +464,8 @@
 {
 	ad1816_info    *devc = (ad1816_info *) audio_devs[dev]->devc;
 
-	if (arg != 1 && arg != 2) {
+	if (arg != 1 && arg != 2)
 		return devc->channels;
-	}
 
 	devc->channels = arg;
 	return arg;
@@ -515,9 +478,8 @@
 	unsigned long   flags;
 
 	/* is device number valid ? */
-	if (dev < 0 || dev >= num_audiodevs) { 
+	if (dev < 0 || dev >= num_audiodevs)
 		return -(ENXIO);
-	}
 
 	/* get device info of this dev */
 	devc = (ad1816_info *) audio_devs[dev]->devc; 
@@ -600,10 +562,10 @@
 
 static void ad1816_interrupt (int irq, void *dev_id, struct pt_regs *dummy)
 {
-	unsigned char   status;
-	ad1816_info    *devc;
-	int             dev;
-	unsigned long flags;
+	unsigned char	status;
+	ad1816_info	*devc;
+	int		dev;
+	unsigned long	flags;
 
 	
 	if (irq < 0 || irq > 15) {
@@ -632,18 +594,15 @@
 	
 	devc->irq_ok=1;
 
-	if (status == 0) {
+	if (status == 0)
 		DEBUGWARN(printk ("ad1816: interrupt: Got interrupt, but no reason?\n"));
-	}
-	if (devc->opened && (devc->audio_mode & PCM_ENABLE_INPUT) 
-	    && (status&64)){
+
+	if (devc->opened && (devc->audio_mode & PCM_ENABLE_INPUT) && (status&64))
 		DMAbuf_inputintr (dev);
-	}
 
-	if (devc->opened && (devc->audio_mode & PCM_ENABLE_OUTPUT) &&
-	    (status & 128)) {
+	if (devc->opened && (devc->audio_mode & PCM_ENABLE_OUTPUT) && (status & 128))
 		DMAbuf_outputintr (dev, 1);
-	}
+
 	restore_flags(flags);
 }
 
@@ -659,7 +618,7 @@
 };
 
 static char mix_cvt[101] = {
-	0, 0,3,7,10,13,16,19,21,23,26,28,30,32,34,35,37,39,40,42,
+	 0, 0, 3, 7,10,13,16,19,21,23,26,28,30,32,34,35,37,39,40,42,
 	43,45,46,47,49,50,51,52,53,55,56,57,58,59,60,61,62,63,64,65,
 	65,66,67,68,69,70,70,71,72,73,73,74,75,75,76,77,77,78,79,79,
 	80,81,81,82,82,83,84,84,85,85,86,86,87,87,88,88,89,89,90,90,
@@ -705,23 +664,23 @@
 
 static unsigned short default_mixer_levels[SOUND_MIXER_NRDEVICES] =
 {
-	0x4343,			/* Master Volume */
-	0x3232,			/* Bass */
-	0x3232,			/* Treble */
-	0x0000,			/* FM */
-	0x4343,			/* PCM */
-	0x0000,			/* PC Speaker */
-	0x0000,			/* Ext Line */
-	0x0000,			/* Mic */
-	0x0000,			/* CD */
-	0x0000,			/* Recording monitor */
-	0x0000,			/* SB PCM */
-	0x0000,			/* Recording level */
-	0x0000,			/* Input gain */
-	0x0000,			/* Output gain */
-	0x0000,			/* Line1 */
-	0x0000,			/* Line2 */
-	0x0000			/* Line3 (usually line in)*/
+	0x4343,		/* Master Volume */
+	0x3232,		/* Bass */
+	0x3232,		/* Treble */
+	0x0000,		/* FM */
+	0x4343,		/* PCM */
+	0x0000,		/* PC Speaker */
+	0x0000,		/* Ext Line */
+	0x0000,		/* Mic */
+	0x0000,		/* CD */
+	0x0000,		/* Recording monitor */
+	0x0000,		/* SB PCM */
+	0x0000,		/* Recording level */
+	0x0000,		/* Input gain */
+	0x0000,		/* Output gain */
+	0x0000,		/* Line1 */
+	0x0000,		/* Line2 */
+	0x0000		/* Line3 (usually line in)*/
 };
 
 #define LEFT_CHN	0
@@ -739,29 +698,24 @@
 	
 	n = 0;
 	/* Count selected device bits */
-	for (i = 0; i < 32; i++) {
-		if (mask & (1 << i)) {
+	for (i = 0; i < 32; i++)
+		if (mask & (1 << i))
 			n++;
-		}
-	}
 	
-	if (n == 0) {
+	if (n == 0)
 		mask = SOUND_MASK_MIC;
-	} else if (n != 1) { /* Too many devices selected */
+	else if (n != 1) { /* Too many devices selected */
 		/* Filter out active settings */
 		mask &= ~devc->recmask;	
 		
 		n = 0;
 		/* Count selected device bits */
-		for (i = 0; i < 32; i++) {	
-			if (mask & (1 << i)) {
+		for (i = 0; i < 32; i++) 
+			if (mask & (1 << i))
 				n++;
-			}
-		}
 		
-		if (n != 1) {
+		if (n != 1)
 			mask = SOUND_MASK_MIC;
-		}
 	}
 	
 	switch (mask) {
@@ -810,9 +764,8 @@
   
 	/* Reverse polarity*/
 
-	if (mix_devices[dev][chn].polarity == 1) {	
+	if (mix_devices[dev][chn].polarity == 1) 
 		newval = 100 - newval;
-	}
 
 	mask = (1 << mix_devices[dev][chn].nbits) - 1;
 	shift = mix_devices[dev][chn].bitpos;
@@ -830,12 +783,10 @@
 	DEBUGINFO(printk("ad1816: mixer_get called!\n"));
 	
 	/* range check + supported mixer check */
-	if (dev < 0 || dev >= SOUND_MIXER_NRDEVICES ) {
+	if (dev < 0 || dev >= SOUND_MIXER_NRDEVICES )
 	        return (-(EINVAL));
-	}
-	if (!((1 << dev) & devc->supported_devices)) {
+	if (!((1 << dev) & devc->supported_devices))
 		return -(EINVAL);
-	}
 	
 	return devc->levels[dev];
 }
@@ -853,27 +804,21 @@
 
 	DEBUGINFO(printk("ad1816: mixer_set called!\n"));
 	
-	if (dev < 0 || dev >= SOUND_MIXER_NRDEVICES ) {
+	if (dev < 0 || dev >= SOUND_MIXER_NRDEVICES )
 		return -(EINVAL);
-	}
 
-	if (left > 100) {
+	if (left > 100)
 		left = 100;
-	}
-	if (left < 0) {
+	if (left < 0)
 		left = 0;
-	}
-	if (right > 100) {
+	if (right > 100)
 		right = 100;
-	}
-	if (right < 0) {
+	if (right < 0)
 		right = 0;
-	}
 	
 	/* Mono control */
-	if (mix_devices[dev][RIGHT_CHN].nbits == 0) {	
+	if (mix_devices[dev][RIGHT_CHN].nbits == 0) 
 		right = left;
-	}
 	retvol = left | (right << 8);
 	
 	/* Scale it */
@@ -882,14 +827,12 @@
 	right = mix_cvt[right];
 
 	/* reject all mixers that are not supported */
-	if (!(devc->supported_devices & (1 << dev))) {
+	if (!(devc->supported_devices & (1 << dev)))
 		return -(EINVAL);
-	}
 	
 	/* sanity check */
-	if (mix_devices[dev][LEFT_CHN].nbits == 0) {
+	if (mix_devices[dev][LEFT_CHN].nbits == 0)
 		return -(EINVAL);
-	}
 
 	/* keep precise volume internal */
 	devc->levels[dev] = retvol;
@@ -905,11 +848,10 @@
 	if ( regoffs==5 || regoffs==14 || regoffs==15 ||
 	     regoffs==16 || regoffs==17 || regoffs==18 || 
 	     regoffs==19 || regoffs==39) {
-		if (left==0) {
+		if (left==0)
 			valmute |= 0x8000;
-		} else {
+		else
 			valmute &= ~0x8000;
-		}
 	}
 	ad_write (devc, regoffs, valmute); /* mute */
 
@@ -918,9 +860,9 @@
 	 */
  
 	/* Was just a mono channel */
-	if (mix_devices[dev][RIGHT_CHN].nbits == 0) {
+	if (mix_devices[dev][RIGHT_CHN].nbits == 0)
 		return retvol;		
-	}
+
 	regoffs = mix_devices[dev][RIGHT_CHN].regno;
 	val = ad_read (devc, regoffs);
 	change_bits (&val, dev, RIGHT_CHN, right);
@@ -929,11 +871,10 @@
 	if ( regoffs==5 || regoffs==14 || regoffs==15 ||
 	     regoffs==16 || regoffs==17 || regoffs==18 || 
 	     regoffs==19 || regoffs==39) {
-		if (right==0) {
+		if (right==0)
 			valmute |= 0x80;
-		} else {
+		else
 			valmute &= ~0x80;
-		}
 	}
 	ad_write (devc, regoffs, valmute); /* mute */
 	
@@ -968,11 +909,9 @@
 	
 	devc->supported_rec_devices = REC_DEVICES;
 
-	for (i = 0; i < SOUND_MIXER_NRDEVICES; i++) {
-		if (devc->supported_devices & (1 << i)) {
+	for (i = 0; i < SOUND_MIXER_NRDEVICES; i++)
+		if (devc->supported_devices & (1 << i))
 			ad1816_mixer_set (devc, i, default_mixer_levels[i]);
-		}
-	}
 	ad1816_set_recmask (devc, SOUND_MASK_MIC);
 }
 
@@ -992,22 +931,19 @@
 			switch (cmd & 0xff){
 			case SOUND_MIXER_RECSRC:
 				
-				if (get_user(val, (int *)arg)) {
+				if (get_user(val, (int *)arg))
 					return -EFAULT;
-				}
 				val=ad1816_set_recmask (devc, val);
-				        return put_user(val, (int *)arg);
+				return put_user(val, (int *)arg);
 				break;
 				
 			default:
-				if (get_user(val, (int *)arg)){
+				if (get_user(val, (int *)arg))
 					return -EFAULT;
-				}
-				if ((val=ad1816_mixer_set (devc, cmd & 0xff, val))<0) {
+				if ((val=ad1816_mixer_set (devc, cmd & 0xff, val))<0)
 				        return val;
-				} else {
+				else
 				        return put_user(val, (int *)arg);
-				}
 			}
 		} else { 
 			/* read ioctl */
@@ -1039,25 +975,22 @@
 				break;
 				
 			default:
-			        if ((val=ad1816_mixer_get (devc, cmd & 0xff))<0) {
+			        if ((val=ad1816_mixer_get (devc, cmd & 0xff))<0)
 				        return val;
-				} else {
+				else
 				        return put_user(val, (int *)arg);
-				}
 			}
 		}
-	} else {
+	} else
 		/* not for mixer */
 		return -(EINVAL);
-	}
 }
 
 /* ------------------------------------------------------------------- */
 
 /* Mixer structure */
 
-static struct mixer_operations ad1816_mixer_operations =
-{
+static struct mixer_operations ad1816_mixer_operations = {
 	"AD1816",
 	"AD1816 Mixer",
 	ad1816_mixer_ioctl
@@ -1076,7 +1009,7 @@
 	int io_base=hw_config->io_base;
 	int *osp=hw_config->osp;
 	int tmp;
-	
+
 	printk("ad1816: AD1816 sounddriver Copyright (C) 1998 by Thorsten Knabe\n");
 	printk("ad1816: io=0x%x, irq=%d, dma=%d, dma2=%d, clockfreq=%d, options=%d isadmabug=%d\n",
 	       hw_config->io_base,
@@ -1098,7 +1031,7 @@
 		printk ("ad1816: detect error - step 0\n");
 		return 0;
 	}
-  
+
 	devc->base = io_base;
 	devc->irq_ok = 0;
 	devc->irq = 0;
@@ -1126,7 +1059,8 @@
 		DEBUGLOG (printk ("ad1816: Chip is not an AD1816 (Test 2)\n"));
 		return(0);
 	}
-  
+
+
 	/* writes to ireg 10 are copied to ireg 11 */
 	ad_write(devc,10,54321); 
 	if (ad_read(devc,11)!=54321) {
@@ -1140,7 +1074,7 @@
 		DEBUGLOG (printk ("ad1816: Chip is not an AD1816 (Test 4)\n"));
 		return(0);
 	}
-	
+
 	/* bit in base +1 cannot be set to 1 */
 	tmp=inb(devc->base+1);
 	outb(0xff,devc->base+1); 
@@ -1152,7 +1086,7 @@
   
 	DEBUGLOG (printk ("ad1816: detect() - Detected OK\n"));
 	DEBUGLOG (printk ("ad1816: AD1816 Version: %d\n",ad_read(devc,45)));
-	
+
 	/*  detection was successful */
 	return 1; 
 }
@@ -1330,6 +1264,22 @@
 static int __initdata dma = -1;
 static int __initdata dma2 = -1;
 
+#if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE
+struct pci_dev	*ad1816_dev  = NULL,
+		*mpu_dev = NULL;
+
+static int activated	= 1;
+
+static int isapnp	= 1;
+static int isapnpjump	= 0;
+
+MODULE_PARM(isapnp, "i");
+MODULE_PARM(isapnpjump, "i");
+
+#else
+static int isapnp = 0;
+#endif
+
 MODULE_PARM(io,"i");
 MODULE_PARM(irq,"i");
 MODULE_PARM(dma,"i");
@@ -1337,12 +1287,132 @@
 MODULE_PARM(ad1816_clockfreq,"i");
 MODULE_PARM(options,"i");
 
+#if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE
+
+static struct pci_dev *activate_dev(char *devname, char *resname, struct pci_dev *dev)
+{
+	int err;
+	
+	if(dev->active) {
+		activated = 0;
+		return(dev);
+	}
+
+	if((err = dev->activate(dev)) < 0) {
+		printk(KERN_ERR "ad1816: %s %s config failed (out of resources?)[%d]\n",
+			devname, resname, err);
+		dev->deactivate(dev);
+		return(NULL);
+	}
+		
+	return(dev);
+}
+
+static struct pci_dev *ad1816_init_generic(struct pci_bus *bus, struct pci_dev *card,
+	struct address_info *hw_config)
+{
+	if((ad1816_dev = isapnp_find_dev(bus, card->vendor, card->device, NULL))) {
+		ad1816_dev->prepare(ad1816_dev);
+		
+		if((ad1816_dev = activate_dev("Analog Devices 1816(A)", "ad1816", ad1816_dev))) {
+			hw_config->io_base	= ad1816_dev->resource[2].start;
+			hw_config->irq		= ad1816_dev->irq_resource[0].start;
+			hw_config->dma		= ad1816_dev->dma_resource[0].start;
+			hw_config->dma2		= ad1816_dev->dma_resource[1].start;
+		}
+	}
+	
+	return(ad1816_dev);
+}
+
+static struct {
+	unsigned short vendor;
+	unsigned short function;
+	struct pci_dev * (*initfunc)(struct pci_bus*, struct pci_dev *, struct address_info *);
+	char *name;
+} isapnp_ad1816_list[] __initdata = {
+	{ISAPNP_VENDOR('A','D','S'), ISAPNP_FUNCTION(0x7150), &ad1816_init_generic, "Analog Devices 1815" },
+	{ISAPNP_VENDOR('A','D','S'), ISAPNP_FUNCTION(0x7180), &ad1816_init_generic, "Analog Devices 1816A" },
+	{0}
+};
+
+static int __init ad1816_init_isapnp(struct address_info *hw_config,
+	struct pci_bus *bus, struct pci_dev *card, int slot)
+{
+	struct pci_dev *idev = NULL;
+	
+	/* You missed the init func? That's bad. */
+	if(isapnp_ad1816_list[slot].initfunc) {
+		char *busname = bus->name[0] ? bus->name : isapnp_ad1816_list[slot].name;
+		
+		printk(KERN_INFO "ad1816: %s detected\n", busname);
+		
+		/* Initialize this baby. */
+		if((idev = isapnp_ad1816_list[slot].initfunc(bus, card, hw_config))) {
+			/* We got it. */
+
+			printk(KERN_NOTICE "ad1816: ISAPnP reports '%s' at i/o %#x, irq %d, dma %d, %d\n",
+				busname,
+				hw_config->io_base, hw_config->irq, hw_config->dma,
+				hw_config->dma2);
+			return 1;
+		} else
+			printk(KERN_INFO "ad1816: Failed to initialize %s\n", busname);
+	} else
+		printk(KERN_ERR "ad1816: Bad entry in ad1816.c PnP table\n");
+	
+	return 0;
+}
+
+/*
+ * Actually this routine will detect and configure only the first card with successful
+ * initialization. isapnpjump could be used to jump to a specific entry.
+ * Please always add entries at the end of the array.
+ * Should this be fixed? - azummo
+ */
+
+int __init ad1816_probe_isapnp(struct address_info *hw_config)
+{
+	int i;
+	
+	/* Count entries in isapnp_ad1816_list */
+	for (i = 0; isapnp_ad1816_list[i].vendor != 0; i++)
+		;
+	/* Check and adjust isapnpjump */
+	if( isapnpjump < 0 || isapnpjump > ( i - 1 ) ) {
+		printk(KERN_ERR "ad1816: Valid range for isapnpjump is 0-%d. Adjusted to 0.\n", i-1);
+		isapnpjump = 0;
+	}
+
+	 for (i = isapnpjump; isapnp_ad1816_list[i].vendor != 0; i++) {
+	 	struct pci_dev *card = NULL;
+		
+		while ((card = isapnp_find_dev(NULL, isapnp_ad1816_list[i].vendor,
+		  isapnp_ad1816_list[i].function, card)))
+			if(ad1816_init_isapnp(hw_config, card->bus, card, i))
+				return 0;
+	}
+
+	return -ENODEV;
+}
+#endif
+
 static int __init init_ad1816(void)
 {
-	cfg.io_base     = io;
-	cfg.irq         = irq;
-	cfg.dma         = dma;
-	cfg.dma2        = dma2;
+
+#if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE
+	if(isapnp && (ad1816_probe_isapnp(&cfg) < 0) ) {
+		printk(KERN_NOTICE "ad1816: No ISAPnP cards found, trying standard ones...\n");
+		isapnp = 0;
+	}
+#endif
+
+	if( isapnp == 0) {
+		cfg.io_base	= io;
+		cfg.irq		= irq;
+		cfg.dma		= dma;
+		cfg.dma2	= dma2;
+	}
 
 	if (cfg.io_base == -1 || cfg.irq == -1 || cfg.dma == -1 || cfg.dma2 == -1) {
 		printk(KERN_INFO "ad1816: dma, dma2, irq and io must be set.\n");
@@ -1352,9 +1422,11 @@
 	if (probe_ad1816(&cfg) == 0) {
 		return -ENODEV;
 	}
-	
+
 	attach_ad1816(&cfg);
 	SOUND_LOCK;
+
+	return 0;
 }
 
 static void __exit cleanup_ad1816 (void)
@@ -1370,6 +1442,11 @@
 	nr_ad1816_devs=0;
 
 	SOUND_LOCK_END;
+#if defined CONFIG_ISAPNP || defined CONFIG_ISAPNP_MODULE
+	if(activated)
+		if(ad1816_dev)
+			ad1816_dev->deactivate(ad1816_dev);
+#endif
 }
 
 module_init(init_ad1816);

--NzB8fVQJ5HfG6fxh--
