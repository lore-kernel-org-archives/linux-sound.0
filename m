From: Christoph Hellwig <chhellwig@gmx.net>
Date: Mon, 13 Mar 2000 19:48:13 +0000
Subject: Sound/OSS cleanups
MIME-Version: 1
Content-Type: multipart/mixed; boundary="17pEHd4RhPHOinZp"
Message-Id: <marc-linux-sound-95301462115883@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Ok, yet another sound cl=E6anup. Contents:
 - removal of unused vars
 - reintroduced to Config.in variables for dma stuff und verbose
   initialisation.
 - fixed an small bu in the sb code

Christoph

--=20
Always remember that you are unique.  Just like everyone else.

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sound-fix-4.diff"

diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/Config.in linux/drivers/sound/Config.in
--- linux.orig/drivers/sound/Config.in	Mon Mar 13 20:44:26 2000
+++ linux/drivers/sound/Config.in	Mon Mar 13 20:44:04 2000
@@ -81,10 +81,12 @@
 dep_tristate '  OSS sound modules' CONFIG_SOUND_OSS $CONFIG_SOUND
 
 if [ "$CONFIG_SOUND_OSS" = "y" -o "$CONFIG_SOUND_OSS" = "m" ]; then
+   bool '      Verbose initialisation' CONFIG_SOUND_TRACEINIT
+   bool '      Persistent DMA buffers' CONFIG_SOUND_DMAP
+
    if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
       dep_tristate '    AD1816(A) based cards (EXPERIMENTAL)' CONFIG_SOUND_AD1816 $CONFIG_SOUND
    fi
-
    dep_tristate '    Aztech Sound Galaxy (non-PnP) cards' CONFIG_SOUND_SGALAXY $CONFIG_SOUND_OSS
    dep_tristate '    Adlib Cards' CONFIG_SOUND_ADLIB $CONFIG_SOUND_OSS
    dep_tristate '    ACI mixer (miroPCM12)' CONFIG_SOUND_ACI_MIXER $CONFIG_SOUND_OSS
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/dev_table.c linux/drivers/sound/dev_table.c
--- linux.orig/drivers/sound/dev_table.c	Sat Mar 11 12:32:57 2000
+++ linux/drivers/sound/dev_table.c	Mon Mar 13 15:08:26 2000
@@ -17,8 +17,6 @@
 #include "sound_config.h"
 
 int softoss_dev = 0;
-int sound_started = 0;
-int sndtable_get_cardcount(void);
 
 int sound_install_audiodrv(int vers, char *name, struct audio_driver *driver,
 			int driver_size, int flags, unsigned int format_mask,
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/dev_table.h linux/drivers/sound/dev_table.h
--- linux.orig/drivers/sound/dev_table.h	Sat Mar 11 12:32:57 2000
+++ linux/drivers/sound/dev_table.h	Mon Mar 13 15:09:12 2000
@@ -43,8 +43,6 @@
  *	NOTE! 	NOTE!	NOTE!	NOTE!
  */
 
-extern int sound_started;
-
 struct driver_info 
 {
 	char *driver_id;
@@ -350,11 +348,14 @@
 
 #ifdef _DEV_TABLE_C_   
 
-struct audio_operations *audio_devs[MAX_AUDIO_DEV] = {NULL}; int num_audiodevs = 0;
-struct mixer_operations *mixer_devs[MAX_MIXER_DEV] = {NULL}; int num_mixers = 0;
-struct synth_operations *synth_devs[MAX_SYNTH_DEV+MAX_MIDI_DEV] = {NULL}; int num_synths = 0;
-struct midi_operations *midi_devs[MAX_MIDI_DEV] = {NULL}; int num_midis = 0;
-
+struct audio_operations *audio_devs[MAX_AUDIO_DEV] = {NULL};
+int num_audiodevs = 0;
+struct mixer_operations *mixer_devs[MAX_MIXER_DEV] = {NULL};
+int num_mixers = 0;
+struct synth_operations *synth_devs[MAX_SYNTH_DEV+MAX_MIDI_DEV] = {NULL};
+int num_synths = 0;
+struct midi_operations *midi_devs[MAX_MIDI_DEV] = {NULL};
+int num_midis = 0;
 #ifndef EXCLUDE_TIMERS
 extern struct sound_timer_operations default_sound_timer;
 struct sound_timer_operations *sound_timer_devs[MAX_TIMER_DEV] = {
@@ -370,18 +371,17 @@
 
 
 #else
-extern struct audio_operations * audio_devs[MAX_AUDIO_DEV]; extern int num_audiodevs;
-extern struct mixer_operations * mixer_devs[MAX_MIXER_DEV]; extern int num_mixers;
-extern struct synth_operations * synth_devs[MAX_SYNTH_DEV+MAX_MIDI_DEV]; extern int num_synths;
-extern struct midi_operations * midi_devs[MAX_MIDI_DEV]; extern int num_midis;
-extern struct sound_timer_operations * sound_timer_devs[MAX_TIMER_DEV]; extern int num_sound_timers;
+extern struct audio_operations *audio_devs[MAX_AUDIO_DEV];
+extern int num_audiodevs;
+extern struct mixer_operations *mixer_devs[MAX_MIXER_DEV];
+extern int num_mixers;
+extern struct synth_operations *synth_devs[MAX_SYNTH_DEV+MAX_MIDI_DEV];
+extern int num_synths;
+extern struct midi_operations *midi_devs[MAX_MIDI_DEV];
+extern int num_midis;
+extern struct sound_timer_operations * sound_timer_devs[MAX_TIMER_DEV];
+extern int num_sound_timers;
 #endif	/* _DEV_TABLE_C_ */
-void setup_cards(void);
-int sndtable_get_cardcount (void);
-void sound_chconf(int card_type, int ioaddr, int irq, int dma);
-int snd_find_driver(int type);
-void sound_unload_driver(int type);
-int sndtable_identify_card(char *name);
 
 extern int sound_map_buffer (int dev, struct dma_buffparms *dmap, buffmem_desc *info);
 int sndtable_probe (int unit, struct address_info *hw_config);
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/sb_card.c linux/drivers/sound/sb_card.c
--- linux.orig/drivers/sound/sb_card.c	Sat Mar 11 12:32:57 2000
+++ linux/drivers/sound/sb_card.c	Mon Mar 13 14:49:22 2000
@@ -399,7 +399,6 @@
 	/*  @X@0001:mpu
 	 */
 
-#ifdef CONFIG_MIDI
 	if((mpu_dev = isapnp_find_dev(bus,
 				ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001), NULL)))
 	{
@@ -413,7 +412,6 @@
 	}
 	else
 		printk(KERN_ERR "sb: DT0197H panic: mpu not found\n");
-#endif
 
 
 	/*  @P@:Gameport
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/soundcard.c linux/drivers/sound/soundcard.c
--- linux.orig/drivers/sound/soundcard.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/soundcard.c	Mon Mar 13 15:03:09 2000
@@ -74,7 +74,12 @@
 int             sound_nblocks = 0;
 
 /* Persistent DMA buffers */
-int		sound_dmap_flag = 0;
+#ifdef CONFIG_SOUND_DMAP
+int             sound_dmap_flag = 1;
+#else
+int             sound_dmap_flag = 0;
+#endif
+
 static int      soundcard_configured = 0;
 static char     dma_alloc_map[MAX_DMA_CHANNELS] = {0};
 
@@ -92,8 +97,6 @@
 static mixer_vol_table mixer_vols[MAX_MIXER_DEV];
 static int num_mixer_volumes = 0;
 
-int traceinit = 0;
-
 int *load_mixer_volumes(char *name, int *levels, int present)
 {
 	int             i, n;
@@ -637,11 +640,6 @@
 
 	soundcard_configured = 1;
 
-#if defined(CONFIG_LOWLEVEL_SOUND) && !defined(MODULE)
-        sound_preinit_lowlevel_drivers();
-	sound_init_lowlevel_drivers();
-#endif
-
 	audio_init_devices();
 
 	soundcard_register_devfs(1); /* register after we know # of devices */
@@ -663,38 +661,15 @@
 static int dmabuf = 0;
 static int dmabug = 0;
 
-MODULE_PARM(traceinit, "i");
 MODULE_PARM(dmabuf, "i");
 MODULE_PARM(dmabug, "i");
 
 int init_module(void)
 {
 	int             err;
-#if FIXED_FOR_2_4_0
-	int             ints[21];
-	int             i;
-#endif
 
-#ifdef HAS_BRIDGE_BUGGY_FUNC
 	if(dmabug)
 		isa_dma_bridge_buggy = dmabug;
-#else
-	if(dmabug)
-		printk(KERN_ERR "sound: rebuild with PCI_QUIRKS enabled to configure this.\n");
-#endif
-		
-#if FIXED_FOR_2_4_0
-	/*
-	 * "sound=" command line handling by Harald Milz.
-	 */
-	i = 0;
-	while (i < 20 && sound[i])
-		ints[i + 1] = sound[i++];
-	ints[0] = i;
-
-	if (i)
-		sound_setup("sound=", ints);
-#endif
 
 	err = create_special_devices();
 	if (err)
@@ -730,13 +705,6 @@
 
 	sound_stop_timer();
 
-#ifdef CONFIG_LOWLEVEL_SOUND
-	{
-		extern void     sound_unload_lowlevel_drivers(void);
-
-		sound_unload_lowlevel_drivers();
-	}
-#endif
 	sequencer_unload();
 
 	for (i = 0; i < MAX_DMA_CHANNELS; i++)
@@ -855,8 +823,9 @@
 
 void conf_printf(char *name, struct address_info *hw_config)
 {
-	if (!traceinit)
-		return;
+#ifndef CONFIG_SOUND_TRACEINIT
+	return;
+#else
 	printk("<%s> at 0x%03x", name, hw_config->io_base);
 
 	if (hw_config->irq)
@@ -870,12 +839,13 @@
 	}
 	printk("\n");
 }
+#endif
 
 void conf_printf2(char *name, int base, int irq, int dma, int dma2)
 {
-	if (!traceinit)
-		return;
-
+#ifndef CONFIG_SOUND_TRACEINIT
+	return;
+#else
 	printk("<%s> at 0x%03x", name, base);
 
 	if (irq)
@@ -889,6 +859,7 @@
 	}
 	printk("\n");
 }
+#endif
 
 /*
  *	Module and lock management

--17pEHd4RhPHOinZp--
