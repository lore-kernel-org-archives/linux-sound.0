From: Christoph Hellwig <chhellwig@gmx.net>
Date: Thu, 24 Feb 2000 20:11:59 +0000
Subject: [PATCH] removal of legacy sound defines
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Message-Id: <marc-linux-sound-95143229508229@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii

Hi, this patch removes all the sound (oss) legacy defines.
Since Alan modularized the oss code, the semed to be no new free
version of OSS, so it might be usefull to remove the legacy defines.

Christoph

-- 
Always remember that you are unique.  Just like everyone else.

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sound.diff"

diff -rNu linux.orig/drivers/sound/README.CONFIG linux/drivers/sound/README.CONFIG
--- linux.orig/drivers/sound/README.CONFIG	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/README.CONFIG	Thu Jan  1 01:00:00 1970
@@ -1,75 +0,0 @@
-Sound Driver Configuration Notes
-Michael Chastain, <mailto:mec@shout.net>
-18 Apr 1998
-
-The Linux sound driver is derived from OSS/Free, a multi-platform
-Unix sound driver by Hannu Savolainen.  You can find out
-more about OSS/Free and the commercial version, OSS/Linux, at
-<http://www.opensound.com/ossfree>.
-
-OSS/Free comes with the configuration program 'configure.c'.  We have
-discarded that program in favor of a standard Linux configuration file
-Config.in.
-
-Config.in defines a set of symbols with the form CONFIG_SOUND_*.
-These are the -native symbols-.  Here is a description:
-
-    CONFIG_SOUND
-
-	This is the master symbol.  It controls whether the basic
-	sound-driver code is resident, modular, or not present at all.
-
-	If the basic driver is resident, each primary and secondary
-	driver can be resident, modular, or not present.
-
-	If the basic driver is modular, each primary and secondary driver
-	can be modular or not present.
-
-	And if the basic driver is not present, all other drivers are
-	not present, too.
-
-    Primary drivers
-
-	These are symbols such as CONFIG_SOUND_SB, CONFIG_SOUND_SB_MODULE,
-	CONFIG_SOUND_TRIX, or CONFIG_SOUND_TRIX_MODULE.  Each driver
-	that the user can directly select is a primary driver and has
-	the usual pair of symbols: one resident and one modular.
-
-	Each primary driver can be either resident or modular.
-
-    Secondary drivers
-
-	Primary drivers require the support of secondary drivers, such
-	as ad1848.o and uart401.o.
-
-	In Makefile, each primary driver has a list of required secondary
-	drivers.  The secondary driver requirements are merged and a
-	single definition is emitted at the end.
-
-	For each secondary driver: if any resident primary driver
-	requires it, that secondary driver will be resident.  If no
-	resident primary driver requires it but some modular primary
-	driver requires it, then that secondary driver will be modular.
-	Otherwise that secondary driver will be not present.
-
-	OSS/Free also contains tests for secondary drivers.  The Makefile
-	defines symbols for these drivers in EXTRA_CFLAGS.
-
-    CONFIG_AUDIO, CONFIG_MIDI, CONFIG_SEQUENCER
-
-	These three drivers are like secondary drivers, but not quite.
-	They can not yet be separated into modules.  They are always
-	linked into the basic sound driver, whether they are needed
-	or not.  (This is in case a primary driver is added to the
-	system later, as a module, and needs these facilities.	If it
-	were possible to modularise them, then they would get built as
-	additional modules at that time).
-
-The OSS/Free code does not use the native symbols directly, primarily
-because it does not know about modules.  I could edit the code, but that
-would make it harder to upgrade to new versions of OSS/Free.  Instead,
-the OSS/Free code continues to use -legacy symbols-.
-
-legacy.h defines all the legacy symbols to 1.  This is because, whenever
-OSS/Free tests a symbol, the Makefile has already arranged for that
-driver to be included.
diff -rNu linux.orig/drivers/sound/ad1816.c linux/drivers/sound/ad1816.c
--- linux.orig/drivers/sound/ad1816.c	Mon May 10 22:01:21 1999
+++ linux/drivers/sound/ad1816.c	Thu Feb 24 19:53:46 2000
@@ -59,8 +59,6 @@
 #include "soundmodule.h"
 #include "sound_config.h"
 
-#ifdef CONFIG_AD1816
-
 #define DEBUGNOISE(x)
 #define DEBUGINFO(x) 
 #define DEBUGLOG(x) x
@@ -1429,5 +1427,3 @@
 }
 
 #endif /* MODULE */
-
-#endif /* CONFIG_AD1816 */
diff -rNu linux.orig/drivers/sound/ad1848.c linux/drivers/sound/ad1848.c
--- linux.orig/drivers/sound/ad1848.c	Sat Feb 19 18:38:58 2000
+++ linux/drivers/sound/ad1848.c	Thu Feb 24 19:53:38 2000
@@ -40,9 +40,6 @@
 #define DEB(x)
 #define DEB1(x)
 #include "sound_config.h"
-
-#ifdef CONFIG_AD1848
-
 #include "ad1848_mixer.h"
 
 typedef struct
@@ -113,7 +110,7 @@
 	-1, -1, -1, -1, -1, -1, -1, -1, -1
 };
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS) || defined(MODULE)
+#ifdef MODULE
 
 static int timer_installed = -1;
 
@@ -167,7 +164,7 @@
 static void     ad1848_halt_output(int dev);
 static void     ad1848_trigger(int dev, int bits);
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS)
+#ifndef EXCLUDE_TIMERS
 static int ad1848_tmr_install(int dev);
 static void ad1848_tmr_reprogram(int dev);
 
@@ -1131,7 +1128,7 @@
 	restore_flags(flags);
 	devc->xfer_count = 0;
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS)
+#ifndef EXCLUDE_TIMERS
 	if (dev == timer_installed && devc->timer_running)
 		if ((fs & 0x01) != (old_fs & 0x01))
 		{
@@ -1245,7 +1242,7 @@
 	restore_flags(flags);
 	devc->xfer_count = 0;
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS)
+#ifndef EXCLUDE_TIMERS
 	if (dev == timer_installed && devc->timer_running)
 	{
 		if ((fs & 0x01) != (old_fs & 0x01))
@@ -1931,7 +1928,7 @@
 		}
 		if (capabilities[devc->model].flags & CAP_F_TIMER)
 		{
-#ifndef __SMP__
+#ifndef CONFIG_SMP
 			int x;
 			unsigned char tmp = ad_read(devc, 16);
 #endif			
@@ -1940,7 +1937,7 @@
 
 			ad_write(devc, 21, 0x00);	/* Timer MSB */
 			ad_write(devc, 20, 0x10);	/* Timer LSB */
-#ifndef __SMP__
+#ifndef CONFIG_SMP
 			ad_write(devc, 16, tmp | 0x40);	/* Enable timer */
 			for (x = 0; x < 100000 && devc->timer_ticks == 0; x++);
 			ad_write(devc, 16, tmp & ~0x40);	/* Disable timer */
@@ -1961,7 +1958,7 @@
 	} else if (irq < 0)
 		irq2dev[-irq] = devc->dev_no = my_dev;
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS)
+#ifndef EXCLUDE_TIMERS
 	if ((capabilities[devc->model].flags & CAP_F_TIMER) &&
 	    devc->irq_ok)
 		ad1848_tmr_install(my_dev);
@@ -2146,7 +2143,7 @@
 		if (devc->model != MD_1848 && (alt_stat & 0x40))	/* Timer interrupt */
 		{
 			devc->timer_ticks++;
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS)
+#ifndef EXCLUDE_TIMERS
 			if (timer_installed == dev && devc->timer_running)
 				sound_timer_interrupt();
 #endif
@@ -2583,7 +2580,7 @@
 	release_region(hw_config->io_base, 4);
 }
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS)
+#ifndef EXCLUDE_TIMERS
 
 /*
  * Timer stuff (for /dev/music).
@@ -2693,7 +2690,7 @@
 
 	return 1;
 }
-#endif
+#endif /* EXCLUDE_TIMERS */
 
 
 EXPORT_SYMBOL(ad1848_detect);
@@ -2757,5 +2754,4 @@
 		unload_ms_sound(&hw_config);
 }
 
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/adlib_card.c linux/drivers/sound/adlib_card.c
--- linux.orig/drivers/sound/adlib_card.c	Fri Nov 12 13:29:47 1999
+++ linux/drivers/sound/adlib_card.c	Thu Feb 24 19:54:24 2000
@@ -65,4 +65,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/audio.c linux/drivers/sound/audio.c
--- linux.orig/drivers/sound/audio.c	Sat Feb 19 18:38:58 2000
+++ linux/drivers/sound/audio.c	Thu Feb 24 19:55:02 2000
@@ -29,8 +29,6 @@
 #include <linux/kmod.h>
 
 #include "sound_config.h"
-
-#ifdef CONFIG_AUDIO
 #include "ulaw.h"
 #include "coproc.h"
 
@@ -516,8 +514,6 @@
 	 * NOTE! This routine could be called several times during boot.
 	 */
 }
-
-#endif
 
 void reorganize_buffers(int dev, struct dma_buffparms *dmap, int recording)
 {
diff -rNu linux.orig/drivers/sound/cs4232.c linux/drivers/sound/cs4232.c
--- linux.orig/drivers/sound/cs4232.c	Sun Dec 27 19:53:45 1998
+++ linux/drivers/sound/cs4232.c	Thu Feb 24 19:56:15 2000
@@ -176,7 +176,6 @@
 		 * Initialize logical device 3 (MPU)
 		 */
 
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 		if (mpu_base != 0 && mpu_irq != 0)
 		{
 			CS_OUT2(0x15, 0x03);	/* Select logical device 3 (MPU) */
@@ -184,7 +183,6 @@
 			CS_OUT2(0x22, mpu_irq);	/* MPU IRQ */
 			CS_OUT2(0x33, 0x01);	/* Activate logical dev 3 */
 		}
-#endif
 
 		if(synth_base != 0)
 		{
@@ -238,7 +236,6 @@
 		AD1848_REROUTE(SOUND_MIXER_LINE2, SOUND_MIXER_CD);
 		AD1848_REROUTE(SOUND_MIXER_LINE3, SOUND_MIXER_SYNTH);		/* FM synth */
 	}
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	if (mpu_base != 0 && mpu_irq != 0)
 	{
 		static struct address_info hw_config2 = {
@@ -266,7 +263,6 @@
 		}
 		hw_config->slots[1] = hw_config2.slots[1];
 	}
-#endif
 }
 
 void unload_cs4232(struct address_info *hw_config)
@@ -284,7 +280,6 @@
 		      0);
 
 	sound_unload_audiodev(hw_config->slots[0]);
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	if (mpu_base != 0 && mpu_irq != 0 && mpu_detected)
 	{
 		static struct address_info hw_config2 =
@@ -305,7 +300,6 @@
 
 		unload_uart401(&hw_config2);
 	}
-#endif
 }
 
 void unload_cs4232_mpu(struct address_info *hw_config)
@@ -397,4 +391,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/dev_table.c linux/drivers/sound/dev_table.c
--- linux.orig/drivers/sound/dev_table.c	Sat Feb 19 18:39:27 2000
+++ linux/drivers/sound/dev_table.c	Thu Feb 24 19:57:13 2000
@@ -43,7 +43,6 @@
 		return;		/* No cards detected */
 #endif
 
-#ifdef CONFIG_AUDIO
 	if (num_audiodevs)	/* Audio devices present */
 	{
 		int             dev;
@@ -52,7 +51,6 @@
 		}
 		audio_init_devices();
 	  }
-#endif
 
 	return;
 }
@@ -410,7 +408,6 @@
 			int driver_size, int flags, unsigned int format_mask,
 			void *devc, int dma1, int dma2)
 {
-#ifdef CONFIG_AUDIO
 	struct audio_driver *d;
 	struct audio_operations *op;
 	int l, num;
@@ -470,9 +467,6 @@
 
 	audio_init_devices();
 	return num;
-#else
-	return -EINVAL;
-#endif
 }
 
 int sound_install_mixer(int vers, char *name, struct mixer_operations *driver,
@@ -544,7 +538,6 @@
 
 int sound_alloc_mididev(void)
 {
-#ifdef CONFIG_MIDI
 	int i = register_sound_midi(&oss_sound_fops, -1);
 	if(i==-1)
 		return i;
@@ -552,9 +545,6 @@
 	if(i>=num_midis)
 		num_midis = i + 1;
 	return i;
-#else
-	return (-1);
-#endif
 }
 
 int sound_alloc_synthdev(void)
@@ -611,13 +601,11 @@
 
 void sound_unload_mididev(int dev)
 {
-#ifdef CONFIG_MIDI
 	if (dev != -1)
 	{
 		midi_devs[dev] = NULL;
 		unregister_sound_midi((dev<<4)+2);
 	}
-#endif
 }
 
 void sound_unload_synthdev(int dev)
diff -rNu linux.orig/drivers/sound/dev_table.h linux/drivers/sound/dev_table.h
--- linux.orig/drivers/sound/dev_table.h	Sat Feb 19 18:39:27 2000
+++ linux/drivers/sound/dev_table.h	Thu Feb 24 20:39:33 2000
@@ -357,7 +357,7 @@
 struct synth_operations *synth_devs[MAX_SYNTH_DEV+MAX_MIDI_DEV] = {NULL}; int num_synths = 0;
 struct midi_operations *midi_devs[MAX_MIDI_DEV] = {NULL}; int num_midis = 0;
 
-#if defined(CONFIG_SEQUENCER) && !defined(EXCLUDE_TIMERS) && !defined(VMIDI)
+#ifndef EXCLUDE_TIMERS
 extern struct sound_timer_operations default_sound_timer;
 struct sound_timer_operations *sound_timer_devs[MAX_TIMER_DEV] = {
 	&default_sound_timer, NULL
@@ -386,11 +386,9 @@
 #ifdef CONFIG_GUS16
 	{"GUS16", 0, SNDCARD_GUS16,	"Ultrasound 16-bit opt.",	attach_gus_db16, probe_gus_db16, unload_gus_db16},
 #endif
-#ifdef CONFIG_GUS
 	{"GUS", 0, SNDCARD_GUS,	"Gravis Ultrasound",	attach_gus_card, probe_gus, unload_gus},
 	{"GUSPNP", 1, SNDCARD_GUSPNP,	"GUS PnP",	attach_gus_card, probe_gus, unload_gus},
 #endif
-#endif
 
 #ifdef CONFIG_SOUND_MSS
 	{"MSS", 0, SNDCARD_MSS,	"MS Sound System",	attach_ms_sound, probe_ms_sound, unload_ms_sound},
@@ -433,11 +431,11 @@
 	{"PAS16", 0, SNDCARD_PAS,	"ProAudioSpectrum",	attach_pas_card, probe_pas, unload_pas},
 #endif
 
-#if (defined(CONFIG_SOUND_MPU401) || defined(CONFIG_SOUND_MPU_EMU)) && defined(CONFIG_MIDI)
+#if (defined(CONFIG_SOUND_MPU401) || defined(CONFIG_SOUND_MPU_EMU))
 	{"MPU401", 0, SNDCARD_MPU401,"Roland MPU-401",	attach_mpu401, probe_mpu401, unload_mpu401},
 #endif
 
-#if defined(CONFIG_SOUND_UART401) && defined(CONFIG_MIDI)
+#if defined(CONFIG_SOUND_UART401)
 	{"UART401", 0, SNDCARD_UART401,"MPU-401 (UART)", 
 		attach_uart401, probe_uart401, unload_uart401},
 #endif
@@ -450,7 +448,7 @@
 	{"MAUI", 0, SNDCARD_MAUI,"TB Maui",	attach_maui, probe_maui, unload_maui},
 #endif
 
-#if defined(CONFIG_SOUND_UART6850) && defined(CONFIG_MIDI)
+#if defined(CONFIG_SOUND_UART6850)
 	{"MIDI6850", 0, SNDCARD_UART6850,"6860 UART Midi",	attach_uart6850, probe_uart6850, unload_uart6850},
 #endif
 
@@ -461,10 +459,8 @@
 	{"SBLAST", 0, SNDCARD_SB,	"Sound Blaster",		attach_sb_card, probe_sb, unload_sb},
 	{"SBPNP", 6, SNDCARD_SBPNP,	"Sound Blaster PnP",		attach_sb_card, probe_sb, unload_sb},
 
-#ifdef CONFIG_MIDI
 	{"SBMPU", 0, SNDCARD_SB16MIDI,"SB MPU-401",	attach_sbmpu, probe_sbmpu, unload_sbmpu},
 #endif
-#endif
 
 #ifdef CONFIG_SOUND_SSCAPE
 	{"SSCAPE", 0, SNDCARD_SSCAPE, "Ensoniq SoundScape",	attach_sscape, probe_sscape, unload_sscape},
@@ -488,7 +484,7 @@
 		attach_softsyn_card, probe_softsyn, unload_softsyn},
 #endif
 
-#if defined(CONFIG_SOUND_VMIDI) && defined(CONFIG_MIDI)
+#ifdef CONFIG_SOUND_VMIDI
 	{"VMIDI", 0, SNDCARD_VMIDI,"Loopback MIDI Device",      attach_v_midi, probe_v_midi, unload_v_midi},
 #endif
 #ifdef CONFIG_SOUND_VIDC
@@ -503,8 +499,6 @@
 int num_sound_drivers = sizeof(sound_drivers) / sizeof (struct driver_info);
 
 
-#ifndef FULL_SOUND
-
 /*
  *	List of devices actually configured in the system.
  *
@@ -632,7 +626,7 @@
 	{SNDCARD_MAUI, {CONFIG_MAUI_BASE, CONFIG_MAUI_IRQ, 0, -1}, SND_DEFAULT_ENABLE},
 #endif
 
-#if defined(CONFIG_SOUND_MPU401) && defined(CONFIG_MIDI)
+#ifdef CONFIG_SOUND_MPU401
 	{SNDCARD_MPU401, {CONFIG_MPU_BASE, CONFIG_MPU_IRQ, 0, -1}, SND_DEFAULT_ENABLE},
 #ifdef MPU2_BASE
 	{SNDCARD_MPU401, {MPU2_BASE, MPU2_IRQ, 0, -1}, SND_DEFAULT_ENABLE},
@@ -642,12 +636,12 @@
 #endif
 #endif
 
-#if defined(CONFIG_SOUND_UART6850) && defined(CONFIG_MIDI)
+#ifdef CONFIG_SOUND_UART6850
 	{SNDCARD_UART6850, {CONFIG_U6850_BASE, CONFIG_U6850_IRQ, 0, -1}, SND_DEFAULT_ENABLE},
 #endif
 
 #ifdef CONFIG_SOUND_SB
-#if defined(CONFIG_MIDI) && defined(CONFIG_SB_MPU_BASE)
+#ifdef CONFIG_SB_MPU_BASE
 	{SNDCARD_SB16MIDI,{CONFIG_SB_MPU_BASE, CONFIG_SB_MPU_IRQ, 0, -1}, SND_DEFAULT_ENABLE},
 #endif
 #endif
@@ -666,7 +660,7 @@
 	{SNDCARD_ADLIB, {FM_MONO, 0, 0, -1}, SND_DEFAULT_ENABLE},
 #endif
 
-#if defined(CONFIG_SOUND_VMIDI) && defined(CONFIG_MIDI)
+#ifdef CONFIG_SOUND_VMIDI
 	{SNDCARD_VMIDI, {0, 0, 0, -1}, SND_DEFAULT_ENABLE},
 #endif
 
@@ -683,13 +677,7 @@
 int num_sound_cards = sizeof(snd_installed_cards) / sizeof (struct card_info);
 static int max_sound_cards =  sizeof(snd_installed_cards) / sizeof (struct card_info);
 
-#else
-int num_sound_cards = 0;
-struct card_info snd_installed_cards[20] = {{0}};
-static int max_sound_cards = 20;
-#endif
-
-#if defined(MODULE) || (!defined(linux) && !defined(_AIX))
+#if defined(MODULE)
 int trace_init = 0;
 #else
 int trace_init = 1;
diff -rNu linux.orig/drivers/sound/dmabuf.c linux/drivers/sound/dmabuf.c
--- linux.orig/drivers/sound/dmabuf.c	Sat Oct  2 16:49:30 1999
+++ linux/drivers/sound/dmabuf.c	Thu Feb 24 20:04:39 2000
@@ -29,8 +29,6 @@
 
 #include "sound_config.h"
 
-#if defined(CONFIG_AUDIO) || defined(CONFIG_GUS)
-
 #define DMAP_FREE_ON_CLOSE      0
 #define DMAP_KEEP_ON_CLOSE      1
 extern int sound_dmap_flag;
@@ -1286,5 +1284,3 @@
 			sound_free_dmap(adev->dmap_in);
 	}
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/finetune.h linux/drivers/sound/finetune.h
--- linux.orig/drivers/sound/finetune.h	Tue Sep 30 17:46:44 1997
+++ linux/drivers/sound/finetune.h	Thu Jan  1 01:00:00 1970
@@ -1,32 +0,0 @@
-#ifdef SEQUENCER_C
-/*
- * Copyright (C) by Hannu Savolainen 1993-1997
- *
- * OSS/Free for Linux is distributed under the GNU GENERAL PUBLIC LICENSE (GPL)
- * Version 2 (June 1991). See the "COPYING" file distributed with this software
- * for more info.
- */
-
-
-  unsigned short finetune_table[128] =
-	{
-/*   0 */  9439,  9447,  9456,  9464,  9473,  9481,  9490,  9499, 
-/*   8 */  9507,  9516,  9524,  9533,  9542,  9550,  9559,  9567, 
-/*  16 */  9576,  9585,  9593,  9602,  9611,  9619,  9628,  9637, 
-/*  24 */  9645,  9654,  9663,  9672,  9680,  9689,  9698,  9707, 
-/*  32 */  9715,  9724,  9733,  9742,  9750,  9759,  9768,  9777, 
-/*  40 */  9786,  9795,  9803,  9812,  9821,  9830,  9839,  9848, 
-/*  48 */  9857,  9866,  9874,  9883,  9892,  9901,  9910,  9919, 
-/*  56 */  9928,  9937,  9946,  9955,  9964,  9973,  9982,  9991, 
-/*  64 */ 10000, 10009, 10018, 10027, 10036, 10045, 10054, 10063, 
-/*  72 */ 10072, 10082, 10091, 10100, 10109, 10118, 10127, 10136, 
-/*  80 */ 10145, 10155, 10164, 10173, 10182, 10191, 10201, 10210, 
-/*  88 */ 10219, 10228, 10237, 10247, 10256, 10265, 10274, 10284, 
-/*  96 */ 10293, 10302, 10312, 10321, 10330, 10340, 10349, 10358, 
-/* 104 */ 10368, 10377, 10386, 10396, 10405, 10415, 10424, 10433, 
-/* 112 */ 10443, 10452, 10462, 10471, 10481, 10490, 10499, 10509, 
-/* 120 */ 10518, 10528, 10537, 10547, 10556, 10566, 10576, 10585
-	};
-#else
-  extern unsigned short finetune_table[128];
-#endif
diff -rNu linux.orig/drivers/sound/gus_card.c linux/drivers/sound/gus_card.c
--- linux.orig/drivers/sound/gus_card.c	Thu Mar 11 02:03:52 1999
+++ linux/drivers/sound/gus_card.c	Thu Feb 24 20:40:00 2000
@@ -26,8 +26,6 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#ifdef CONFIG_GUS
-
 #include "gus_hw.h"
 
 void            gusintr(int irq, void *dev_id, struct pt_regs *dummy);
@@ -55,9 +53,7 @@
 	if (hw_config->dma2 != -1 && hw_config->dma2 != hw_config->dma)
 		if (sound_alloc_dma(hw_config->dma2, "GUS(2)"))
 			printk(KERN_ERR "gus_card.c: Can't allocate DMA channel %d\n", hw_config->dma2);
-#ifdef CONFIG_MIDI
 	gus_midi_init(hw_config);
-#endif
 	if(request_irq(hw_config->irq, gusintr, 0,  "Gravis Ultrasound", hw_config)<0)
 		printk(KERN_ERR "gus_card.c: Unable to allocate IRQ %d\n", hw_config->irq);
 
@@ -156,28 +152,20 @@
 		}
 		if (src & (MIDI_TX_IRQ | MIDI_RX_IRQ))
 		{
-#ifdef CONFIG_MIDI
 			gus_midi_interrupt(0);
-#endif
 		}
 		if (src & (GF1_TIMER1_IRQ | GF1_TIMER2_IRQ))
 		{
-#ifdef CONFIG_SEQUENCER
 			if (gus_timer_enabled)
 				sound_timer_interrupt();
 			gus_write8(0x45, 0);	/* Ack IRQ */
 			gus_timer_command(4, 0x80);		/* Reset IRQ flags */
-#else
-			gus_write8(0x45, 0);	/* Stop timers */
-#endif
 		}
 		if (src & (WAVETABLE_IRQ | ENVELOPE_IRQ))
 			gus_voice_irq();
 	}
 }
 
-#endif
-
 /*
  *	Some extra code for the 16 bit sampling option
  */
@@ -191,10 +179,8 @@
 
 void attach_gus_db16(struct address_info *hw_config)
 {
-#ifdef CONFIG_GUS
 	gus_pcm_volume = 100;
 	gus_wave_volume = 90;
-#endif
 
 	hw_config->slots[3] = ad1848_init("GUS 16 bit sampling", hw_config->io_base,
 					  hw_config->irq,
@@ -292,4 +278,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/gus_midi.c linux/drivers/sound/gus_midi.c
--- linux.orig/drivers/sound/gus_midi.c	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/gus_midi.c	Thu Feb 24 20:06:09 2000
@@ -12,14 +12,9 @@
  */
 #include <linux/config.h>
 
-
 #include "sound_config.h"
-
 #include "gus_hw.h"
 
-#ifdef CONFIG_GUS
-#ifdef CONFIG_MIDI
-
 static int      midi_busy = 0, input_opened = 0;
 static int      my_dev;
 static int      output_used = 0;
@@ -265,6 +260,3 @@
 	}
 	restore_flags(flags);
 }
-
-#endif
-#endif
diff -rNu linux.orig/drivers/sound/gus_vol.c linux/drivers/sound/gus_vol.c
--- linux.orig/drivers/sound/gus_vol.c	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/gus_vol.c	Thu Feb 24 20:06:23 2000
@@ -12,7 +12,6 @@
 #include <linux/config.h>
 
 #include "sound_config.h"
-#ifdef CONFIG_GUS
 #include "gus_linearvol.h"
 
 #define GUS_VOLUME	gus_wave_volume
@@ -152,5 +151,3 @@
 #endif
 	return gus_linearvol[(((vol * mainvol) / 127) * mixer_mainvol) / 100];
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/gus_wave.c linux/drivers/sound/gus_wave.c
--- linux.orig/drivers/sound/gus_wave.c	Wed May 12 08:40:50 1999
+++ linux/drivers/sound/gus_wave.c	Thu Feb 24 20:07:15 2000
@@ -25,8 +25,6 @@
 #include <linux/ultrasound.h>
 #include "gus_hw.h"
 
-#ifdef CONFIG_GUS
-
 #define GUS_BANK_SIZE (((iw_mode) ? 256*1024*1024 : 256*1024))
 
 #define MAX_SAMPLE	150
@@ -3111,9 +3109,7 @@
 		hw_config->slots[0] = sdev;
 		synth_devs[sdev] = &guswave_operations;
 		sequencer_init();
-#ifdef CONFIG_SEQUENCER
 		gus_tmr_install(gus_base + 8);
-#endif
 	}
 
 	reset_sample_memory();
@@ -3433,8 +3429,6 @@
 	}
 }
 
-#ifdef CONFIG_SEQUENCER
-
 /*
  * Timer stuff
  */
@@ -3535,6 +3529,3 @@
 	sound_timer_init(&gus_tmr, "GUS");
 #endif
 }
-#endif
-
-#endif
diff -rNu linux.orig/drivers/sound/ics2101.c linux/drivers/sound/ics2101.c
--- linux.orig/drivers/sound/ics2101.c	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/ics2101.c	Thu Feb 24 20:35:12 2000
@@ -17,7 +17,6 @@
 
 
 #include "sound_config.h"
-#ifdef CONFIG_GUS
 
 #include <linux/ultrasound.h>
 #include "gus_hw.h"
@@ -244,5 +243,3 @@
 	}
 	return n;
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/legacy.h linux/drivers/sound/legacy.h
--- linux.orig/drivers/sound/legacy.h	Wed Dec 16 21:52:01 1998
+++ linux/drivers/sound/legacy.h	Thu Jan  1 01:00:00 1970
@@ -1,50 +0,0 @@
-#ifndef _SOUND_LEGACY_H_
-#define _SOUND_LEGACY_H_
-
-/*
- *	Force on additional support
- */
-
-#define __SGNXPRO__
-#define DESKPROXL
-/* #define SM_GAMES */
-#define SM_WAVE
-
-/*
- * Define legacy options.
- */
-
-#define SELECTED_SOUND_OPTIONS		0x0
-
-#define HAVE_MAUI_BOOT
-#define PSS_HAVE_LD
-#define INCLUDE_TRIX_BOOT
-
-#define CONFIG_CS4232
-#define CONFIG_GUS
-#define CONFIG_MAD16
-#define CONFIG_MAUI
-#define CONFIG_MPU401
-#define CONFIG_MSS
-#define CONFIG_OPL3SA1
-#define CONFIG_OPL3SA2
-#define CONFIG_PAS
-#define CONFIG_PSS
-#define CONFIG_SB
-#define CONFIG_SOFTOSS
-#define CONFIG_SSCAPE
-#define CONFIG_AD1816
-#define CONFIG_TRIX
-#define CONFIG_VMIDI
-#define CONFIG_YM3812
-
-#define CONFIG_AUDIO
-#define CONFIG_MIDI
-#define CONFIG_SEQUENCER
-
-#define CONFIG_AD1848
-#define CONFIG_MPU_EMU
-#define CONFIG_SBDSP
-#define CONFIG_UART401
-
-#endif	/* _SOUND_LEGACY_H */
diff -rNu linux.orig/drivers/sound/mad16.c linux/drivers/sound/mad16.c
--- linux.orig/drivers/sound/mad16.c	Sat Feb 19 18:37:35 2000
+++ linux/drivers/sound/mad16.c	Thu Feb 24 20:40:59 2000
@@ -86,8 +86,6 @@
 
 #endif
 
-#ifdef CONFIG_MAD16
-
 #include "sb.h"
 
 static int      already_initialized = 0;
@@ -724,7 +722,7 @@
 
 void attach_mad16_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_MIDI) && defined(CONFIG_MAD16_OLDCARD)
+#ifdef CONFIG_MAD16_OLDCARD
 
 	if (mad_read(MC1_PORT) & 0x20)
 		hw_config->io_base = 0x240;
@@ -746,7 +744,6 @@
 
 int probe_mad16_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	static int mpu_attached = 0;
 	static int valid_ports[] = {
 		0x330, 0x320, 0x310, 0x300
@@ -766,7 +763,7 @@
 	if (board_type < C929)	/* Early chip. No MPU support. Just SB MIDI */
 	{
 
-#if defined(CONFIG_MIDI) && defined(CONFIG_MAD16_OLDCARD)
+#ifdef CONFIG_MAD16_OLDCARD
 		unsigned char   tmp;
 
 		tmp = mad_read(MC3_PORT);
@@ -899,9 +896,6 @@
 	mad_write(MC6_PORT, tmp);	/* Write MPU401 config */
 
 	return probe_uart401(hw_config);
-#else
-	return 0;
-#endif
 }
 
 void unload_mad16(struct address_info *hw_config)
@@ -917,7 +911,7 @@
 void
 unload_mad16_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_MIDI) && defined(CONFIG_MAD16_OLDCARD)
+#ifdef CONFIG_MAD16_OLDCARD
 	if (board_type < C929)	/* Early chip. No MPU support. Just SB MIDI */
 	{
 		sb_dsp_unload(hw_config, 0);
@@ -925,9 +919,7 @@
 	}
 #endif
 
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	unload_uart401(hw_config);
-#endif
 }
 
 #ifdef MODULE
@@ -1126,9 +1118,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
-
-
-
-/* That's all folks */
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/maui.c linux/drivers/sound/maui.c
--- linux.orig/drivers/sound/maui.c	Thu Aug  5 01:36:41 1999
+++ linux/drivers/sound/maui.c	Thu Feb 24 20:44:56 2000
@@ -32,8 +32,6 @@
 #include "soundmodule.h"
 #include "sound_firmware.h"
 
-#ifdef CONFIG_MAUI
-
 static int      maui_base = 0x330;
 
 static volatile int irq_ok = 0;
@@ -53,12 +51,7 @@
 static int      (*orig_load_patch) (int dev, int format, const char *addr,
 			      int offs, int count, int pmgr_flag) = NULL;
 
-#ifdef HAVE_MAUI_BOOT
 #include "maui_boot.h"
-#else
-static unsigned char *maui_os = NULL;
-static int maui_osLen = 0;
-#endif
 
 static int maui_wait(int mask)
 {
@@ -190,7 +183,7 @@
 
 static int maui_init(int irq)
 {
-#ifdef __SMP__
+#ifdef CONFIG_SMP
 	int i;
 #endif	
 	unsigned char bits;
@@ -221,7 +214,7 @@
 	outb((0x80), HOST_CTRL_PORT);	/* Leave reset */
 	outb((0xD0), HOST_CTRL_PORT);	/* Cause interrupt */
 
-#ifdef __SMP__
+#ifdef CONFIG_SMP
 	for (i = 0; i < 1000000 && !irq_ok; i++);
 
 	if (!irq_ok)
@@ -500,5 +493,4 @@
 	unload_maui(&cfg);
 	SOUND_LOCK_END;
 }
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/midi_synth.c linux/drivers/sound/midi_synth.c
--- linux.orig/drivers/sound/midi_synth.c	Sun Mar 21 16:11:37 1999
+++ linux/drivers/sound/midi_synth.c	Thu Feb 24 20:09:24 2000
@@ -21,8 +21,6 @@
 
 #include "sound_config.h"
 
-#ifdef CONFIG_MIDI
-
 #define _MIDI_SYNTH_C_
 
 #include "midi_synth.h"
@@ -32,9 +30,6 @@
 {0};
 static unsigned char prev_out_status[MAX_MIDI_DEV];
 
-#ifndef CONFIG_SEQUENCER
-#define STORE(cmd)
-#else
 #define STORE(cmd) \
 { \
   int len; \
@@ -42,7 +37,6 @@
   cmd; \
   seq_input_event(obuf, len); \
 }
-#endif
 
 #define _seqbuf obuf
 #define _seqbufptr 0
@@ -709,6 +703,3 @@
 
 	return 0;
 }
-
-
-#endif
diff -rNu linux.orig/drivers/sound/midibuf.c linux/drivers/sound/midibuf.c
--- linux.orig/drivers/sound/midibuf.c	Wed May 12 08:40:50 1999
+++ linux/drivers/sound/midibuf.c	Thu Feb 24 20:09:46 2000
@@ -21,7 +21,6 @@
 
 #include "sound_config.h"
 
-#ifdef CONFIG_MIDI
 
 /*
  * Don't make MAX_QUEUE_SIZE larger than 4000
@@ -431,6 +430,3 @@
 		return DATA_AVAIL (midi_in_buf[dev]);
 	return 0;
 }
-
-
-#endif
diff -rNu linux.orig/drivers/sound/mpu401.c linux/drivers/sound/mpu401.c
--- linux.orig/drivers/sound/mpu401.c	Mon Aug 23 19:14:44 1999
+++ linux/drivers/sound/mpu401.c	Thu Feb 24 20:10:47 2000
@@ -24,15 +24,11 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 #include "coproc.h"
 
 
-#ifdef CONFIG_SEQUENCER
 static int      timer_mode = TMR_INTERNAL, timer_caps = TMR_INTERNAL;
 
-#endif
-
 struct mpu_config
 {
 	int             base;	/*
@@ -159,9 +155,6 @@
 	0			/* Fx */
 };
 
-#ifndef CONFIG_SEQUENCER
-#define STORE(cmd)
-#else
 #define STORE(cmd) \
 { \
 	int len; \
@@ -169,7 +162,6 @@
 	cmd; \
 	seq_input_event(obuf, len); \
 }
-#endif
 
 #define _seqbuf obuf
 #define _seqbufptr 0
@@ -1225,8 +1217,6 @@
  *      Timer stuff
  ****************************************************/
 
-#if defined(CONFIG_SEQUENCER)
-
 static volatile int timer_initialized = 0, timer_open = 0, tmr_running = 0;
 static volatile int curr_tempo, curr_timebase, hw_timebase;
 static int      max_timebase = 8;	/* 8*24=192 ppqn */
@@ -1718,9 +1708,6 @@
 
 }
 
-#endif
-
-
 EXPORT_SYMBOL(probe_mpu401);
 EXPORT_SYMBOL(attach_mpu401);
 EXPORT_SYMBOL(unload_mpu401);
@@ -1762,5 +1749,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/opl3.c linux/drivers/sound/opl3.c
--- linux.orig/drivers/sound/opl3.c	Thu Feb 24 19:46:53 2000
+++ linux/drivers/sound/opl3.c	Thu Feb 24 20:11:56 2000
@@ -1217,7 +1217,7 @@
 
 MODULE_PARM(io, "i");
 
-#endif
+#endif /* MODULE */
 
 EXPORT_SYMBOL(opl3_init);
 EXPORT_SYMBOL(opl3_detect);
diff -rNu linux.orig/drivers/sound/opl3sa.c linux/drivers/sound/opl3sa.c
--- linux.orig/drivers/sound/opl3sa.c	Thu Sep 30 00:32:15 1999
+++ linux/drivers/sound/opl3sa.c	Thu Feb 24 20:43:15 2000
@@ -31,8 +31,6 @@
 
 #endif
 
-#ifdef CONFIG_OPL3SA1
-
 static int kilroy_was_here = 0;	/* Don't detect twice */
 static int mpu_initialized = 0;
 
@@ -177,15 +175,12 @@
 
 void attach_opl3sa_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	hw_config->name = "OPL3-SA (MPU401)";
 	attach_uart401(hw_config);
-#endif
 }
 
 int probe_opl3sa_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	unsigned char conf;
 	static signed char irq_bits[] = {
 		-1, -1, -1, -1, -1, 1, -1, 2, -1, 3, 4
@@ -240,9 +235,6 @@
 	mpu_initialized = 1;
 
 	return probe_uart401(hw_config);
-#else
-	return 0;
-#endif
 }
 
 void unload_opl3sa_wss(struct address_info *hw_config)
@@ -265,17 +257,13 @@
 
 void unload_opl3sa_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	unload_uart401(hw_config);
-#endif
 }
 
 #ifdef SB_OK
 void unload_opl3sa_sb(struct address_info *hw_config)
 {
-#ifdef CONFIG_SBDSP
 	sb_dsp_unload(hw_config);
-#endif
 }
 #endif
 
@@ -334,6 +322,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
-
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/opl3sa2.c linux/drivers/sound/opl3sa2.c
--- linux.orig/drivers/sound/opl3sa2.c	Tue Jul  6 04:58:24 1999
+++ linux/drivers/sound/opl3sa2.c	Thu Feb 24 20:13:29 2000
@@ -67,8 +67,6 @@
 #define CHIPSET_OPL3SAX  4
 
 
-#ifdef CONFIG_OPL3SA2
-
 /* What's my version? */
 static int chipset = CHIPSET_UNKNOWN;
 
@@ -443,27 +441,19 @@
 
 int probe_opl3sa2_mpu(struct address_info *hw_config)
 {
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	return probe_mpu401(hw_config);
-#else
-	return 0;
-#endif
 }
 
 
 void attach_opl3sa2_mpu(struct address_info *hw_config)
 {
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	attach_mpu401(hw_config);
-#endif
 }
 
 
 void unload_opl3sa2_mpu(struct address_info *hw_config)
 {
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	unload_mpu401(hw_config);
-#endif
 }
 
 
@@ -706,7 +696,6 @@
 	attach_opl3sa2(&cfg);
 	attach_opl3sa2_mss(&mss_cfg);
 
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	if(mpu_io != -1)
 	{
             /* MPU config: */
@@ -720,7 +709,6 @@
 		    attach_opl3sa2_mpu(&mpu_cfg);
 	    }
 	}
-#endif
 	SOUND_LOCK;
 	return 0;
 }
@@ -728,16 +716,13 @@
 
 void cleanup_module(void)
 {
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
         if(mpu_cfg.slots[1] != -1)
 	{
 		unload_opl3sa2_mpu(&mpu_cfg);
 	}
-#endif
 	unload_opl3sa2_mss(&mss_cfg);
 	unload_opl3sa2(&cfg);
 	SOUND_LOCK_END;
 }
 
 #endif /* MODULE */
-#endif /* CONFIG_OPL3SA2 */
diff -rNu linux.orig/drivers/sound/pas2_card.c linux/drivers/sound/pas2_card.c
--- linux.orig/drivers/sound/pas2_card.c	Fri Jan 15 07:59:47 1999
+++ linux/drivers/sound/pas2_card.c	Thu Feb 24 20:14:41 2000
@@ -9,8 +9,6 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#ifdef CONFIG_PAS
-
 static unsigned char dma_bits[] = {
 	4, 1, 2, 3, 0, 5, 6, 7
 };
@@ -92,16 +90,12 @@
 
 	if (status & 0x08)
 	{
-#ifdef CONFIG_AUDIO
 		  pas_pcm_interrupt(status, 1);
-#endif
 		  status &= ~0x08;
 	}
 	if (status & 0x10)
 	{
-#ifdef CONFIG_MIDI
 		  pas_midi_interrupt();
-#endif
 		  status &= ~0x10;
 	}
 }
@@ -239,7 +233,7 @@
 	mix_write(0x80 | 5, 0x078B);
 	mix_write(5, 0x078B);
 
-#if !defined(DISABLE_SB_EMULATION) && defined(CONFIG_SB)
+#if !defined(DISABLE_SB_EMULATION)
 
 	{
 		struct address_info *sb_config;
@@ -351,18 +345,14 @@
 		}
 		if (config_pas_hw(hw_config))
 		{
-#ifdef CONFIG_AUDIO
 			pas_pcm_init(hw_config);
-#endif
 
-#if !defined(MODULE) && !defined(DISABLE_SB_EMULATION) && defined(CONFIG_SB)
+#if !defined(MODULE) && !defined(DISABLE_SB_EMULATION)
 
 			sb_dsp_disable_midi(pas_sb_base);	/* No MIDI capability */
 #endif
 
-#ifdef CONFIG_MIDI
 			pas_midi_init();
-#endif
 			pas_init_mixer();
 		}
 	}
@@ -453,5 +443,4 @@
 }
 
 
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/pas2_midi.c linux/drivers/sound/pas2_midi.c
--- linux.orig/drivers/sound/pas2_midi.c	Fri Jan 15 07:59:47 1999
+++ linux/drivers/sound/pas2_midi.c	Thu Feb 24 20:14:55 2000
@@ -12,12 +12,8 @@
  */
 #include <linux/config.h>
 
-
 #include "sound_config.h"
 
-#ifdef CONFIG_PAS
-#ifdef CONFIG_MIDI
-
 static int      midi_busy = 0, input_opened = 0;
 static int      my_dev;
 
@@ -264,6 +260,3 @@
 	}
 	pas_write(stat, 0x1B88);	/* Acknowledge interrupts */
 }
-
-#endif
-#endif
diff -rNu linux.orig/drivers/sound/pas2_mixer.c linux/drivers/sound/pas2_mixer.c
--- linux.orig/drivers/sound/pas2_mixer.c	Fri May 15 03:50:50 1998
+++ linux/drivers/sound/pas2_mixer.c	Thu Feb 24 20:15:09 2000
@@ -19,8 +19,6 @@
 
 #include "sound_config.h"
 
-#ifdef CONFIG_PAS
-
 #ifndef DEB
 #define DEB(what)		/* (what) */
 #endif
@@ -332,5 +330,3 @@
 	  }
 	return 1;
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/pas2_pcm.c linux/drivers/sound/pas2_pcm.c
--- linux.orig/drivers/sound/pas2_pcm.c	Fri Jan 15 07:59:47 1999
+++ linux/drivers/sound/pas2_pcm.c	Thu Feb 24 20:15:30 2000
@@ -18,9 +18,6 @@
 
 #include "sound_config.h"
 
-#ifdef CONFIG_PAS
-#ifdef CONFIG_AUDIO
-
 #ifndef DEB
 #define DEB(WHAT)
 #endif
@@ -440,6 +437,3 @@
 		}
 	}
 }
-
-#endif
-#endif
diff -rNu linux.orig/drivers/sound/pss.c linux/drivers/sound/pss.c
--- linux.orig/drivers/sound/pss.c	Wed Dec 16 21:52:01 1998
+++ linux/drivers/sound/pss.c	Thu Feb 24 20:45:19 2000
@@ -34,9 +34,6 @@
 #include "sound_firmware.h"
 #include "soundmodule.h"
 
-#ifdef CONFIG_PSS
-#ifdef CONFIG_AUDIO
-
 /*
  * PSS registers.
  */
@@ -82,14 +79,7 @@
 #define NO_WSS_MIXER	-1
 
 #include "coproc.h"
-
-#ifdef PSS_HAVE_LD
 #include "pss_boot.h"
-#else
-static int pss_synthLen = 0;
-static unsigned char *pss_synth =
-NULL;
-#endif
 
 /* If compiled into kernel, it enable or disable pss mixer */
 #ifdef CONFIG_PSS_MIXER
@@ -675,11 +665,7 @@
 			break;	/* No more input */
 	}
 
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	return probe_mpu401(hw_config);
-#else
-	return 0;
-#endif
 }
 
 static int pss_coproc_open(void *dev_info, int sub_device)
@@ -926,11 +912,9 @@
 
 void attach_pss_mpu(struct address_info *hw_config)
 {
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	attach_mpu401(hw_config);	/* Slot 1 */
 	if (hw_config->slots[1] != -1)	/* The MPU driver installed itself */
 		midi_devs[hw_config->slots[1]]->coproc = &pss_coproc_operations;
-#endif
 }
 
 int probe_pss_mss(struct address_info *hw_config)
@@ -1015,9 +999,7 @@
 
 void unload_pss_mpu(struct address_info *hw_config)
 {
-#if (defined(CONFIG_MPU401) || defined(CONFIG_MPU_EMU)) && defined(CONFIG_MIDI)
 	unload_mpu401(hw_config);
-#endif
 }
 
 void unload_pss_mss(struct address_info *hw_config)
@@ -1114,6 +1096,4 @@
 	unload_pss(&cfgpss);
 	SOUND_LOCK_END;
 }
-#endif
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/sb.h linux/drivers/sound/sb.h
--- linux.orig/drivers/sound/sb.h	Tue Apr 13 01:18:27 1999
+++ linux/drivers/sound/sb.h	Thu Feb 24 20:16:39 2000
@@ -1,7 +1,5 @@
 #include <linux/config.h>
-#include "legacy.h"
 
-#ifdef CONFIG_SBDSP
 #define DSP_RESET	(devc->base + 0x6)
 #define DSP_READ	(devc->base + 0xA)
 #define DSP_WRITE	(devc->base + 0xC)
@@ -168,4 +166,3 @@
 
 extern int acer;
 extern sb_devc *last_sb;
-#endif
diff -rNu linux.orig/drivers/sound/sb_audio.c linux/drivers/sound/sb_audio.c
--- linux.orig/drivers/sound/sb_audio.c	Sat Feb 19 18:38:20 2000
+++ linux/drivers/sound/sb_audio.c	Thu Feb 24 20:17:09 2000
@@ -24,8 +24,6 @@
 #include <linux/config.h>
 #include "sound_config.h"
 
-#ifdef CONFIG_SBDSP
-
 #include "sb_mixer.h"
 #include "sb.h"
 
@@ -1126,5 +1124,3 @@
 	audio_devs[devc->dev]->mixer_dev = devc->my_mixerdev;
 	audio_devs[devc->dev]->min_fragment = 5;
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/sb_card.c linux/drivers/sound/sb_card.c
--- linux.orig/drivers/sound/sb_card.c	Thu Feb 24 19:46:53 2000
+++ linux/drivers/sound/sb_card.c	Thu Feb 24 20:18:21 2000
@@ -37,8 +37,6 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#ifdef CONFIG_SBDSP
-
 #include "sb_mixer.h"
 #include "sb.h"
 
@@ -340,7 +338,6 @@
 	/*  @H@0001:mpu
 	 */
 
-#ifdef CONFIG_MIDI
 	if((mpu_dev = isapnp_find_dev(bus,
 				ISAPNP_VENDOR('@','H','@'), ISAPNP_FUNCTION(0x0001), NULL)))
 	{
@@ -359,7 +356,6 @@
 	}
 	else
 		printk(KERN_ERR "sb: CMI8330 panic: mpu not found\n");
-#endif
 
 
 	/*  @P@:Gameport
@@ -716,5 +712,3 @@
 EXPORT_SYMBOL(attach_sbmpu);
 EXPORT_SYMBOL(probe_sbmpu);
 EXPORT_SYMBOL(unload_sbmpu);
-
-#endif
diff -rNu linux.orig/drivers/sound/sb_common.c linux/drivers/sound/sb_common.c
--- linux.orig/drivers/sound/sb_common.c	Thu Sep 30 00:32:15 1999
+++ linux/drivers/sound/sb_common.c	Thu Feb 24 20:19:46 2000
@@ -23,12 +23,6 @@
 #include "sound_config.h"
 #include "sound_firmware.h"
 
-#ifdef CONFIG_SBDSP
-
-#ifndef CONFIG_AUDIO
-#error You will need to configure the sound driver with CONFIG_AUDIO option.
-#endif
-
 #include "sb_mixer.h"
 #include "sb.h"
 
@@ -114,11 +108,9 @@
 	{
 		src = sb_getmixer(devc, IRQ_STAT);	/* Interrupt source register */
 
-#if defined(CONFIG_MIDI)&& defined(CONFIG_UART401)
 		if (src & 4)						/* MPU401 interrupt */
 			if(devc->midi_irq_cookie)
 				uart401intr(devc->irq, devc->midi_irq_cookie, NULL);
-#endif
 
 		if (!(src & 3))
 			return;	/* Not a DSP interrupt */
@@ -139,9 +131,7 @@
 				break;
 
 			case IMODE_MIDI:
-#ifdef CONFIG_MIDI
 				sb_midi_interrupt(devc);
-#endif
 				break;
 
 			default:
@@ -284,7 +274,6 @@
 	return 1;
 }
 
-#if defined(CONFIG_MIDI) && defined(CONFIG_UART401)
 static void sb16_set_mpu_port(sb_devc * devc, struct address_info *hw_config)
 {
 	/*
@@ -307,7 +296,6 @@
 			printk(KERN_ERR "SB16: Invalid MIDI I/O port %x\n", hw_config->io_base);
 	}
 }
-#endif
 
 static int sb16_set_irq_hw(sb_devc * devc, int level)
 {
@@ -807,10 +795,8 @@
 		if (devc->major == 3 || devc->major == 4)
 			sb_mixer_init(devc);
 
-#ifdef CONFIG_MIDI
 	if (!(devc->caps & SB_NO_MIDI))
 		sb_dsp_midi_init(devc);
-#endif
 
 	if (hw_config->name == NULL)
 		hw_config->name = "Sound Blaster (8 BIT/MONO ONLY)";
@@ -971,8 +957,6 @@
 	sb_setmixer(devc, reg, value);
 }
 
-#ifdef CONFIG_MIDI
-
 /*
  *	MPU401 MIDI initialization.
  */
@@ -1200,10 +1184,8 @@
 #endif
 		return;
 	}
-#if defined(CONFIG_UART401)
 	attach_uart401(hw_config);
 	last_sb->midi_irq_cookie=midi_devs[hw_config->slots[4]]->devc;
-#endif
 }
 
 int probe_sbmpu(struct address_info *hw_config)
@@ -1244,7 +1226,6 @@
 	}
 #endif
 
-#if defined(CONFIG_UART401)
 	if (check_region(hw_config->io_base, 4))
 	{
 		printk(KERN_ERR "sbmpu: I/O port conflict (%x)\n", hw_config->io_base);
@@ -1279,9 +1260,6 @@
 			return 0;
 	}
 	return probe_uart401(hw_config);
-#else
-	return 0;
-#endif
 }
 
 void unload_sbmpu(struct address_info *hw_config)
@@ -1292,23 +1270,5 @@
 		return;
 	}
 #endif
-#if defined(CONFIG_UART401)
 	unload_uart401(hw_config);
-#endif
-}
-#else				/* !CONFIG_MIDI */
-
-void unload_sbmpu(struct address_info *hw_config)
-{
-}
-
-int probe_sbmpu(struct address_info *hw_config)
-{
-	return 0;
 }
-
-void attach_sbmpu(struct address_info *hw_config)
-{
-}
-#endif
-#endif
diff -rNu linux.orig/drivers/sound/sb_midi.c linux/drivers/sound/sb_midi.c
--- linux.orig/drivers/sound/sb_midi.c	Fri Sep 11 01:37:26 1998
+++ linux/drivers/sound/sb_midi.c	Thu Feb 24 20:20:45 2000
@@ -14,9 +14,6 @@
 #include <linux/config.h>
 #include "sound_config.h"
 
-#ifdef CONFIG_SBDSP
-#ifdef CONFIG_MIDI
-
 #include "sb.h"
 #undef SB_TEST_IRQ
 
@@ -210,6 +207,3 @@
 	midi_devs[dev]->converter->id = "SBMIDI";
 	sequencer_init();
 }
-
-#endif
-#endif
diff -rNu linux.orig/drivers/sound/sb_mixer.c linux/drivers/sound/sb_mixer.c
--- linux.orig/drivers/sound/sb_mixer.c	Tue Jul  6 04:58:25 1999
+++ linux/drivers/sound/sb_mixer.c	Thu Feb 24 20:21:09 2000
@@ -19,7 +19,6 @@
 #include <linux/config.h>
 #include "sound_config.h"
 
-#ifdef CONFIG_SBDSP
 #define __SB_MIXER_C__
 
 #include "sb.h"
@@ -78,27 +77,6 @@
 MIX_ENT(SOUND_MIXER_RECLEV,	0x00, 0, 0, 0x00, 0, 0)
 };
 
-#ifdef	__SGNXPRO__
-#if 0
-static mixer_tab sgnxpro_mix = { 	/* not used anywhere */
-MIX_ENT(SOUND_MIXER_VOLUME,	0x22, 7, 4, 0x22, 3, 4),
-MIX_ENT(SOUND_MIXER_BASS,	0x46, 2, 3, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_TREBLE,	0x44, 2, 3, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_SYNTH,	0x26, 7, 4, 0x26, 3, 4),
-MIX_ENT(SOUND_MIXER_PCM,	0x04, 7, 4, 0x04, 3, 4),
-MIX_ENT(SOUND_MIXER_SPEAKER,	0x42, 2, 3, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_LINE,	0x2e, 7, 4, 0x2e, 3, 4),
-MIX_ENT(SOUND_MIXER_MIC,	0x0a, 2, 3, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_CD,		0x28, 7, 4, 0x28, 3, 4),
-MIX_ENT(SOUND_MIXER_IMIX,	0x00, 0, 0, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_ALTPCM,	0x00, 0, 0, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_RECLEV,	0x00, 0, 0, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_IGAIN,	0x00, 0, 0, 0x00, 0, 0),
-MIX_ENT(SOUND_MIXER_OGAIN,	0x00, 0, 0, 0x00, 0, 0)
-};
-#endif
-#endif
-
 static mixer_tab sb16_mix = {
 MIX_ENT(SOUND_MIXER_VOLUME,	0x30, 7, 5, 0x31, 7, 5),
 MIX_ENT(SOUND_MIXER_BASS,	0x46, 7, 4, 0x47, 7, 4),
@@ -763,5 +741,3 @@
 	sb_mixer_reset(devc);
 	return 1;
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/sb_mixer.h linux/drivers/sound/sb_mixer.h
--- linux.orig/drivers/sound/sb_mixer.h	Tue Jul  6 04:58:25 1999
+++ linux/drivers/sound/sb_mixer.h	Thu Feb 24 20:47:27 2000
@@ -24,9 +24,6 @@
  *
  */
 #include <linux/config.h>
-#include "legacy.h"
-
-#ifdef CONFIG_SBDSP
 
 /*
  * Mixer registers
@@ -108,6 +105,3 @@
 #define ALS007_LINE	6
 #define ALS007_CD	2
 #define ALS007_SYNTH	7
-
-#endif
-
diff -rNu linux.orig/drivers/sound/sequencer.c linux/drivers/sound/sequencer.c
--- linux.orig/drivers/sound/sequencer.c	Wed May 12 08:40:50 1999
+++ linux/drivers/sound/sequencer.c	Thu Feb 24 20:22:44 2000
@@ -15,15 +15,12 @@
  * Alan Cox	   : reformatted and fixed a pair of null pointer bugs
  */
 #include <linux/config.h>
-
 #include <linux/kmod.h>
 
-
 #define SEQUENCER_C
 #include "sound_config.h"
-
-#ifdef CONFIG_SEQUENCER
 #include "softoss.h"
+
 int             (*softsynthp) (int cmd, int parm1, int parm2, unsigned long parm3) = NULL;
 
 #include "midi_ctrl.h"
@@ -719,9 +716,7 @@
 	switch (cmd)
 	{
 		case LOCL_STARTAUDIO:
-#ifdef CONFIG_AUDIO
 			DMAbuf_start_devices(parm);
-#endif
 			break;
 
 		default:
@@ -1692,9 +1687,7 @@
 
 	if (sequencer_ok)
 		return;
-#ifdef CONFIG_MIDI
 	MIDIbuf_init();
-#endif
 	queue = (unsigned char *)vmalloc(SEQ_MAX_QUEUE * EV_SZ);
 	if (queue == NULL)
 	{
@@ -1724,5 +1717,3 @@
 		iqueue=NULL;
 	}
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/sequencer_syms.c linux/drivers/sound/sequencer_syms.c
--- linux.orig/drivers/sound/sequencer_syms.c	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/sequencer_syms.c	Thu Feb 24 20:22:51 2000
@@ -9,7 +9,6 @@
 char sequencer_syms_symbol;
 
 #include "sound_config.h"
-
 #include "sound_calls.h"
 
 EXPORT_SYMBOL(note_to_freq);
diff -rNu linux.orig/drivers/sound/sgalaxy.c linux/drivers/sound/sgalaxy.c
--- linux.orig/drivers/sound/sgalaxy.c	Tue Jul  6 04:58:25 1999
+++ linux/drivers/sound/sgalaxy.c	Thu Feb 24 20:23:32 2000
@@ -24,8 +24,6 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#if defined(CONFIG_SGALAXY) || defined (MODULE)
-
 static void sleep( unsigned howlong )
 {
 	current->state   = TASK_INTERRUPTIBLE;
@@ -182,5 +180,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/softoss.c linux/drivers/sound/softoss.c
--- linux.orig/drivers/sound/softoss.c	Fri Jul 10 23:03:36 1998
+++ linux/drivers/sound/softoss.c	Thu Feb 24 20:24:23 2000
@@ -30,8 +30,6 @@
 
 #include "sound_config.h"
 #include "soundmodule.h"
-
-#ifdef CONFIG_SOFTOSS
 #include "softoss.h"
 #include <linux/ultrasound.h>
 
@@ -1529,5 +1527,4 @@
 	sound_unload_timerdev(devc->timerdev);
 	SOUND_LOCK_END;
 }
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/softoss_rs.c linux/drivers/sound/softoss_rs.c
--- linux.orig/drivers/sound/softoss_rs.c	Sun Dec 27 19:53:45 1998
+++ linux/drivers/sound/softoss_rs.c	Thu Feb 24 20:24:52 2000
@@ -17,8 +17,6 @@
 
 
 #include "sound_config.h"
-
-#ifdef CONFIG_SOFTOSS
 #include "softoss.h"
 
 void softsynth_resample_loop(short *buf, int loops)
@@ -130,4 +128,3 @@
 		}
 	}			/* Mix one sample */
 }
-#endif
diff -rNu linux.orig/drivers/sound/sound_config.h linux/drivers/sound/sound_config.h
--- linux.orig/drivers/sound/sound_config.h	Thu Dec 31 21:03:48 1998
+++ linux/drivers/sound/sound_config.h	Thu Feb 24 20:47:07 2000
@@ -18,7 +18,6 @@
 #include <linux/fs.h>
 #include <linux/sound.h>
 
-#include "legacy.h"
 #include "os.h"
 #include "soundvers.h"
 
diff -rNu linux.orig/drivers/sound/sound_timer.c linux/drivers/sound/sound_timer.c
--- linux.orig/drivers/sound/sound_timer.c	Wed Jun  2 08:25:48 1999
+++ linux/drivers/sound/sound_timer.c	Thu Feb 24 20:25:48 2000
@@ -17,8 +17,6 @@
 
 #include "sound_config.h"
 
-#if defined(CONFIG_SEQUENCER)
-
 static volatile int initialized = 0, opened = 0, tmr_running = 0;
 static volatile time_t tmr_offs, tmr_ctr;
 static volatile unsigned long ticks_offs;
@@ -318,5 +316,3 @@
 	strcpy(sound_timer.info.name, name);
 	sound_timer_devs[n] = &sound_timer;
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/soundcard.c linux/drivers/sound/soundcard.c
--- linux.orig/drivers/sound/soundcard.c	Sat Feb 19 18:40:02 2000
+++ linux/drivers/sound/soundcard.c	Thu Feb 24 20:46:41 2000
@@ -45,8 +45,11 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/smp_lock.h>
-
 #include "soundmodule.h"
+
+/* From obsolete legacy.h */
+#define SELECTED_SOUND_OPTIONS 0x0
+
 struct notifier_block *sound_locker=(struct notifier_block *)0;
 static int lock_depth = 0;
 
@@ -219,9 +222,6 @@
 	}
 	if (!sound_started)
 		len += sprintf(buffer + len, "\n\n***** Sound driver not started *****\n\n");
-#ifndef CONFIG_AUDIO
-	len += sprintf(buffer + len, "\nAudio devices: NOT ENABLED IN CONFIG\n");
-#else
 	len += sprintf(buffer + len, "\nAudio devices:\n");
 	for (i = 0; (i < num_audiodevs) && (pos <= offset + length); i++) {
 		if (audio_devs[i] == NULL)
@@ -234,11 +234,7 @@
 			begin = pos;
 		}
 	}
-#endif
 
-#ifndef CONFIG_SEQUENCER
-	len += sprintf(buffer + len, "\nSynth devices: NOT ENABLED IN CONFIG\n");
-#else
 	len += sprintf(buffer + len, "\nSynth devices:\n");
 	for (i = 0; (i < num_synths) && (pos <= offset + length); i++) {
 		if (synth_devs[i] == NULL)
@@ -250,11 +246,7 @@
 			begin = pos;
 		}
 	}
-#endif
 
-#ifndef CONFIG_MIDI
-	len += sprintf(buffer + len, "\nMidi devices: NOT ENABLED IN CONFIG\n");
-#else
 	len += sprintf(buffer + len, "\nMidi devices:\n");
 	for (i = 0; (i < num_midis) && (pos <= offset + length); i++) {
 		if (midi_devs[i] == NULL)
@@ -266,9 +258,7 @@
 			begin = pos;
 		}
 	}
-#endif
 
-#ifdef CONFIG_SEQUENCER
 	len += sprintf(buffer + len, "\nTimers:\n");
 
 	for (i = 0; (i < num_sound_timers) && (pos <= offset + length); i++) {
@@ -281,7 +271,6 @@
 			begin = pos;
 		}
 	}
-#endif
 
 	len += sprintf(buffer + len, "\nMixers:\n");
 	for (i = 0; (i < num_mixers) && (pos <= offset + length); i++) {
@@ -388,25 +377,19 @@
 		ret = sndstat_file_read(file, buf, count, ppos);
 		break;
 
-#ifdef CONFIG_AUDIO
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
 		ret = audio_read(dev, file, buf, count);
 		break;
-#endif
 
-#ifdef CONFIG_SEQUENCER
 	case SND_DEV_SEQ:
 	case SND_DEV_SEQ2:
 		ret = sequencer_read(dev, file, buf, count);
 		break;
-#endif
 
-#ifdef CONFIG_MIDI
 	case SND_DEV_MIDIN:
 		ret = MIDIbuf_read(dev, file, buf, count);
-#endif
 	}
 	unlock_kernel();
 	return ret;
@@ -420,26 +403,20 @@
 	lock_kernel();
 	DEB(printk("sound_write(dev=%d, count=%d)\n", dev, count));
 	switch (dev & 0x0f) {
-#ifdef CONFIG_SEQUENCER
 	case SND_DEV_SEQ:
 	case SND_DEV_SEQ2:
 		ret =  sequencer_write(dev, file, buf, count);
 		break;
-#endif
 
-#ifdef CONFIG_AUDIO
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
 		ret = audio_write(dev, file, buf, count);
 		break;
-#endif
 
-#ifdef CONFIG_MIDI
 	case SND_DEV_MIDIN:
 		ret =  MIDIbuf_write(dev, file, buf, count);
 		break;
-#endif
 	}
 	unlock_kernel();
 	return ret;
@@ -483,29 +460,23 @@
 			return -ENXIO;
 		break;
 
-#ifdef CONFIG_SEQUENCER
 	case SND_DEV_SEQ:
 	case SND_DEV_SEQ2:
 		if ((retval = sequencer_open(dev, file)) < 0)
 			return retval;
 		break;
-#endif
 
-#ifdef CONFIG_MIDI
 	case SND_DEV_MIDIN:
 		if ((retval = MIDIbuf_open(dev, file)) < 0)
 			return retval;
 		break;
-#endif
 
-#ifdef CONFIG_AUDIO
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
 		if ((retval = audio_open(dev, file)) < 0)
 			return retval;
 		break;
-#endif
 
 	default:
 		printk(KERN_ERR "Invalid minor device %d\n", dev);
@@ -531,26 +502,20 @@
 	case SND_DEV_CTL:
 		break;
 		
-#ifdef CONFIG_SEQUENCER
 	case SND_DEV_SEQ:
 	case SND_DEV_SEQ2:
 		sequencer_release(dev, file);
 		break;
-#endif
 
-#ifdef CONFIG_MIDI
 	case SND_DEV_MIDIN:
 		MIDIbuf_release(dev, file);
 		break;
-#endif
 
-#ifdef CONFIG_AUDIO
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
 		audio_release(dev, file);
 		break;
-#endif
 
 	default:
 		printk(KERN_ERR "Sound error: Releasing unknown device 0x%02x\n", dev);
@@ -641,13 +606,11 @@
 	    (dev & 0x0f) != SND_DEV_CTL) {              
 		dtype = dev & 0x0f;
 		switch (dtype) {
-#ifdef CONFIG_AUDIO
 		case SND_DEV_DSP:
 		case SND_DEV_DSP16:
 		case SND_DEV_AUDIO:
 			return sound_mixer_ioctl(audio_devs[dev >> 4]->mixer_dev,
 						 cmd, (caddr_t)arg);
-#endif
 			
 		default:
 			return sound_mixer_ioctl(dev >> 4, cmd, (caddr_t)arg);
@@ -661,25 +624,19 @@
 			return set_mixer_levels((caddr_t)arg);
 		return sound_mixer_ioctl(dev >> 4, cmd, (caddr_t)arg);
 
-#ifdef CONFIG_SEQUENCER
 	case SND_DEV_SEQ:
 	case SND_DEV_SEQ2:
 		return sequencer_ioctl(dev, file, cmd, (caddr_t)arg);
-#endif
 
-#ifdef CONFIG_AUDIO
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
 		return audio_ioctl(dev, file, cmd, (caddr_t)arg);
 		break;
-#endif
 
-#ifdef CONFIG_MIDI
 	case SND_DEV_MIDIN:
 		return MIDIbuf_ioctl(dev, file, cmd, (caddr_t)arg);
 		break;
-#endif
 
 	}
 	return -EINVAL;
@@ -692,23 +649,17 @@
 
 	DEB(printk("sound_poll(dev=%d)\n", dev));
 	switch (dev & 0x0f) {
-#ifdef CONFIG_SEQUENCER
 	case SND_DEV_SEQ:
 	case SND_DEV_SEQ2:
 		return sequencer_poll(dev, file, wait);
-#endif
 
-#ifdef CONFIG_MIDI
 	case SND_DEV_MIDIN:
 		return MIDIbuf_poll(dev, file, wait);
-#endif
 
-#ifdef CONFIG_AUDIO
 	case SND_DEV_DSP:
 	case SND_DEV_DSP16:
 	case SND_DEV_AUDIO:
 		return DMAbuf_poll(file, dev >> 4, wait);
-#endif
 	}
 	return 0;
 }
@@ -828,13 +779,11 @@
 	umode_t mode;
 	int *num;
 } dev_list[] = { /* list of minor devices */
-#ifdef CONFIG_AUDIO
 /* seems to be some confusion here -- this device is not in the device list */
 	{SND_DEV_DSP16,     "dspW",	 S_IWUGO | S_IRUSR | S_IRGRP,
 	 &num_audiodevs},
 	{SND_DEV_AUDIO,     "audio",	 S_IWUGO | S_IRUSR | S_IRGRP,
 	 &num_audiodevs},
-#endif /* CONFIG_AUDIO */
 };
 
 static char * 
@@ -903,12 +852,10 @@
 		return;		/* No cards detected */
 #endif
 
-#ifdef CONFIG_AUDIO
 	if (num_audiodevs || modular)	/* Audio devices present */
 	{
 		audio_init_devices();
 	}
-#endif
 #ifdef CONFIG_PROC_FS
 	if (!create_proc_info_entry("sound", 0, NULL, sound_proc_get_info))
 		printk(KERN_ERR "sound: registering /proc/sound failed\n");
@@ -1000,9 +947,7 @@
 	if (chrdev_registered)
 		destroy_special_devices();
 
-#ifdef CONFIG_SEQUENCER
 	sound_stop_timer();
-#endif
 
 #ifdef CONFIG_LOWLEVEL_SOUND
 	{
@@ -1093,8 +1038,6 @@
 	restore_flags(flags);
 }
 
-#ifdef CONFIG_SEQUENCER
-
 static void do_sequencer_timer(unsigned long dummy)
 {
 	sequencer_timer(0);
@@ -1129,7 +1072,6 @@
 {
 	del_timer(&seq_timer);;
 }
-#endif
 
 void conf_printf(char *name, struct address_info *hw_config)
 {
diff -rNu linux.orig/drivers/sound/sscape.c linux/drivers/sound/sscape.c
--- linux.orig/drivers/sound/sscape.c	Sat Feb 19 18:38:42 2000
+++ linux/drivers/sound/sscape.c	Thu Feb 24 20:29:15 2000
@@ -41,9 +41,6 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 
-
-#ifdef CONFIG_SSCAPE
-
 #include "coproc.h"
 
 /*
@@ -722,7 +719,6 @@
 	}
 #endif
 
-#if defined(CONFIG_MIDI) && defined(CONFIG_MPU_EMU)
 	if (probe_mpu401(hw_config))
 		hw_config->always_detect = 1;
 	hw_config->name = "SoundScape";
@@ -736,7 +732,6 @@
 		sscape_mididev = hw_config->slots[1];
 		midi_devs[hw_config->slots[1]]->coproc = &sscape_coproc_operations;
 	}
-#endif
 	sscape_write(devc, GA_INTENA_REG, 0x80);	/* Master IRQ enable */
 	devc->ok = 1;
 	devc->failed = 0;
@@ -1421,9 +1416,7 @@
 void unload_sscape(struct address_info *hw_config)
 {
 	release_region(devc->base + 2, 6);
-#if defined(CONFIG_MPU_EMU) && defined(CONFIG_MIDI)
 	unload_mpu401(hw_config);
-#endif
 }
 
 void unload_ss_ms_sound(struct address_info *hw_config)
@@ -1516,5 +1509,4 @@
 	unload_sscape(&mpu_config);
 }
 
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/sys_timer.c linux/drivers/sound/sys_timer.c
--- linux.orig/drivers/sound/sys_timer.c	Mon Feb  1 23:04:42 1999
+++ linux/drivers/sound/sys_timer.c	Thu Feb 24 20:29:27 2000
@@ -20,8 +20,6 @@
 
 #include "sound_config.h"
 
-#ifdef CONFIG_SEQUENCER
-
 static volatile int opened = 0, tmr_running = 0;
 static volatile time_t tmr_offs, tmr_ctr;
 static volatile unsigned long ticks_offs;
@@ -289,5 +287,3 @@
 	def_tmr_ioctl,
 	def_tmr_arm
 };
-
-#endif
diff -rNu linux.orig/drivers/sound/trix.c linux/drivers/sound/trix.c
--- linux.orig/drivers/sound/trix.c	Tue Jul  6 04:58:25 1999
+++ linux/drivers/sound/trix.c	Thu Feb 24 20:45:37 2000
@@ -23,15 +23,8 @@
 #include "sb.h"
 #include "sound_firmware.h"
 
-#ifdef CONFIG_TRIX
-
-#ifdef INCLUDE_TRIX_BOOT
 #include <linux/init.h>
 #include "trix_boot.h"
-#else
-static unsigned char *trix_boot = NULL;
-static int trix_boot_len = 0;
-#endif
 
 
 static int kilroy_was_here = 0;	/* Don't detect twice */
@@ -327,11 +320,7 @@
 	sb_initialized = 1;
 
 	hw_config->name = "AudioTrix SB";
-#ifdef CONFIG_SBDSP
 	return sb_dsp_detect(hw_config, 0, 0);
-#else
-	return 0;
-#endif
 }
 
 void attach_trix_sb(struct address_info *hw_config)
@@ -339,7 +328,6 @@
 	extern int sb_be_quiet;
 	int old_quiet;
 
-#ifdef CONFIG_SBDSP
 	hw_config->driver_use_1 = SB_NO_MIDI | SB_NO_MIXER | SB_NO_RECORDING;
 
 	/* Prevent false alarms */
@@ -349,20 +337,16 @@
 	sb_dsp_init(hw_config);
 
 	sb_be_quiet = old_quiet;
-#endif
 }
 
 void attach_trix_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	hw_config->name = "AudioTrix Pro";
 	attach_uart401(hw_config);
-#endif
 }
 
 int probe_trix_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	unsigned char conf;
 	static char irq_bits[] = {
 		-1, -1, -1, 1, 2, 3, -1, 4, -1, 5
@@ -420,9 +404,6 @@
 	trix_write(0x19, (trix_read(0x19) & 0x83) | conf);
 	mpu_initialized = 1;
 	return probe_uart401(hw_config);
-#else
-	return 0;
-#endif
 }
 
 void unload_trix_wss(struct address_info *hw_config)
@@ -445,16 +426,12 @@
 
 void unload_trix_mpu(struct address_info *hw_config)
 {
-#if defined(CONFIG_UART401) && defined(CONFIG_MIDI)
 	unload_uart401(hw_config);
-#endif
 }
 
 void unload_trix_sb(struct address_info *hw_config)
 {
-#ifdef CONFIG_SBDSP
 	sb_dsp_unload(hw_config, mpu);
-#endif
 }
 
 #ifdef MODULE
@@ -566,5 +543,4 @@
 	SOUND_LOCK_END;
 }
 
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/uart401.c linux/drivers/sound/uart401.c
--- linux.orig/drivers/sound/uart401.c	Fri Jul 10 23:03:36 1998
+++ linux/drivers/sound/uart401.c	Thu Feb 24 20:30:51 2000
@@ -25,9 +25,6 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#ifdef CONFIG_UART401
-#ifdef CONFIG_MIDI
-
 typedef struct uart401_devc
 {
 	int             base;
@@ -482,12 +479,9 @@
 	SOUND_LOCK_END;
 }
 
-#endif
+#endif /* MODULE */
 
 EXPORT_SYMBOL(attach_uart401);
 EXPORT_SYMBOL(probe_uart401);
 EXPORT_SYMBOL(unload_uart401);
 EXPORT_SYMBOL(uart401intr);
-
-#endif
-#endif
diff -rNu linux.orig/drivers/sound/uart6850.c linux/drivers/sound/uart6850.c
--- linux.orig/drivers/sound/uart6850.c	Thu May 14 19:33:17 1998
+++ linux/drivers/sound/uart6850.c	Thu Feb 24 20:31:23 2000
@@ -24,9 +24,6 @@
  */
 
 #include "sound_config.h"
-
-#ifdef CONFIG_SOUND_UART6850
-#ifdef CONFIG_MIDI
 #include "soundmodule.h"
 
 static int uart6850_base = 0x330;
@@ -353,6 +350,4 @@
 	unload_uart6850(&cfg);
 	SOUND_LOCK_END;
 }
-#endif
-#endif
-#endif
+#endif /* MODULE */
diff -rNu linux.orig/drivers/sound/v_midi.c linux/drivers/sound/v_midi.c
--- linux.orig/drivers/sound/v_midi.c	Sat Jun 13 19:23:52 1998
+++ linux/drivers/sound/v_midi.c	Thu Feb 24 20:32:10 2000
@@ -24,8 +24,6 @@
 #include "sound_config.h"
 #include "soundmodule.h"
 
-#ifdef CONFIG_VMIDI
-
 #include "v_midi.h"
 
 static vmidi_devc *v_devc[2] = { NULL, NULL};
@@ -52,7 +50,7 @@
 	SOUND_LOCK_END;
 }
 
-#endif
+#endif /* MODULE */
 
 /*
  * The DSP channel can be used either for input or output. Variable
@@ -297,5 +295,3 @@
 	sound_unload_mididev(midi2);
 	kfree(midi_mem);
 }
-
-#endif
diff -rNu linux.orig/drivers/sound/waveartist.c linux/drivers/sound/waveartist.c
--- linux.orig/drivers/sound/waveartist.c	Sat Feb 19 18:37:35 2000
+++ linux/drivers/sound/waveartist.c	Thu Feb 24 20:35:43 2000
@@ -838,7 +838,6 @@
 	else
 		printk(KERN_WARNING "waveartist: unexpected interrupt\n");
 
-#ifdef CONFIG_AUDIO
 	if (irqstatus & 0x01) {
 		int temp = 1;
 
@@ -855,7 +854,6 @@
 		if (temp)	//default:
 			printk(KERN_WARNING "waveartist: Unknown interrupt\n");
 	}
-#endif
 	if (irqstatus & 0x2)
 		// We do not use SB mode natively...
 		printk(KERN_WARNING "waveartist: Unexpected SB interrupt...\n");
diff -rNu linux.orig/drivers/sound/wavfront.c linux/drivers/sound/wavfront.c
--- linux.orig/drivers/sound/wavfront.c	Sat Feb 19 18:39:28 2000
+++ linux/drivers/sound/wavfront.c	Thu Feb 24 20:35:18 2000
@@ -86,7 +86,7 @@
  */
  
 #if defined(__alpha__)
-#ifdef __SMP__
+#ifdef CONFIG_SMP
 #define LOOPS_PER_SEC cpu_data[smp_processor_id()].loops_per_sec
 #else
 #define LOOPS_PER_SEC	loops_per_sec
@@ -1686,13 +1686,11 @@
 	   master otherwise.
 	*/
 
-#ifdef CONFIG_MIDI
 	if (dev.mididev > 0) {
 		midi_synth_controller (dev.mididev, guspatch.instr_no, 10,
 				       ((guspatch.panning << 4) > 127) ?
 				       127 : (guspatch.panning << 4));
 	}
-#endif CONFIG_MIDI
 
 	return(0);
 }

--ibTvN161/egqYuK8--
