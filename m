From: Christoph Hellwig <chhellwig@gmx.net>
Date: Fri, 10 Mar 2000 17:54:48 +0000
Subject: Re: [PATCH] Sound drivers fixes for pre-patch-2.3.51-2
MIME-Version: 1
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Message-Id: <marc-linux-sound-95271389900247@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii

On Fri, Mar 10, 2000 at 07:36:06AM +0100, Niels Kristian Bech Jensen wrote:
> Hi Christoph,
> I've kept looking at ad1848.c to try to understand what went wrong. I
> think it's quite fundamental. In the driver you initialize the io, irq,
> dma, etc. variables AFTER reading the module parameters, i.e. you
> overwrite the parameter values. I've included a patch that fixes this and
> moves the test for valid io, irq and dma to probe_ms_sound(), where I
> think it belongs. It now looks more like the similar code in sb_card.c:

Ok, that problem was much bigger ...
Here's the final fix (against 2.3.51pre2), it's tested by quite some people.

Christoph

P.S. Niels, I hope the CC to the list doesn't worry you ?

-- 
Always remember that you are unique.  Just like everyone else.

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sound-fix-3.diff"

diff -rNu --exclude-from=/usr/src/exclude linux.orig/Documentation/Configure.help linux/Documentation/Configure.help
--- linux.orig/Documentation/Configure.help	Fri Mar 10 17:21:00 2000
+++ linux/Documentation/Configure.help	Fri Mar 10 17:56:05 2000
@@ -11446,11 +11446,15 @@
   This module initializes the older non Plug and Play sound galaxy
   cards from Aztech. It supports the Waverider Pro 32 - 3D and the
   Galaxy Washington 16.
+  If you compile the driver into the kernel, you have to add
+  "sgalaxy=<io>,<irq>,<dma>,<dma2>,<sgbase>" to the kernel command line.
 
 Support for AD1816(A) based cards (EXPERIMENTAL)
 CONFIG_SOUND_AD1816
   Say M here if you have a sound card based on the Analog Devices 
   AD1816(A) chip.
+  If you compile the driver into the kernel, you have to add
+  "ad1816=<io>,<irq>,<dma>,<dma2>" to the kernel command line.
 
   NOTE: This driver is still EXPERIMENTAL. 
         See Documentation/sound/AD1816 for further information.
@@ -11460,6 +11464,9 @@
   Say Y or M if you have a Yamaha OPL3-SA1 sound chip, which is
   usually built into motherboards. Read Documentation/sound/OPL3-SA
   for details.
+  If you compile the driver into the kernel, you have to add
+  "opl3sa=<io>,<irq>,<dma>,<dma2>,<mpuio>,<mpuirq>" to the kernel
+  command line.
 
 ProAudioSpectrum 16 support
 CONFIG_SOUND_PAS
@@ -11467,6 +11474,9 @@
   16 or Logitech SoundMan 16 sound card. Don't answer Y if you have
   some other card made by Media Vision or Logitech since they are not
   PAS16 compatible.
+  If you compile the driver into the kernel, you have to add
+  "pas2=<io>,<irq>,<dma>,<dma2>,<sbio>,<sbirq>,<sbdma>,<sbdma2>
+  to the kernel command line.
 
 100% Sound Blaster compatibles (SB16/32/64, ESS, Jazz16) support
 CONFIG_SOUND_SB
@@ -11484,6 +11494,8 @@
   Y here and also to "Additional lowlevel drivers" and to "SB32/AWE
   support" below and read Documentation/sound/INSTALL.awe. If you have
   an IBM Mwave card, say Y here and read Documentation/sound/mwave.
+  If you compile the driver into the kernel and don't want to use isapnp,
+  you have to add "sb=<io>,<irq>,<dma>,<dma2>" to the kernel command line.
   
   You can say M here to compile this driver as a module; the module is
   called sb.o.
@@ -11499,6 +11511,8 @@
   Say Y here for any type of Gravis Ultrasound card, including
   the GUS or GUS MAX. See also Documentation/sound/ultrasound for
   more information on configuring this card with modules.
+  If you compile the driver into the kernel, you have to add
+  "gus=<io>,<irq>,<dma>,<dma2>" to the kernel command line.
 
 MPU-401 support (NOT for SB16)
 CONFIG_SOUND_MPU401
@@ -11510,12 +11524,16 @@
   was in the list of supported cards, look at the card specific
   instructions in the drivers/sound/Readme.cards file. It's safe to
   answer Y if you have a true MPU401 MIDI interface card.
+  If you compile the driver into the kernel, you have to add
+  "mpu401=<io>,<irq>" to the kernel command line.
 
 6850 UART support
 CONFIG_SOUND_UART6850
   This option enables support for MIDI interfaces based on the 6850
   UART chip. This interface is rarely found on sound cards. It's safe
   to answer N to this question.
+  If you compile the driver into the kernel, you have to add
+  "uart6850=<io>,<irq>" to the kernel command line.
 
 VIDC Sound
 CONFIG_VIDC_SOUND
@@ -11529,6 +11547,9 @@
   ADSP-2115 DSP chip + Echo ESC614 ASIC CHIP). For more information on
   how to compile it into the kernel or as a module see the file
   Documentation/sound/PSS.
+  If you compile the driver into the kernel, you have to add
+  "pss=<io>,<mssio>,<mssirq>,<mssdma>,<mpuio>,<mpuirq>" to the kernel
+  command line.
 
 Enable PSS mixer (Beethoven ADSP-16 and other compatible)
 CONFIG_PSS_MIXER
@@ -11587,6 +11608,8 @@
   specific instructions in drivers/sound/Readme.cards. Some drivers
   have their own MSS support and saying Y to this option will cause a
   conflict.
+  If you compile the driver into the kernel, you have to add
+  "ad1848=<io>,<irq>,<dma>,<dma2>[,<type>]" to the kernel command line.
 
 SGI Visual Workstation on-board audio
 CONFIG_SOUND_VWSND
@@ -11599,11 +11622,16 @@
   Answer Y if you have a sound card based on the Ensoniq SoundScape
   chipset. Such cards are being manufactured at least by Ensoniq, Spea
   and Reveal (Reveal makes also other cards).
+  If you compile the driver into the kernel, you have to add
+  "sscape=<io>,<irq>,<dma>,<mpuio>,<mpuirq>" to the kernel command line.
 
 MediaTriX AudioTriX Pro support
 CONFIG_SOUND_TRIX
   Answer Y if you have the AudioTriX Pro sound card manufactured
   by MediaTrix.
+  If you compile the driver into the kernel, you have to add
+  "trix=<io>,<irq>,<dma>,<dma2>,<sbio>,<sbirq>,<sbdma>,<mpuio>,<mpuirq>"
+  to the kernel command line.
 
 Have TRXPRO.HEX firmware file
 CONFIG_TRIX_HAVE_BOOT
@@ -11628,6 +11656,9 @@
   and Diamond (latest ones). Note however that the Tropez sound cards
   have their own driver; if you have one of those, say N here and Y or
   M to "Full support for Turtle Beach WaveFront", below. 
+  If you compile the driver into the kernel, you have to add
+  "mad16=<io>,<irq>,<dma>,<dma2>,<mpuio>,<mpuirq>" to the
+  kernel command line.
 
   See also Documentation/sound/Opti and Documentation/sound/MAD16 for
   more information on setting these cards up as modules.
@@ -11647,7 +11678,10 @@
 Support for Crystal CS4232 based (PnP) cards
 CONFIG_SOUND_CS4232
   Say Y here if you have a card based on the Crystal CS4232 chip set,
-  which uses its own Plug and Play protocol. 
+  which uses its own Plug and Play protocol.
+  If you compile the driver into the kernel, you have to add
+  "cs4232=<io>,<irq>,<dma>,<dma2>,<mpuio>,<mpuirq>" to the kernel
+  command line.
 
   See Documentation/sound/CS4232 for more information on configuring
   this card.
@@ -11657,11 +11691,16 @@
   Say Y or M if you have a card based on one of these Yamaha
   sound chipsets. Read Documentation/sound/OPL3-SA2 for more
   information on configuring these cards.
+  If you compile the driver into the kernel, you have to add
+  "opl3sa2=<io>,<irq>,<dma>,<dma2>,<mssio>,<mpuio>" to the kernel
+  command line.
 
 Support for Turtle Beach Wave Front (Maui, Tropez) synthesizers
 CONFIG_SOUND_MAUI
   Say Y here if you have a Turtle Beach Wave Front, Maui, or Tropez
   sound card.
+  If you compile the driver into the kernel, you have to add
+  "maui=<io>,<irq>" to the kernel command line.
 
 Have OSWF.MOT firmware file
 CONFIG_MAUI_HAVE_BOOT
@@ -11749,18 +11788,6 @@
   and Pinnacle). Larger values reduce the chance of data overruns at
   the expense of overall latency. If unsure, use the default.
 
-/dev/dsp and /dev/audio support
-CONFIG_SOUND_AUDIO
-  If you say Y here, you will get the /dev/dsp and /dev/audio devices;
-  these are the analog-digital and digital-analog converter devices
-  and are very useful, so say Y.
-
-MIDI interface support
-CONFIG_SOUND_MIDI
-  Answering N disables /dev/midixx devices and access to any MIDI
-  ports using /dev/sequencer and /dev/music. This option also affects
-  any MPU401 and/or General MIDI compatible devices. Answer Y.
-
 FM synthesizer (YM3812/OPL-3) support
 CONFIG_SOUND_YM3812
   Answer Y if your card has a FM chip made by Yamaha (OPL2/OPL3/OPL4).
@@ -11770,6 +11797,8 @@
   cards, however).
   Please read the file Documentation/sound/OPL3 if your card has an
   OPL3 chip.
+  If you compile the driver into the kernel, you have to add
+  "opl3=<io>" to the kernel command line.
 
   If unsure, say Y.
  
@@ -11778,13 +11807,6 @@
   This is support for the sound cards on Sun workstations. The code
   does not exist yet, so you might as well say N here.
 
-Additional low level drivers
-CONFIG_LOWLEVEL_SOUND
-  If you need additional low level sound drivers which have not yet
-  appeared, say Y. The answer to this question does not directly
-  affect the kernel; saying Y will simply cause this configure script
-  to present you with more options. If unsure, say Y.
-
 ACI mixer (miroPCM12/PCM20)
 CONFIG_SOUND_ACI_MIXER
   ACI (Audio Command Interface) is a protocol used to communicate with
@@ -11830,6 +11852,9 @@
   You should then say Y to "100% Sound Blaster compatibles
   (SB16/32/64, ESS, Jazz16) support" and N to "Audio Excel DSP 16 (MSS
   emulation)".
+  If you compile the driver into the kernel, you have to add
+  "aedsp16=<io>,<irq>,<dma>,<mssio>,<mpuio>,<mouirq>" to the kernel
+  command line.
 
 Audio Excel DSP 16 (MSS emulation)
 CONFIG_AEDSP16_MSS
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/ad1848.c linux/drivers/sound/ad1848.c
--- linux.orig/drivers/sound/ad1848.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/ad1848.c	Fri Mar 10 17:58:15 2000
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
diff -rNu --exclude-from=/usr/src/exclude linux.orig/drivers/sound/mad16.c linux/drivers/sound/mad16.c
--- linux.orig/drivers/sound/mad16.c	Wed Mar  8 18:40:24 2000
+++ linux/drivers/sound/mad16.c	Fri Mar 10 17:59:11 2000
@@ -1107,7 +1107,7 @@
 }
 
 module_init(init_mad16);
-module_exit(exit_mad16);
+module_exit(cleanup_mad16);
 
 #ifndef MODULE
 static int __init setup_mad16(char *str)

--a8Wt8u1KmwUX3Y2C--
