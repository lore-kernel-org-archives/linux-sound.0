From: Christoph Hellwig <chhellwig@gmx.net>
Date: Thu, 09 Mar 2000 16:55:41 +0000
Subject: Re: [PATCH] Fix for sound and xconfig problems in 2.3.50
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Message-Id: <marc-linux-sound-95262143415745@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95261977313651@msgid-missing>
In-Reply-To: <marc-linux-sound-95261977313651@msgid-missing>
To: linux-sound@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii

I'm too stupid today.
Here's the patch:

Christoph

-- 
Always remember that you are unique.  Just like everyone else.

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sound-fix-2.diff"

diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/Config.in linux/drivers/sound/Config.in
--- linux.orig/drivers/sound/Config.in	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/Config.in	Thu Mar  9 16:10:27 2000
@@ -115,10 +115,10 @@
    dep_tristate '    PSS (AD1848, ADSP-2115, ESC614) support' CONFIG_SOUND_PSS $CONFIG_SOUND_OSS
    if [ "$CONFIG_SOUND_PSS" = "y" -o "$CONFIG_SOUND_PSS" = "m" ]; then
       bool '      Enable PSS mixer (Beethoven ADSP-16 and other compatibile)' CONFIG_PSS_MIXER
-   fi
-   bool '      Have DSPxxx.LD firmware file' CONFIG_PSS_HAVE_BOOT
-   if [ "$CONFIG_PSS_HAVE_BOOT" = "y" ]; then
-      string '  Full pathname of DSPxxx.LD firmware file' CONFIG_PSS_BOOT_FILE /etc/sound/dsp001.ld
+      bool '      Have DSPxxx.LD firmware file' CONFIG_PSS_HAVE_BOOT
+      if [ "$CONFIG_PSS_HAVE_BOOT" = "y" ]; then
+         string '  Full pathname of DSPxxx.LD firmware file' CONFIG_PSS_BOOT_FILE /etc/sound/dsp001.ld
+      fi
    fi
 
    dep_tristate '    SoftOSS software wave table engine' CONFIG_SOUND_SOFTOSS $CONFIG_SOUND_OSS
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/Makefile linux/drivers/sound/Makefile
--- linux.orig/drivers/sound/Makefile	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/Makefile	Thu Mar  9 15:49:16 2000
@@ -85,7 +85,7 @@
 
 # Declare multi-part drivers.
 
-list-multi	:= sound.o gus.o pas2.o sb.o softoss2.o vidc_mod.o \
+list-multi	:= sound.o gus.o pas2.o sb_lib.o sb.o softoss2.o vidc_mod.o \
     soundcore.o wavefront.o
 
 sound-objs	:= 							\
@@ -137,8 +137,8 @@
 OX_OBJS		:= $(filter     $(export-objs), $(obj-y))
 M_OBJS		:= $(sort $(filter-out $(export-objs), $(obj-m)))
 MX_OBJS		:= $(sort $(filter     $(export-objs), $(obj-m)))
-#MI_OBJS		:= $(sort $(filter-out $(export-objs), $(int-m)))
-#MIX_OBJS	:= $(sort $(filter     $(export-objs), $(int-m)))
+MI_OBJS		:= $(sort $(filter-out $(export-objs), $(int-m)))
+MIX_OBJS	:= $(sort $(filter     $(export-objs), $(int-m)))
 
 ifeq ($(CONFIG_LOWLEVEL_SOUND),y)
     O_OBJS	+= lowlevel/lowlevel.o
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/ad1816.c linux/drivers/sound/ad1816.c
--- linux.orig/drivers/sound/ad1816.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/ad1816.c	Thu Mar  9 15:49:27 2000
@@ -1386,7 +1386,7 @@
 	io	= ints[1];
 	irq	= ints[2];
 	dma	= ints[3];
-	dma16	= ints[4];
+	dma2	= ints[4];
 
 	return 1;
 }
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/ad1848.c linux/drivers/sound/ad1848.c
--- linux.orig/drivers/sound/ad1848.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/ad1848.c	Thu Mar  9 17:12:00 2000
@@ -2502,11 +2502,6 @@
 	int dma = hw_config->dma;
 	int dma2 = hw_config->dma2;
 
-	if(hw_config->io_base != -1 || hw_config->irq == -1 || hw_config->dma == -1) {
-		printk(KERN_WARNING "ad1848: must give I/O , IRQ and DMA.\n");
-		return;
-	}
-
 	if (hw_config->card_subtype == 1)	/* Has no IRQ/DMA registers */
 	{
 		hw_config->slots[0] = ad1848_init("MS Sound System", hw_config->io_base + 4,
@@ -2573,9 +2568,6 @@
 					  dma2, 0,
 					  hw_config->osp);
 	request_region(hw_config->io_base, 4, "WSS config");
-
-	SOUND_LOCK;
-	loaded = 1;
 }
 
 void unload_ms_sound(struct address_info *hw_config)
@@ -2710,15 +2702,6 @@
 EXPORT_SYMBOL(attach_ms_sound);
 EXPORT_SYMBOL(unload_ms_sound);
 
-MODULE_PARM(io, "i");			/* I/O for a raw AD1848 card */
-MODULE_PARM(irq, "i");			/* IRQ to use */
-MODULE_PARM(dma, "i");			/* First DMA channel */
-MODULE_PARM(dma2, "i");			/* Second DMA channel */
-MODULE_PARM(type, "i");			/* Card type */
-MODULE_PARM(deskpro_xl, "i");		/* Special magic for Deskpro XL boxen */
-MODULE_PARM(deskpro_m, "i");		/* Special magic for Deskpro M box */
-MODULE_PARM(soundpro, "i");		/* More special magic for SoundPro chips */
-
 static int __initdata io = -1;
 static int __initdata irq = -1;
 static int __initdata dma = -1;
@@ -2727,21 +2710,41 @@
 
 static struct address_info cfg;
 
+MODULE_PARM(io, "i");                   /* I/O for a raw AD1848 card */
+MODULE_PARM(irq, "i");                  /* IRQ to use */
+MODULE_PARM(dma, "i");                  /* First DMA channel */
+MODULE_PARM(dma2, "i");                 /* Second DMA channel */
+MODULE_PARM(type, "i");                 /* Card type */
+MODULE_PARM(deskpro_xl, "i");           /* Special magic for Deskpro XL boxen
+*/
+MODULE_PARM(deskpro_m, "i");            /* Special magic for Deskpro M box */
+MODULE_PARM(soundpro, "i");             /* More special magic for SoundPro
+chips */
+
 static int __init init_ad1848(void)
 {
 	printk(KERN_INFO "ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996\n");
 
-	cfg.irq = irq;
-	cfg.io_base = io;
-	cfg.dma = dma;
-	cfg.dma2 = dma2;
-	cfg.card_subtype = type;
+	if(io != -1) {
+		if(irq == -1 || dma == -1) {
+			printk(KERN_WARNING "ad1848: must give I/O , IRQ and DMA.\n");
+			return -EINVAL;
+		}
+
+		cfg.irq = irq;
+		cfg.io_base = io;
+		cfg.dma = dma;
+		cfg.dma2 = dma2;
+		cfg.card_subtype = type;
 
-	if(probe_ms_sound(&cfg)) {
+		if(!probe_ms_sound(&cfg))
+			return -ENODEV;
 		attach_ms_sound(&cfg);
-		return 0;
-	} else
-		return -ENODEV;
+		loaded = 1;
+	}
+	
+	SOUND_LOCK;
+	return 0;
 }
 
 static void __exit cleanup_ad1848(void)
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/lowlevel/Config.in linux/drivers/sound/lowlevel/Config.in
--- linux.orig/drivers/sound/lowlevel/Config.in	Wed Mar  8 18:39:38 2000
+++ linux/drivers/sound/lowlevel/Config.in	Thu Mar  9 17:22:43 2000
@@ -33,9 +33,9 @@
 	    bool 'Audio Excel DSP 16 (SBPro emulation)' CONFIG_AEDSP16_SBPRO
 	    if [ "$CONFIG_AEDSP16_SBPRO" = "y" ]; then
 	       comment 'Audio Excel DSP 16 [Sound Blaster Pro]'
-	       hex 'I/O base for Audio Excel DSP 16 220, 240' CONFIG_AEDSP16_BASE $CONFIG_SB_BASE 220
-	       int 'Audio Excel DSP 16 IRQ 5, 7, 9, 10, 11' CONFIG_AEDSP16_SB_IRQ $CONFIG_SB_IRQ 5
-	       int 'Audio Excel DSP 16 DMA 0, 1 or 3' CONFIG_AEDSP16_SB_DMA $CONFIG_SB_DMA 0
+	       hex 'I/O base for Audio Excel DSP 16 220, 240' CONFIG_AEDSP16_BASE 220
+	       int 'Audio Excel DSP 16 IRQ 5, 7, 9, 10, 11' CONFIG_AEDSP16_SB_IRQ 5
+	       int 'Audio Excel DSP 16 DMA 0, 1 or 3' CONFIG_AEDSP16_SB_DMA 0
 	    fi
 	 fi
       fi
@@ -46,8 +46,8 @@
 	    if [ "$CONFIG_AEDSP16_MSS" = "y" ]; then
 	       comment 'Audio Excel DSP 16 [Microsoft Sound System]'
 	       hex 'I/O base for Audio Excel DSP 16 220 or 240' CONFIG_AEDSP16_BASE 220
-	       int 'Audio Excel DSP 16 IRQ 5, 7, 9, 10, 11' CONFIG_AEDSP16_MSS_IRQ $CONFIG_MSS_IRQ 5
-	       int 'Audio Excel DSP 16 DMA 0, 1 or 3' CONFIG_AEDSP16_MSS_DMA $CONFIG_MSS_DMA 1
+	       int 'Audio Excel DSP 16 IRQ 5, 7, 9, 10, 11' CONFIG_AEDSP16_MSS_IRQ 5
+	       int 'Audio Excel DSP 16 DMA 0, 1 or 3' CONFIG_AEDSP16_MSS_DMA 1
 	    fi
 	 fi
       fi
@@ -59,7 +59,7 @@
 	    if [ "$CONFIG_AEDSP16_SBPRO" != "y" -a "$CONFIG_AEDSP16_MSS" != "y" ]; then
 	       hex 'I/O base for Audio Excel DSP 16 220 or 240' CONFIG_AEDSP16_BASE 220
 	    fi
-	    int 'MPU401 IRQ for Audio Excel DSP 16 5, 7, 9, 10 or 0 (disable)' CONFIG_AEDSP16_MPU_IRQ $CONFIG_MPU_IRQ
+	    int 'MPU401 IRQ for Audio Excel DSP 16 5, 7, 9, 10 or 0 (disable)' CONFIG_AEDSP16_MPU_IRQ 0
 	 fi
       fi
    fi
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/mad16.c linux/drivers/sound/mad16.c
--- linux.orig/drivers/sound/mad16.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/mad16.c	Thu Mar  9 17:13:33 2000
@@ -1098,7 +1098,7 @@
 	return 0;
 }
 
-static void __exit cleanup_mad16(void)
+static void __exit exit_mad16(void)
 {
 	if (found_mpu)
 		unload_mad16_mpu(&cfg_mpu);
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/sb_common.c linux/drivers/sound/sb_common.c
--- linux.orig/drivers/sound/sb_common.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/sb_common.c	Thu Mar  9 16:40:48 2000
@@ -21,9 +21,6 @@
  *
  */
 
-/* FIXME: *grr* why can't the f**in Makefile do this for me ? */
-#define EXPORT_SYMTAB
-
 #include <linux/config.h>
 #include <linux/init.h>
 #include <linux/module.h>
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/Introduction linux/Documentation/sound/Introduction
--- linux.orig/Documentation/sound/Introduction	Wed Mar  8 18:36:36 2000
+++ linux/Documentation/sound/Introduction	Wed Mar  8 18:24:22 2000
@@ -160,8 +160,6 @@
 =============
 
 The status of sound may be read/checked by:
-	cat /proc/sound
-	cat /dev/sndstat
         cat (anyfile).au >/dev/audio
 
 The status of the modules and which modules depend on 
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/Maestro linux/Documentation/sound/Maestro
--- linux.orig/Documentation/sound/Maestro	Wed Mar  8 18:35:12 2000
+++ linux/Documentation/sound/Maestro	Wed Mar  8 18:25:22 2000
@@ -30,8 +30,7 @@
 --------------------
 
 This OSS driver exports /dev/mixer and /dev/dsp to applications, which
-mostly adhere to the OSS spec.   This driver doesn't register itself
-with /dev/sndstat, so don't expect information to appear there.
+mostly adhere to the OSS spec.
 
 The /dev/dsp device exported behaves almost as expected.  Playback is
 supported in all the various lovely formats.  8/16bit stereo/mono from
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/OPL3-SA linux/Documentation/sound/OPL3-SA
--- linux.orig/Documentation/sound/OPL3-SA	Thu Apr 29 20:53:41 1999
+++ linux/Documentation/sound/OPL3-SA	Wed Mar  8 18:22:32 2000
@@ -48,33 +48,5 @@
 
 If you chose to build it as a module, just insmod the resulting softoss2.o
 
-A 'cat /dev/sndstat' with all the above options should look similar to this:
-
-  OSS/Free:3.8s2++-971130
-  Load type: Driver loaded as a module
-  Kernel: Linux iniquity 2.1.105 #145 Mon Jun 8 11:40:47 MST 1998 i586
-  Config options: 0
-
-  Installed drivers: 
-
-  Card config: 
-
-  Audio devices:
-  0: MSS audio codec (CS4231) (DUPLEX)
-
-  Synth devices:
-  0: Yamaha OPL-3
-  1: SoftOSS
-
-  Midi devices:
-  0: OPL3-SA (MPU401)
-
-  Timers:
-  0: System clock
-  1: MSS audio codec (CS4231)
-
-  Mixers:
-  0: MSS audio codec (CS4231)
-
 Questions? Comments?
 <stiker@northlink.com>
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/Opti linux/Documentation/sound/Opti
--- linux.orig/Documentation/sound/Opti	Sat Nov  6 19:38:40 1999
+++ linux/Documentation/sound/Opti	Wed Mar  8 18:24:52 2000
@@ -99,9 +99,7 @@
 
 When any sound device is opened the kernel requests auto-loading
 of char-major-14. There is a built-in alias that translates this
-request to loading the main sound module. The main sound module
-contains only common code which is needed by all the sound drivers,
-and the driver for /dev/sndstat.
+request to loading the main sound module.
 
 The sound module in its turn will request loading of a sub-driver
 for mixer, audio, midi or synthesizer device. The first 3 are
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/README.OSS linux/Documentation/sound/README.OSS
--- linux.orig/Documentation/sound/README.OSS	Thu Apr 29 20:53:41 1999
+++ linux/Documentation/sound/README.OSS	Wed Mar  8 18:24:02 2000
@@ -147,24 +147,9 @@
 at /var/adm/messages for more verbose error message.
 
 
-In general the easiest way to diagnose problems is to do "cat /dev/sndstat".
-
-If you get an error message, there are some problems with the driver setup:
-
-	- "No such file or directory" tells that the device files for
-	the sound driver are missing. Use the script at the end of
-	linux/drivers/sound/Readme.linux to create them.
-
-	- "No such device" tells that the sound driver is not in the kernel.
-	You have to reconfigure and recompile the kernel to have the sound
-	driver. Compiling the driver doesn't help alone. You have to boot
-	with the newly compiled one before the driver becomes active.
-	The Linux-HOWTO should help in this step.
-
 The following errors are likely with /dev/dsp and /dev/audio.
 
-	- "No such device or address". This error message should not happen
-	with /dev/sndstat but it's possible with the other sound devices.
+	- "No such device or address".
 	This error indicates that there are no suitable hardware for the
 	device file or the sound driver has been compiled without support for
 	this particular device. For example /dev/audio and /dev/dsp will not
@@ -180,10 +165,6 @@
 	with impossible parameters. Check that the application is
 	for sound driver version 2.X or later.
 
-In general the printout of /dev/sndstat should tell what is the problem.
-It's possible that there are bugs in the sound driver but 99% of the problems
-reported to me are caused by somehow incorrect setup during "make config".
-
 Linux installation
 ==================
 
@@ -226,17 +207,6 @@
 Problems
 --------
 
-If you have any kind of problems, there is a debugging feature which
-could help you to solve the problem. To use it, just execute the
-command:
-
-	cat /dev/sndstat 
-
-and look at the output. It should display some useful info about the
-driver configuration. If there is no /dev/sndstat 
-(/dev/sndstat: No such file or directory), ensure that you have executed the
-soundinstall script (at the end of this file).
-
 Common error messages:
 
 - /dev/???????: No such file or directory.
@@ -757,10 +727,6 @@
 The sound driver configuration dialog
 -------------------------------------
 
-If you already have the sound driver installed, consult a printout of
-"cat /dev/sndstat" when configuring the driver again. It gives the I/O,
-IRQ and DMA settings you used earlier.
-
 Sound configuration starts by making some yes/no questions. Be careful
 when answering to these questions since answering y to a question may
 prevent some later ones from being asked. For example don't answer y to
@@ -1417,8 +1383,7 @@
 Please check the version of sound driver you are using before 
 complaining that your card is not supported. It's possible you are 
 using a driver version which was released months before your card was
-introduced.  The driver's release date is listed after its version number in a
-"cat /dev/sndstat" printout and in the file linux/drivers/sound/soundvers.h.
+introduced.
 
 First of all, there is an easy way to make most sound cards work with Linux.
 Just use the DOS based driver to initialize the card to a known state, then use
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/README.cmdline linux/Documentation/sound/README.cmdline
--- linux.orig/Documentation/sound/README.cmdline	Thu Jan  1 01:00:00 1970
+++ linux/Documentation/sound/README.cmdline	Thu Mar  9 17:46:41 2000
@@ -0,0 +1,27 @@
+
+Since 2.3.50 the soudn resources are specified on the kernel
+command line and no more at compile time.
+The follwing sound specific parameters exist:
+
+	ad1816=io,irq,dma,dma2
+	ad1848=io,irq,dma,dma2[,type]
+	adlib=io
+	cs4232=io,irq,dma,dma2,mpuio,mpuirq
+	gus=io,irq,dma,dma2
+	mad16=io,irq,dma,dma2,mpuio,mpuirq
+	maui=io,irq
+	mpu401=io,irq
+	opl3=io
+	opl3sa=io,irq,dma,dma2,mpuio,mpuirq
+	opl3sa2=io,irq,dma,dma2,mssio,mpuio
+	pas2=io,irq,dma,dma2,sbio,sbirq,sbdma,sbdma2
+	pss=io,mssio,mssirq,mssdma,mpuio,mpuirq
+	sb=io,irq,dma,dma2
+	sgalaxy=io,irq,dma,dma2,sgbase
+	sscape=io,irq,dma,mpuio,mpuirq
+	trix=io,irq,dma,dma2,sbio,sbirq,sbdma,mpuio,mpuirq
+	uart401=io,irq
+	uart6850=io,irq
+	waveartist=io,irq,dma,dma2
+
+Christoph Hellwig <chhellwig@gmx.net>
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/Wavefront linux/Documentation/sound/Wavefront
--- linux.orig/Documentation/sound/Wavefront	Sat Nov  6 19:38:40 1999
+++ linux/Documentation/sound/Wavefront	Wed Mar  8 18:25:07 2000
@@ -293,36 +293,6 @@
 The "available DRAM" line will vary depending on how much added RAM
 your card has. Mine has 8MB.
 
-Next, check /dev/sndstat, which on my machine says:
----------------------------------------------------------------------
-OSS/Free:3.8s2++-971130
-Load type: Driver loaded as a module
-Kernel: Linux bd 2.1.106 #12 SMP Fri Jul 3 00:37:34 EDT 1998 i486
-Config options: 0
-
-Installed drivers: 
-
-Card config: 
-
-Audio devices:
-0: Crystal audio controller (CS4232) (DUPLEX)
-
-Synth devices:
-0: Turtle Beach WaveFront
-1: Yamaha OPL-3
-
-Midi devices:
-0: WaveFront Internal MIDI
-1: WaveFront External MIDI
-
-Timers:
-0: System clock
-1: Crystal audio controller (CS4232)
-
-Mixers:
-0: Crystal audio controller (CS4232)
------------------------------------------------------------
-
 To check basically functionality, use play(1) or splay(1) to send a
 .WAV or other audio file through the audio portion. Then use playmidi
 to play a General MIDI file. Try the "-D 0" to hear the
diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/sound/via82cxxx.txt linux/Documentation/sound/via82cxxx.txt
--- linux.orig/Documentation/sound/via82cxxx.txt	Wed Mar  8 18:36:00 2000
+++ linux/Documentation/sound/via82cxxx.txt	Wed Mar  8 18:26:05 2000
@@ -122,25 +122,7 @@
 Known bugs (patches/suggestions welcome)
 ------------------------------------------------------------------------
 1) Two MIDI devices are loaded by the sound driver.  Eliminate one of them. 
-Sample /proc/sound output:
-
-	Midi devices:
-	0: Sound Blaster
-	1: VIA 82Cxxx Audio driver 1.1.2
 
 2) Two mixer devices are loaded by the sound driver.  Eliminate one of
 them.  At least one bug report says that SB mixer does not work at all,
-only AC97 mixer.  Sample /proc/sound output:
-
-	Mixers:
-	0: via82cxxxAC97Mixer
-	1: Sound Blaster
-
-3) After unloading the driver, a SoundBlaster MIDI device is still 
-listed in /proc/sound.  Investigate what is not being unloaded,
-and fix it.  Sample /proc/sound output, after 'rmmod via82cxxx':
-
-	Midi devices:
-	0: Sound Blaster
-
-
+only AC97 mixer.

--1yeeQ81UyVL57Vl7--
