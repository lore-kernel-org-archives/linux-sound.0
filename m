From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 12 Aug 1999 19:20:22 +0000
Subject: 2.3.13 sound driver updates
Message-Id: <marc-linux-sound-93448571607832@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Changes:
- esssolo1: recording might now work, also MIDI shouldn't cause the driver
  to lock up hard
- es1371: (actually es1373) SPDIF output can now be enabled
- rest: module_init/__setup changes

Note: The makefiles-2.3.13 patch posted a moment ago to linux-kernel
is necessary for the drivers if built-in (modules work fine without)

Tom

--- drivers/sound/es1370.c	1999/08/10 11:13:08	0.26
+++ drivers/sound/es1370.c	1999/08/12 19:06:08
@@ -106,6 +106,7 @@
  *    03.08.99   0.26  adapt to Linus' new __setup/__initcall
  *                     added kernel command line option "es1370=3Djoystick=
[,lineout[,micbias]]"
  *                     removed CONFIG_SOUND_ES1370_JOYPORT_BOOT kludge
+ *    12.08.99   0.27  module_init/__setup fixes
  *
  * some important things missing in Ensoniq documentation:
  *
@@ -1067,9 +1068,10 @@
                         current->state =3D TASK_RUNNING;
                         return -EBUSY;
                 }
-		tmo =3D (count * HZ) / dac1_samplerate[(s->ctrl & CTRL_WTSRSEL) >> CTRL_=
SH_WTSRSEL];
+		tmo =3D 3 * HZ * (count + s->dma_dac1.fragsize) / 2
+			/ dac1_samplerate[(s->ctrl & CTRL_WTSRSEL) >> CTRL_SH_WTSRSEL];
 		tmo >>=3D sample_shift[(s->sctrl & SCTRL_P1FMT) >> SCTRL_SH_P1FMT];
-		if (!schedule_timeout(tmo ? : 1) && tmo)
+		if (!schedule_timeout(tmo + 1))
 			DBG(printk(KERN_DEBUG "es1370: dma timed out??\n");)
         }
         remove_wait_queue(&s->dma_dac1.wait, &wait);
@@ -1102,9 +1104,10 @@
                         current->state =3D TASK_RUNNING;
                         return -EBUSY;
                 }
-		tmo =3D (count * HZ) / DAC2_DIVTOSR((s->ctrl & CTRL_PCLKDIV) >> CTRL_SH_=
PCLKDIV);
+		tmo =3D 3 * HZ * (count + s->dma_dac2.fragsize) / 2
+			/ DAC2_DIVTOSR((s->ctrl & CTRL_PCLKDIV) >> CTRL_SH_PCLKDIV);
 		tmo >>=3D sample_shift[(s->sctrl & SCTRL_P2FMT) >> SCTRL_SH_P2FMT];
-		if (!schedule_timeout(tmo ? : 1) && tmo)
+		if (!schedule_timeout(tmo + 1))
 			DBG(printk(KERN_DEBUG "es1370: dma timed out??\n");)
         }
         remove_wait_queue(&s->dma_dac2.wait, &wait);
@@ -2300,6 +2303,16 @@
 static int lineout[NR_DEVICE] =3D { 0, };
 static int micbias[NR_DEVICE] =3D { 0, };
=20
+MODULE_PARM(joystick, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(joystick, "if 1 enables joystick interface (still need se=
parate driver)");
+MODULE_PARM(lineout, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(lineout, "if 1 the LINE input is converted to LINE out");
+MODULE_PARM(micbias, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(micbias, "sets the +5V bias for an electret microphone");
+
+MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu=
");
+MODULE_DESCRIPTION("ES1370 AudioPCI Driver");
+
 /* --------------------------------------------------------------------- */
=20
 static struct initvol {
@@ -2318,10 +2331,7 @@
 	{ SOUND_MIXER_WRITE_OGAIN, 0x4040 }
 };
=20
-#ifndef MODULE
-static
-#endif
-int __init init_module(void)
+static int __init init_es1370(void)
 {
 	struct es1370_state *s;
 	struct pci_dev *pcidev =3D NULL;
@@ -2330,7 +2340,7 @@
=20
 	if (!pci_present())   /* No PCI bus in this machine! */
 		return -ENODEV;
-	printk(KERN_INFO "es1370: version v0.26 time " __TIME__ " " __DATE__ "\n"=
);
+	printk(KERN_INFO "es1370: version v0.27 time " __TIME__ " " __DATE__ "\n"=
);
 	while (index < NR_DEVICE &&=20
 	       (pcidev =3D pci_find_device(PCI_VENDOR_ID_ENSONIQ, PCI_DEVICE_ID_E=
NSONIQ_ES1370, pcidev))) {
 		if (pcidev->resource[0].flags =3D 0 ||=20
@@ -2438,21 +2448,7 @@
 	return 0;
 }
=20
-/* --------------------------------------------------------------------- */
-
-#ifdef MODULE
-
-MODULE_PARM(joystick, "1-" __MODULE_STRING(NR_DEVICE) "i");
-MODULE_PARM_DESC(joystick, "if 1 enables joystick interface (still need se=
parate driver)");
-MODULE_PARM(lineout, "1-" __MODULE_STRING(NR_DEVICE) "i");
-MODULE_PARM_DESC(lineout, "if 1 the LINE input is converted to LINE out");
-MODULE_PARM(micbias, "1-" __MODULE_STRING(NR_DEVICE) "i");
-MODULE_PARM_DESC(micbias, "sets the +5V bias for an electret microphone");
-
-MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu=
");
-MODULE_DESCRIPTION("ES1370 AudioPCI Driver");
-
-void cleanup_module(void)
+static void __exit cleanup_es1370(void)
 {
 	struct es1370_state *s;
=20
@@ -2472,7 +2468,12 @@
 	printk(KERN_INFO "es1370: unloading\n");
 }
=20
-#else /* MODULE */
+module_init(init_es1370);
+module_exit(cleanup_es1370);
+
+/* --------------------------------------------------------------------- */
+
+#ifndef MODULE
=20
 /* format is: es1370=3D[joystick[,lineout[,micbias]]] */
=20
@@ -2493,6 +2494,5 @@
 }
=20
 __setup("es1370=3D", es1370_setup);
-__initcall(init_module);
=20
 #endif /* MODULE */
--- drivers/sound/es1371.c	1999/08/10 11:13:46	0.14
+++ drivers/sound/es1371.c	1999/08/12 19:05:51
@@ -3,7 +3,7 @@
 /*
  *      es1371.c  --  Creative Ensoniq ES1371.
  *
- *      Copyright (C) 1998  Thomas Sailer (sailer@ife.ee.ethz.ch)
+ *      Copyright (C) 1998-1999  Thomas Sailer (sailer@ife.ee.ethz.ch)
  *
  *      This program is free software; you can redistribute it and/or modi=
fy
  *      it under the terms of the GNU General Public License as published =
by
@@ -71,6 +71,9 @@
  *    03.08.99   0.14  adapt to Linus' new __setup/__initcall
  *                     added kernel command line option "es1371=3Djoystick=
addr"
  *                     removed CONFIG_SOUND_ES1371_JOYPORT_BOOT kludge
+ *    10.08.99   0.15  (Re)added S/PDIF module option for cards revision >=
=3D 4.
+ *                     Initial version by Dave Platt <dplatt@snulbug.mtvie=
w.ca.us>.
+ *                     module_init/__setup fixes
  *
  */
=20
@@ -145,6 +148,7 @@
 static const unsigned sample_size[] =3D { 1, 2, 2, 4 };
 static const unsigned sample_shift[] =3D { 0, 1, 1, 2 };
=20
+#define CTRL_SPDIFEN_B  0x04000000
 #define CTRL_JOY_SHIFT  24
 #define CTRL_JOY_MASK   3
 #define CTRL_JOY_200    0x00000000  /* joystick base address */
@@ -180,6 +184,9 @@
=20
=20
 #define STAT_INTR       0x80000000  /* wired or of all interrupt bits */
+#define STAT_EN_SPDIF   0x00040000  /* enable S/PDIF circuitry */
+#define STAT_TS_SPDIF   0x00020000  /* test S/PDIF circuitry */
+#define STAT_TESTMODE   0x00010000  /* test ASIC */
 #define STAT_SYNC_ERR   0x00000100  /* 1 =3D codec sync error */
 #define STAT_VC         0x000000c0  /* CCB int source, 0=DAC1, 1=DAC2, 2=
=ADC, 3=3Dundef */
 #define STAT_SH_VC      6
@@ -1481,9 +1488,9 @@
                         current->state =3D TASK_RUNNING;
                         return -EBUSY;
                 }
-		tmo =3D (count * HZ) / s->dac1rate;
+		tmo =3D 3 * HZ * (count + s->dma_dac1.fragsize) / 2 / s->dac1rate;
 		tmo >>=3D sample_shift[(s->sctrl & SCTRL_P1FMT) >> SCTRL_SH_P1FMT];
-		if (!schedule_timeout(tmo ? : 1) && tmo)
+		if (!schedule_timeout(tmo + 1))
 			printk(KERN_DEBUG "es1371: dma timed out??\n");
         }
         remove_wait_queue(&s->dma_dac1.wait, &wait);
@@ -1516,9 +1523,9 @@
                         current->state =3D TASK_RUNNING;
                         return -EBUSY;
                 }
-		tmo =3D (count * HZ) / s->dac2rate;
+		tmo =3D 3 * HZ * (count + s->dma_dac2.fragsize) / 2 / s->dac2rate;
 		tmo >>=3D sample_shift[(s->sctrl & SCTRL_P2FMT) >> SCTRL_SH_P2FMT];
-		if (!schedule_timeout(tmo ? : 1) && tmo)
+		if (!schedule_timeout(tmo + 1))
 			printk(KERN_DEBUG "es1371: dma timed out??\n");
         }
         remove_wait_queue(&s->dma_dac2.wait, &wait);
@@ -2697,6 +2704,15 @@
 #define NR_DEVICE 5
=20
 static int joystick[NR_DEVICE] =3D { 0, };
+static int spdif[NR_DEVICE] =3D { 0, };
+
+MODULE_PARM(joystick, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(joystick, "sets address and enables joystick interface (s=
till need separate driver)");
+MODULE_PARM(spdif, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(spdif, "if 1 the output is in S/PDIF digital mode");
+
+MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu=
");
+MODULE_DESCRIPTION("ES1371 AudioPCI97 Driver");
=20
 /* --------------------------------------------------------------------- */
=20
@@ -2719,19 +2735,18 @@
 	{ SOUND_MIXER_WRITE_IGAIN, 0x4040 }
 };
=20
-#ifndef MODULE
-static
-#endif
-int __init init_module(void)
+static int __init init_es1371(void)
 {
 	struct es1371_state *s;
 	struct pci_dev *pcidev =3D NULL;
 	mm_segment_t fs;
 	int i, val, val2, index =3D 0;
+	u8 revision;
+	unsigned cssr;
=20
 	if (!pci_present())   /* No PCI bus in this machine! */
 		return -ENODEV;
-	printk(KERN_INFO "es1371: version v0.14 time " __TIME__ " " __DATE__ "\n"=
);
+	printk(KERN_INFO "es1371: version v0.15 time " __TIME__ " " __DATE__ "\n"=
);
 	while (index < NR_DEVICE &&=20
 	       (pcidev =3D pci_find_device(PCI_VENDOR_ID_ENSONIQ, PCI_DEVICE_ID_E=
NSONIQ_ES1371, pcidev))) {
 		if (pcidev->resource[0].flags =3D 0 ||=20
@@ -2784,6 +2799,18 @@
 			}
 		}
 		s->sctrl =3D 0;
+		cssr =3D 0;
+		/* check to see if s/pdif mode is being requested */
+		pci_read_config_byte(pcidev, PCI_REVISION_ID, &revision);
+		if (spdif[index]) {
+			if (revision >=3D 4) {
+				printk(KERN_INFO "es1371: enabling S/PDIF output\n");
+				cssr |=3D STAT_EN_SPDIF;
+				s->ctrl |=3D CTRL_SPDIFEN_B;
+			} else {
+				printk(KERN_ERR "es1371: revision %d does not support S/PDIF\n", revis=
ion);
+			}
+		}
 		/* initialize the chips */
 		outl(s->ctrl, s->io+ES1371_REG_CONTROL);
 		outl(s->sctrl, s->io+ES1371_REG_SERIAL_CONTROL);
@@ -2858,6 +2885,8 @@
 			mixer_ioctl(s, initvol[i].mixch, (unsigned long)&val);
 		}
 		set_fs(fs);
+		/* turn on S/PDIF output driver if requested */
+		outl(cssr, s->io+ES1371_REG_STATUS);
 		/* queue it for later freeing */
 		s->next =3D devs;
 		devs =3D s;
@@ -2883,17 +2912,7 @@
 	return 0;
 }
=20
-/* --------------------------------------------------------------------- */
-
-#ifdef MODULE
-
-MODULE_PARM(joystick, "1-" __MODULE_STRING(NR_DEVICE) "i");
-MODULE_PARM_DESC(joystick, "sets address and enables joystick interface (s=
till need separate driver)");
-
-MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu=
");
-MODULE_DESCRIPTION("ES1371 AudioPCI97 Driver");
-
-void cleanup_module(void)
+static void __exit cleanup_es1371(void)
 {
 	struct es1371_state *s;
=20
@@ -2913,23 +2932,27 @@
 	printk(KERN_INFO "es1371: unloading\n");
 }
=20
-#else /* MODULE */
+module_init(init_es1371);
+module_exit(cleanup_es1371);
+
+/* --------------------------------------------------------------------- */
+
+#ifndef MODULE
=20
 /* format is: es1371=3D[joystick] */
=20
 static int __init es1371_setup(char *str)
 {
 	static unsigned __initdata nr_dev =3D 0;
-        int ints[11];
=20
 	if (nr_dev >=3D NR_DEVICE)
 		return 0;
-	get_option(&str, &joystick[nr_dev]);
+	if (get_option(&str, &joystick[nr_dev]) =3D 2)
+		get_option(&str, &spdif[nr_dev]);
 	nr_dev++;
 	return 1;
 }
=20
 __setup("es1371=3D", es1371_setup);
-__initcall(init_module);
=20
 #endif /* MODULE */
--- drivers/sound/sonicvibes.c	1999/08/10 11:14:09	0.17
+++ drivers/sound/sonicvibes.c	1999/08/12 19:06:41
@@ -73,6 +73,7 @@
  *    28.06.99   0.16  Add pci_set_master
  *    03.08.99   0.17  adapt to Linus' new __setup/__initcall
  *                     added kernel command line options "sonicvibes=3Drev=
erb" and "sonicvibesdmaio=3Ddmaioaddr"
+ *    12.08.99   0.18  module_init/__setup fixes
  *
  */
=20
@@ -1268,9 +1269,9 @@
                         current->state =3D TASK_RUNNING;
                         return -EBUSY;
                 }
-		tmo =3D (count * HZ) / s->ratedac;
+		tmo =3D 3 * HZ * (count + s->dma_dac.fragsize) / 2 / s->ratedac;
 		tmo >>=3D sample_shift[(s->fmt >> SV_CFMT_ASHIFT) & SV_CFMT_MASK];
-		if (!schedule_timeout(tmo ? : 1) && tmo)
+		if (!schedule_timeout(tmo + 1))
 			printk(KERN_DEBUG "sv: dma timed out??\n");
         }
         remove_wait_queue(&s->dma_dac.wait, &wait);
@@ -2297,6 +2298,19 @@
=20
 static unsigned dmaio =3D 0xac00;
=20
+MODULE_PARM(reverb, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(reverb, "if 1 enables the reverb circuitry. NOTE: your ca=
rd must have the reverb RAM");
+#if 0
+MODULE_PARM(wavetable, "1-" __MODULE_STRING(NR_DEVICE) "i");
+MODULE_PARM_DESC(wavetable, "if 1 the wavetable synth is enabled");
+#endif
+
+MODULE_PARM(dmaio, "i");
+MODULE_PARM_DESC(dmaio, "if the motherboard BIOS did not allocate DDMA io,=
 allocate them starting at this address");
+
+MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu=
");
+MODULE_DESCRIPTION("S3 SonicVibes Driver");
+
 /* --------------------------------------------------------------------- */
=20
 static struct initvol {
@@ -2314,10 +2328,7 @@
 	{ SOUND_MIXER_WRITE_PCM, 0x4040 }
 };
=20
-#ifndef MODULE
-static
-#endif
-int __init init_module(void)
+static int __init init_sonicvibes(void)
 {
 	struct sv_state *s;
 	struct pci_dev *pcidev =3D NULL;
@@ -2326,7 +2337,7 @@
=20
 	if (!pci_present())   /* No PCI bus in this machine! */
 		return -ENODEV;
-	printk(KERN_INFO "sv: version v0.17 time " __TIME__ " " __DATE__ "\n");
+	printk(KERN_INFO "sv: version v0.18 time " __TIME__ " " __DATE__ "\n");
 #if 0
 	if (!(wavetable_mem =3D __get_free_pages(GFP_KERNEL, 20-PAGE_SHIFT)))
 		printk(KERN_INFO "sv: cannot allocate 1MB of contiguous nonpageable memo=
ry for wavetable data\n");
@@ -2499,24 +2510,7 @@
 	return 0;
 }
=20
-/* --------------------------------------------------------------------- */
-
-#ifdef MODULE
-
-MODULE_PARM(reverb, "1-" __MODULE_STRING(NR_DEVICE) "i");
-MODULE_PARM_DESC(reverb, "if 1 enables the reverb circuitry. NOTE: your ca=
rd must have the reverb RAM");
-#if 0
-MODULE_PARM(wavetable, "1-" __MODULE_STRING(NR_DEVICE) "i");
-MODULE_PARM_DESC(wavetable, "if 1 the wavetable synth is enabled");
-#endif
-
-MODULE_PARM(dmaio, "i");
-MODULE_PARM_DESC(dmaio, "if the motherboard BIOS did not allocate DDMA io,=
 allocate them starting at this address");
-
-MODULE_AUTHOR("Thomas M. Sailer, sailer@ife.ee.ethz.ch, hb9jnx@hb9w.che.eu=
");
-MODULE_DESCRIPTION("S3 SonicVibes Driver");
-
-void cleanup_module(void)
+static void __exit cleanup_sonicvibes(void)
 {
 	struct sv_state *s;
=20
@@ -2545,7 +2539,12 @@
 	printk(KERN_INFO "sv: unloading\n");
 }
=20
-#else /* MODULE */
+module_init(init_sonicvibes);
+module_exit(cleanup_sonicvibes);
+
+/* --------------------------------------------------------------------- */
+
+#ifndef MODULE
=20
 /* format is: sonicvibes=3D[reverb] sonicvibesdmaio=3Ddmaioaddr */
=20
@@ -2555,12 +2554,12 @@
=20
 	if (nr_dev >=3D NR_DEVICE)
 		return 0;
-
-	(   (get_option(&str, &reverb   [nr_dev]) =3D 2)
 #if 0
-	 &&  get_option(&str, &wavetable[nr_dev])
+	if (get_option(&str, &reverb[nr_dev]) =3D 2)
+		get_option(&str, &wavetable[nr_dev]);
+#else
+	get_option(&str, &reverb[nr_dev]);
 #endif
-	};
=20
 	nr_dev++;
 	return 1;
@@ -2568,16 +2567,14 @@
=20
 static int __init sonicvibesdmaio_setup(char *str)
 {
-        int ints[11];
+        int io;
=20
-        get_options(str, ints);
-	if (ints[0] >=3D 1)
-		dmaio =3D ints[1];
+	if (get_option(&str, &io))
+		dmaio =3D io;
 	return 1;
 }
=20
 __setup("sonicvibes=3D", sonicvibes_setup);
 __setup("sonicvibesdmaio=3D", sonicvibesdmaio_setup);
-__initcall(init_module);
=20
 #endif /* MODULE */
--- drivers/sound/esssolo1.c	1999/08/10 11:14:43	0.5
+++ drivers/sound/esssolo1.c	1999/08/12 17:57:24
@@ -39,7 +39,21 @@
  *    15.06.99   0.4   Fix bad allocation bug.
  *                     Thanks to Deti Fliegl <fliegl@in.tum.de>
  *    28.06.99   0.5   Add pci_set_master
- *
+ *    12.08.99   0.6   Fix MIDI UART crashing the driver
+ *                     Changed mixer semantics from OSS documented
+ *                     behaviour to OSS "code behaviour".
+ *                     Recording might actually work now.
+ *                     The real DDMA controller address register is at PCI=
 config
+ *                     0x60, while the register at 0x18 is used as a place=
holder
+ *                     register for BIOS address allocation. This register
+ *                     is supposed to be copied into 0x60, according
+ *                     to the Solo1 datasheet. When I do that, I can access
+ *                     the DDMA registers except the mask bit, which
+ *                     is stuck at 1. When I copy the contents of 0x18 +0x=
10
+ *                     to the DDMA base register, everything seems to work.
+ *                     The fun part is that the Windows Solo1 driver doesn=
't
+ *                     seem to do these tricks.
+ *                     Bugs remaining: plops and clicks when starting/stop=
ping playback
  *
  */
=20
@@ -69,6 +83,10 @@
=20
 /* --------------------------------------------------------------------- */
=20
+#undef OSS_DOCUMENTED_MIXER_SEMANTICS
+
+/* --------------------------------------------------------------------- */
+
 #ifndef PCI_VENDOR_ID_ESS
 #define PCI_VENDOR_ID_ESS         0x125d
 #endif
@@ -78,9 +96,12 @@
=20
 #define SOLO1_MAGIC  ((PCI_VENDOR_ID_ESS<<16)|PCI_DEVICE_ID_ESS_SOLO1)
=20
+#define DDMABASE_OFFSET           0x10    /* chip bug workaround kludge */
+#define DDMABASE_EXTENT           16
+
 #define IOBASE_EXTENT             16
 #define SBBASE_EXTENT             16
-#define VCBASE_EXTENT             16
+#define VCBASE_EXTENT             (DDMABASE_EXTENT+DDMABASE_OFFSET)
 #define MPUBASE_EXTENT            4
 #define GPBASE_EXTENT             4
=20
@@ -98,16 +119,15 @@
=20
 /* --------------------------------------------------------------------- */
=20
-#define DEBUGREC
-
-/* --------------------------------------------------------------------- */
-
 struct solo1_state {
 	/* magic */
 	unsigned int magic;
=20
-	/* we keep sb cards in a linked list */
+	/* we keep the cards in a linked list */
 	struct solo1_state *next;
+=09
+	/* pcidev is needed to turn off the DDMA controller at driver shutdown */
+	struct pci_dev *pcidev;
=20
 	/* soundcore stuff */
 	int dev_audio;
@@ -116,10 +136,10 @@
 	int dev_dmfm;
=20
 	/* hardware resources */
-	unsigned long iobase, sbbase, vcbase, mpubase, gpbase; /* long for SPARC =
*/
+	unsigned long iobase, sbbase, vcbase, ddmabase, mpubase, gpbase; /* long =
for SPARC */
 	unsigned int irq;
=20
-	/* mixer registers; there is no HW readback */
+	/* mixer registers */
 	struct {
 		unsigned short vol[10];
 		unsigned int recsrc;
@@ -302,6 +322,8 @@
 	spin_lock_irqsave(&s->lock, flags);
 	if (!(s->ena & FMODE_WRITE) && (s->dma_dac.mapped || s->dma_dac.count > 0=
) && s->dma_dac.ready) {
 		s->ena |=3D FMODE_WRITE;
+		write_mixer(s, 0x78, 0x12);
+		udelay(10);
 		write_mixer(s, 0x78, 0x13);
 	}
 	spin_unlock_irqrestore(&s->lock, flags);
@@ -326,47 +348,24 @@
 	    && s->dma_adc.ready) {
 		s->ena |=3D FMODE_READ;
 		write_ctrl(s, 0xb8, 0xf);
-#ifdef DEBUGREC
+#if 0
 		printk(KERN_DEBUG "solo1: DMAbuffer: 0x%08lx\n", (long)s->dma_adc.rawbuf=
);
 		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-                outb(0, s->vcbase+0xd); /* master reset */
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x (a. clr)\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outb(1, s->vcbase+0xf);  /* mask */
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x (a. mask)\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outb(0x54/*0x14*/, s->vcbase+0xb);  /* DMA_MODE_READ | DMA_MODE_AUTOINIT=
 */
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x (a. wrmode)\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outl(virt_to_bus(s->dma_adc.rawbuf), s->vcbase);
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x (a. wrbase)\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outw(s->dma_adc.dmasize-1, s->vcbase+4);
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x (a. wrcnt)\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outb(0, s->vcbase+0xf);
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x (a. clrmask)\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
+		       inb(s->ddmabase+0xf), inw(s->ddmabase+4), inl(s->ddmabase), inb(s=
->ddmabase+8));
 #endif
+                outb(0, s->ddmabase+0xd); /* master reset */
+		outb(1, s->ddmabase+0xf);  /* mask */
+		outb(0x54/*0x14*/, s->ddmabase+0xb);  /* DMA_MODE_READ | DMA_MODE_AUTOIN=
IT */
+		outl(virt_to_bus(s->dma_adc.rawbuf), s->ddmabase);
+		outw(s->dma_adc.dmasize-1, s->ddmabase+4);
+		outb(0, s->ddmabase+0xf);
 	}
 	spin_unlock_irqrestore(&s->lock, flags);
-#ifdef DEBUGREC
-	printk(KERN_DEBUG "solo1: start DMA: reg B8: 0x%02x  DMAstat: 0x%02x  DMA=
cnt: 0x%04x  DMAmask: 0x%02x  SBstat: 0x%02x\n",=20
-	       read_ctrl(s, 0xb8), inb(s->vcbase+8), inw(s->vcbase+4), inb(s->vcb=
ase+0xf), inb(s->sbbase+0xc));
-
+#if 0
+	printk(KERN_DEBUG "solo1: start DMA: reg B8: 0x%02x  SBstat: 0x%02x\n"
+	       KERN_DEBUG "solo1: DMA: stat: 0x%02x  cnt: 0x%04x  mask: 0x%02x\n"=
,=20
+	       read_ctrl(s, 0xb8), inb(s->sbbase+0xc),=20
+	       inb(s->ddmabase+8), inw(s->ddmabase+4), inb(s->ddmabase+0xf));
 	printk(KERN_DEBUG "solo1: A1: 0x%02x  A2: 0x%02x  A4: 0x%02x  A5: 0x%02x =
 A8: 0x%02x\n" =20
 	       KERN_DEBUG "solo1: B1: 0x%02x  B2: 0x%02x  B4: 0x%02x  B7: 0x%02x =
 B8: 0x%02x  B9: 0x%02x\n",
 	       read_ctrl(s, 0xa1), read_ctrl(s, 0xa2), read_ctrl(s, 0xa4), read_c=
trl(s, 0xa5), read_ctrl(s, 0xa8),=20
@@ -456,16 +455,16 @@
 	va =3D virt_to_bus(s->dma_adc.rawbuf);
 	if ((va & ~((1<<24)-1)))
 		panic("solo1: buffer above 16M boundary");
-	outb(0, s->vcbase+0xd);  /* clear */
-	outb(1, s->vcbase+0xf); /* mask */
-	//outb(0, s->vcbase+8);  /* enable (enable is active low!) */
-	outb(0x54, s->vcbase+0xb);  /* DMA_MODE_READ | DMA_MODE_AUTOINIT */
-	outl(va, s->vcbase);
-	outw(s->dma_adc.dmasize-1, s->vcbase+4);
+	outb(0, s->ddmabase+0xd);  /* clear */
+	outb(1, s->ddmabase+0xf); /* mask */
+	/*outb(0, s->ddmabase+8);*/  /* enable (enable is active low!) */
+	outb(0x54, s->ddmabase+0xb);  /* DMA_MODE_READ | DMA_MODE_AUTOINIT */
+	outl(va, s->ddmabase);
+	outw(s->dma_adc.dmasize-1, s->ddmabase+4);
 	c =3D - s->dma_adc.fragsamples;
 	write_ctrl(s, 0xa4, c);
 	write_ctrl(s, 0xa5, c >> 8);
-	outb(0, s->vcbase+0xf);
+	outb(0, s->ddmabase+0xf);
 	s->dma_adc.ready =3D 1;
 	return 0;
 }
@@ -513,12 +512,12 @@
=20
 	/* update ADC pointer */
 	if (s->ena & FMODE_READ) {
-		hwptr =3D (s->dma_adc.dmasize - 1 - inw(s->vcbase+4)) % s->dma_adc.dmasi=
ze;
+		hwptr =3D (s->dma_adc.dmasize - 1 - inw(s->ddmabase+4)) % s->dma_adc.dma=
size;
                 diff =3D (s->dma_adc.dmasize + hwptr - s->dma_adc.hwptr) %=
 s->dma_adc.dmasize;
                 s->dma_adc.hwptr =3D hwptr;
 		s->dma_adc.total_bytes +=3D diff;
 		s->dma_adc.count +=3D diff;
-#ifdef DEBUGREC
+#if 0
 		printk(KERN_DEBUG "solo1: rd: hwptr %u swptr %u dmasize %u count %u\n",
 		       s->dma_adc.hwptr, s->dma_adc.swptr, s->dma_adc.dmasize, s->dma_ad=
c.count);
 #endif
@@ -633,16 +632,28 @@
 		SOUND_MASK_MIC, SOUND_MASK_MIC, SOUND_MASK_CD, SOUND_MASK_VOLUME,
 		SOUND_MASK_MIC, 0, SOUND_MASK_LINE, 0
 	};
-	static const unsigned char mixtable[SOUND_MIXER_NRDEVICES] =3D {
-		[SOUND_MIXER_PCM]    =3D 0x7c,   /* voice */
-		[SOUND_MIXER_SYNTH]  =3D 0x36,   /* FM */
-		[SOUND_MIXER_CD]     =3D 0x38,   /* CD */
-		[SOUND_MIXER_LINE]   =3D 0x3e,   /* Line */
-		[SOUND_MIXER_LINE1]  =3D 0x3a,   /* AUX */
-		[SOUND_MIXER_MIC]    =3D 0x1a,   /* Mic */
-		[SOUND_MIXER_LINE2]  =3D 0x6d    /* Mono in */
+	static const unsigned char mixtable1[SOUND_MIXER_NRDEVICES] =3D {
+		[SOUND_MIXER_PCM]     =3D 1,   /* voice */
+		[SOUND_MIXER_SYNTH]   =3D 2,   /* FM */
+		[SOUND_MIXER_CD]      =3D 3,   /* CD */
+		[SOUND_MIXER_LINE]    =3D 4,   /* Line */
+		[SOUND_MIXER_LINE1]   =3D 5,   /* AUX */
+		[SOUND_MIXER_MIC]     =3D 6,   /* Mic */
+		[SOUND_MIXER_LINE2]   =3D 7,   /* Mono in */
+		[SOUND_MIXER_SPEAKER] =3D 8,   /* Speaker */
+		[SOUND_MIXER_RECLEV]  =3D 9,   /* Recording level */
+		[SOUND_MIXER_VOLUME]  =3D 10   /* Master Volume */
 	};
-	unsigned char l, r, rl, rr;
+	static const unsigned char mixreg[] =3D {
+		0x7c,   /* voice */
+		0x36,   /* FM */
+		0x38,   /* CD */
+		0x3e,   /* Line */
+		0x3a,   /* AUX */
+		0x1a,   /* Mic */
+		0x6d    /* Mono in */
+	};
+	unsigned char l, r, rl, rr, vidx;
 	int i, val;
=20
 	VALIDATE_STATE(s);
@@ -657,16 +668,6 @@
 		val =3D (read_mixer(s, 0x7d) & 0x08) ? 1 : 0;
 		return put_user(val, (int *)arg);
 	}
-	if (cmd =3D SOUND_MIXER_PRIVATE1) {
-		/* enable/disable/query mixer preamp */
-		get_user_ret(val, (int *)arg, -EFAULT);
-		if (val !=3D -1) {
-			val =3D val ? 0xff : 0xf7;
-			write_mixer(s, 0x7d, (read_mixer(s, 0x7d) | 0x08) & val);
-		}
-		val =3D (read_mixer(s, 0x7d) & 0x08) ? 1 : 0;
-		return put_user(val, (int *)arg);
-	}
 	if (cmd =3D SOUND_MIXER_PRIVATE2) {
 		/* enable/disable/query spatializer */
 		get_user_ret(val, (int *)arg, -EFAULT);
@@ -720,36 +721,11 @@
                 case SOUND_MIXER_CAPS:
 			return put_user(SOUND_CAP_EXCL_INPUT, (int *)arg);
=20
-		case SOUND_MIXER_VOLUME:
-			rl =3D read_mixer(s, 0x60);
-			rr =3D read_mixer(s, 0x62);
-			l =3D (rl * 3 + 11) / 2;
-			if (rl & 0x40)
-				l =3D 0;
-			r =3D (rr * 3 + 11) / 2;
-			if (rr & 0x40)
-				r =3D 0;
-			return put_user((((unsigned int)r) << 8) | l, (int *)arg);
-
-		case SOUND_MIXER_SPEAKER:
-			rl =3D read_mixer(s, 0x3c);
-			l =3D (rl & 7) * 14 + 2;
-			return put_user(l * 0x101, (int *)arg);
-
-		case SOUND_MIXER_RECLEV:
-			rl =3D read_ctrl(s, 0xb4);
-			r =3D ((rl & 0xf) * 13 + 5) / 2;
-			l =3D (((rl >> 4) & 0xf) * 13 + 5) / 2;
-			return put_user((((unsigned int)r) << 8) | l, (int *)arg);
-
 		default:
 			i =3D _IOC_NR(cmd);
-                        if (i >=3D SOUND_MIXER_NRDEVICES || !mixtable[i])
+                        if (i >=3D SOUND_MIXER_NRDEVICES || !(vidx =3D mix=
table1[i]))
                                 return -EINVAL;
-			rl =3D read_mixer(s, mixtable[i]);
-			r =3D ((rl & 0xf) * 13 + 5) / 2;
-			l =3D (((rl >> 4) & 0xf) * 13 + 5) / 2;
-			return put_user((((unsigned int)r) << 8) | l, (int *)arg);
+			return put_user(s->mix.vol[vidx-1], (int *)arg);
 		}
 	}
         if (_IOC_DIR(cmd) !=3D (_IOC_READ|_IOC_WRITE))=20
@@ -757,21 +733,21 @@
 	s->mix.modcnt++;
 	switch (_IOC_NR(cmd)) {
 	case SOUND_MIXER_RECSRC: /* Arg contains a bit for each recording source =
*/
-
-	{
-		static const unsigned char regs[] =3D {
-			0x1c, 0x1a, 0x36, 0x38, 0x3a, 0x3c, 0x3e, 0x60, 0x62, 0x6d, 0x7c
-		};
-		int i;
-
-		for (i =3D 0; i < sizeof(regs); i++)
-			printk(KERN_DEBUG "solo1: mixer reg 0x%02x: 0x%02x\n",
-			       regs[i], read_mixer(s, regs[i]));
-		printk(KERN_DEBUG "solo1: ctrl reg 0x%02x: 0x%02x\n",
-		       0xb4, read_ctrl(s, 0xb4));
-	}=20
-
-		get_user_ret(val, (int *)arg, -EFAULT);
+#if 0
+	        {
+			static const unsigned char regs[] =3D {
+				0x1c, 0x1a, 0x36, 0x38, 0x3a, 0x3c, 0x3e, 0x60, 0x62, 0x6d, 0x7c
+			};
+			int i;
+		=09
+			for (i =3D 0; i < sizeof(regs); i++)
+				printk(KERN_DEBUG "solo1: mixer reg 0x%02x: 0x%02x\n",
+				       regs[i], read_mixer(s, regs[i]));
+			printk(KERN_DEBUG "solo1: ctrl reg 0x%02x: 0x%02x\n",
+			       0xb4, read_ctrl(s, 0xb4));
+		}
+#endif
+	        get_user_ret(val, (int *)arg, -EFAULT);
                 i =3D hweight32(val);
                 if (i =3D 0)
                         return 0;
@@ -810,7 +786,12 @@
 		}
 		write_mixer(s, 0x60, rl);
 		write_mixer(s, 0x62, rr);
-		return put_user((((unsigned int)r) << 8) | l, (int *)arg);
+#ifdef OSS_DOCUMENTED_MIXER_SEMANTICS
+                s->mix.vol[9] =3D ((unsigned int)r << 8) | l;
+#else
+                s->mix.vol[9] =3D val;
+#endif
+		return put_user(s->mix.vol[9], (int *)arg);
=20
 	case SOUND_MIXER_SPEAKER:
 		get_user_ret(val, (int *)arg, -EFAULT);
@@ -822,7 +803,12 @@
 		rl =3D (l - 2) / 14;
 		l =3D rl * 14 + 2;
 		write_mixer(s, 0x3c, rl);
-		return put_user(l * 0x101, (int *)arg);
+#ifdef OSS_DOCUMENTED_MIXER_SEMANTICS
+                s->mix.vol[7] =3D l * 0x101;
+#else
+                s->mix.vol[7] =3D val;
+#endif
+		return put_user(s->mix.vol[7], (int *)arg);
=20
 	case SOUND_MIXER_RECLEV:
 		get_user_ret(val, (int *)arg, -EFAULT);
@@ -841,11 +827,16 @@
 		r =3D (rl * 13 + 5) / 2;
 		l =3D (rr * 13 + 5) / 2;
 		write_ctrl(s, 0xb4, (rl << 4) | rr);
-		return put_user((((unsigned int)r) << 8) | l, (int *)arg);
+#ifdef OSS_DOCUMENTED_MIXER_SEMANTICS
+                s->mix.vol[8] =3D ((unsigned int)r << 8) | l;
+#else
+                s->mix.vol[8] =3D val;
+#endif
+		return put_user(s->mix.vol[8], (int *)arg);
=20
 	default:
 		i =3D _IOC_NR(cmd);
-		if (i >=3D SOUND_MIXER_NRDEVICES || !mixtable[i])
+		if (i >=3D SOUND_MIXER_NRDEVICES || !(vidx =3D mixtable1[i]))
 			return -EINVAL;
 		get_user_ret(val, (int *)arg, -EFAULT);
 		l =3D (val << 1) & 0x1fe;
@@ -862,8 +853,13 @@
 		rr =3D (r - 5) / 13;
 		r =3D (rl * 13 + 5) / 2;
 		l =3D (rr * 13 + 5) / 2;
-		write_mixer(s, mixtable[i], (rl << 4) | rr);
-		return put_user((((unsigned int)r) << 8) | l, (int *)arg);
+		write_mixer(s, mixreg[vidx-1], (rl << 4) | rr);
+#ifdef OSS_DOCUMENTED_MIXER_SEMANTICS
+                s->mix.vol[vidx-1] =3D ((unsigned int)r << 8) | l;
+#else
+                s->mix.vol[vidx-1] =3D val;
+#endif
+		return put_user(s->mix.vol[vidx-1], (int *)arg);
 	}
 }
=20
@@ -919,10 +915,8 @@
 	NULL,  /* fsync */
 	NULL,  /* fasync */
 	NULL,  /* check_media_change */
-#if 0
 	NULL,  /* revalidate */
 	NULL,  /* lock */
-#endif
 };
=20
 /* --------------------------------------------------------------------- */
@@ -931,7 +925,8 @@
 {
 	DECLARE_WAITQUEUE(wait, current);
 	unsigned long flags;
-	int count, tmo;
+	int count;
+	unsigned tmo;
 =09
 	if (s->dma_dac.mapped)
 		return 0;
@@ -950,12 +945,12 @@
                         current->state =3D TASK_RUNNING;
                         return -EBUSY;
                 }
-		tmo =3D (count * HZ) / s->rate;
+		tmo =3D 3 * HZ * (count + s->dma_dac.fragsize) / 2 / s->rate;
 		if (s->fmt & (AFMT_S16_LE | AFMT_U16_LE))
 			tmo >>=3D 1;
 		if (s->channels > 1)
 			tmo >>=3D 1;
-                if (!schedule_timeout(tmo ? : 1) && tmo)
+                if (!schedule_timeout(tmo + 1))
                         printk(KERN_DEBUG "solo1: dma timed out??\n");
         }
         remove_wait_queue(&s->dma_dac.wait, &wait);
@@ -996,7 +991,7 @@
 			cnt =3D count;
 #ifdef DEBUGREC
 		printk(KERN_DEBUG "solo1_read: reg B8: 0x%02x  DMAstat: 0x%02x  DMAcnt: =
0x%04x  SBstat: 0x%02x  cnt: %u\n",=20
-		       read_ctrl(s, 0xb8), inb(s->vcbase+8), inw(s->vcbase+4), inb(s->sb=
base+0xc), cnt);
+		       read_ctrl(s, 0xb8), inb(s->ddmabase+8), inw(s->ddmabase+4), inb(s=
->sbbase+0xc), cnt);
 #endif
 		if (cnt <=3D 0) {
 			start_adc(s);
@@ -1007,12 +1002,10 @@
 			       KERN_DEBUG "solo1_read: SBstat: 0x%02x  cnt: %u\n",
 			       read_ctrl(s, 0xa1), read_ctrl(s, 0xa2), read_ctrl(s, 0xa4), read=
_ctrl(s, 0xa5), read_ctrl(s, 0xa8),=20
 			       read_ctrl(s, 0xb1), read_ctrl(s, 0xb2), read_ctrl(s, 0xb7), read=
_ctrl(s, 0xb8), read_ctrl(s, 0xb9),=20
-			       inl(s->vcbase), inw(s->vcbase+4), inb(s->vcbase+8), inb(s->vcbas=
e+15), inb(s->sbbase+0xc), cnt);
+			       inl(s->ddmabase), inw(s->ddmabase+4), inb(s->ddmabase+8), inb(s-=
>ddmabase+15), inb(s->sbbase+0xc), cnt);
 #endif
-			if (inb(s->vcbase+15) & 1) {
+			if (inb(s->ddmabase+15) & 1)
 				printk(KERN_ERR "solo1: cannot start recording, DDMA mask bit stuck at=
 1\n");
-				return -EIO;
-			}
 			if (file->f_flags & O_NONBLOCK)
 				return ret ? ret : -EAGAIN;
 			interruptible_sleep_on(&s->dma_adc.wait);
@@ -1023,7 +1016,7 @@
 			       KERN_DEBUG "solo1_read: SBstat: 0x%02x  cnt: %u\n",
 			       read_ctrl(s, 0xa1), read_ctrl(s, 0xa2), read_ctrl(s, 0xa4), read=
_ctrl(s, 0xa5), read_ctrl(s, 0xa8),=20
 			       read_ctrl(s, 0xb1), read_ctrl(s, 0xb2), read_ctrl(s, 0xb7), read=
_ctrl(s, 0xb8), read_ctrl(s, 0xb9),=20
-			       inl(s->vcbase), inw(s->vcbase+4), inb(s->vcbase+8), inb(s->vcbas=
e+15), inb(s->sbbase+0xc), cnt);
+			       inl(s->ddmabase), inw(s->ddmabase+4), inb(s->ddmabase+8), inb(s-=
>ddmabase+15), inb(s->sbbase+0xc), cnt);
 #endif
 			if (signal_pending(current))
 				return ret ? ret : -ERESTARTSYS;
@@ -1042,7 +1035,7 @@
 		start_adc(s);
 #ifdef DEBUGREC
 		printk(KERN_DEBUG "solo1_read: reg B8: 0x%02x  DMAstat: 0x%02x  DMAcnt: =
0x%04x  SBstat: 0x%02x\n",=20
-		       read_ctrl(s, 0xb8), inb(s->vcbase+8), inw(s->vcbase+4), inb(s->sb=
base+0xc));
+		       read_ctrl(s, 0xb8), inb(s->ddmabase+8), inw(s->ddmabase+4), inb(s=
->sbbase+0xc));
 #endif
 	}
 	return ret;
@@ -1304,7 +1297,7 @@
 				if (!s->dma_adc.ready && (ret =3D prog_dmabuf_adc(s)))
 					return ret;
 				start_adc(s);
-				if (inb(s->vcbase+15) & 1)
+				if (inb(s->ddmabase+15) & 1)
 					printk(KERN_ERR "solo1: cannot start recording, DDMA mask bit stuck a=
t 1\n");
 			} else
 				stop_adc(s);
@@ -1466,8 +1459,8 @@
 	}
 	if (file->f_mode & FMODE_READ) {
 		stop_adc(s);
-		outb(1, s->vcbase+0xf); /* mask DMA channel */
-		//outb(0, s->vcbase+0xd); /* DMA master clear */
+		outb(1, s->ddmabase+0xf); /* mask DMA channel */
+		outb(0, s->ddmabase+0xd); /* DMA master clear */
 		dealloc_dmabuf(&s->dma_adc);
 	}
 	s->open_mode &=3D ~(FMODE_READ | FMODE_WRITE);
@@ -1533,10 +1526,8 @@
 	NULL,  /* fsync */
 	NULL,  /* fasync */
 	NULL,  /* check_media_change */
-#if 0
 	NULL,  /* revalidate */
 	NULL,  /* lock */
-#endif
 };
=20
 /* --------------------------------------------------------------------- */
@@ -1550,7 +1541,7 @@
 	if (!(s->mpubase))
 		return;
 	wake =3D 0;
-	while (inb(s->mpubase+1) & 0x80) {
+	while (!(inb(s->mpubase+1) & 0x80)) {
 		ch =3D inb(s->mpubase);
 		if (s->midi.icnt < MIDIINBUF) {
 			s->midi.ibuf[s->midi.iwr] =3D ch;
@@ -1562,7 +1553,7 @@
 	if (wake)
 		wake_up(&s->midi.iwait);
 	wake =3D 0;
-	while ((inb(s->mpubase+1) & 0x40) && s->midi.ocnt > 0) {
+	while (!(inb(s->mpubase+1) & 0x40) && s->midi.ocnt > 0) {
 		outb(s->midi.obuf[s->midi.ord], s->mpubase);
 		s->midi.ord =3D (s->midi.ord + 1) % MIDIOUTBUF;
 		s->midi.ocnt--;
@@ -1577,22 +1568,12 @@
 {
         struct solo1_state *s =3D (struct solo1_state *)dev_id;
 	unsigned int intsrc;
-
-	static unsigned lim =3D 0;
 =09
 	/* fastpath out, to ease interrupt sharing */
 	intsrc =3D inb(s->iobase+7); /* get interrupt source(s) */
 	if (!intsrc)
 		return;
 	(void)inb(s->sbbase+0xe);  /* clear interrupt */
-#ifdef DEBUGREC
-	if (intsrc & 0x10 && lim < 20) {
-		lim++;
-		printk(KERN_DEBUG "solo1: audio1int reg B8: 0x%02x  DMAstat: 0x%02x  DMA=
cnt: 0x%04x  SBstat: 0x%02x\n",=20
-		       read_ctrl(s, 0xb8), inb(s->vcbase+8), inw(s->vcbase+4), inb(s->sb=
base+0xc));
-	}
-	//printk(KERN_DEBUG "solo1: interrupt 0x%02x\n", intsrc);
-#endif
 	spin_lock(&s->lock);
 	/* clear audio interrupts first */
 	if (intsrc & 0x20)
@@ -1849,10 +1830,8 @@
 	NULL,  /* fsync */
 	NULL,  /* fasync */
 	NULL,  /* check_media_change */
-#if 0
 	NULL,  /* revalidate */
 	NULL,  /* lock */
-#endif
 };
=20
 /* --------------------------------------------------------------------- */
@@ -2025,10 +2004,8 @@
 	NULL,  /* fsync */
 	NULL,  /* fasync */
 	NULL,  /* check_media_change */
-#if 0
 	NULL,  /* revalidate */
 	NULL,  /* lock */
-#endif
 };
=20
 /* --------------------------------------------------------------------- */
@@ -2060,11 +2037,10 @@
 	struct pci_dev *pcidev =3D NULL;
 	mm_segment_t fs;
 	int i, val, index =3D 0;
-	u16 ddmabase;
=20
 	if (!pci_present())   /* No PCI bus in this machine! */
 		return -ENODEV;
-	printk(KERN_INFO "solo1: version v0.5 time " __TIME__ " " __DATE__ "\n");
+	printk(KERN_INFO "solo1: version v0.6 time " __TIME__ " " __DATE__ "\n");
 	while (index < NR_DEVICE &&=20
 	       (pcidev =3D pci_find_device(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_S=
OLO1, pcidev))) {
 		if (pcidev->resource[0].start =3D 0 ||
@@ -2090,35 +2066,32 @@
 		init_waitqueue_head(&s->midi.owait);
 		init_MUTEX(&s->open_sem);
 		s->magic =3D SOLO1_MAGIC;
+		s->pcidev =3D pcidev;
 		s->iobase =3D pcidev->resource[0].start;
 		s->sbbase =3D pcidev->resource[1].start;
 		s->vcbase =3D pcidev->resource[2].start;
+		s->ddmabase =3D s->vcbase + DDMABASE_OFFSET;
 		s->mpubase =3D pcidev->resource[3].start;
 		s->gpbase =3D pcidev->resource[4].start;
 		s->irq =3D pcidev->irq;
 		if (check_region(s->iobase, IOBASE_EXTENT) ||
 		    check_region(s->sbbase, SBBASE_EXTENT) ||
-		    check_region(s->vcbase, VCBASE_EXTENT) ||
+		    check_region(s->ddmabase, DDMABASE_EXTENT) ||
 		    check_region(s->mpubase, MPUBASE_EXTENT)) {
 			printk(KERN_ERR "solo1: io ports in use\n");
 			goto err_region;
 		}
 		request_region(s->iobase, IOBASE_EXTENT, "ESS Solo1");
 		request_region(s->sbbase, SBBASE_EXTENT, "ESS Solo1");
-		request_region(s->vcbase, VCBASE_EXTENT, "ESS Solo1");
+		request_region(s->ddmabase, DDMABASE_EXTENT, "ESS Solo1");
 		request_region(s->mpubase, MPUBASE_EXTENT, "ESS Solo1");
 		if (request_irq(s->irq, solo1_interrupt, SA_SHIRQ, "ESS Solo1", s)) {
 			printk(KERN_ERR "solo1: irq %u in use\n", s->irq);
 			goto err_irq;
 		}
 		/* initialize DDMA base address */
-		/* use PCI config reg, and not vcbase, we need the bus view */
-		pci_read_config_word(pcidev, 0x18, &ddmabase);
-		pci_write_config_word(pcidev, 0x60, (ddmabase & (~0xf)) | 1);
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
+		printk(KERN_DEBUG "solo1: ddma base address: 0x%lx\n", s->ddmabase);
+		pci_write_config_word(pcidev, 0x60, (s->ddmabase & (~0xf)) | 1);
 		/* set DMA policy to DDMA, IRQ emulation off (CLKRUN disabled for now) */
 		pci_write_config_dword(pcidev, 0x50, 0);
 		/* disable legacy audio address decode */
@@ -2147,21 +2120,9 @@
 		write_mixer(s, 0x52, 0);
 		write_mixer(s, 0x14, 0);  /* DAC1 minimum volume */
 		write_mixer(s, 0x71, 0x20); /* enable new 0xA1 reg format */
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outb(0, s->vcbase+0xd); /* DMA master clear */
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		outb(1, s->vcbase+0xf); /* mask channel */
-#ifdef DEBUGREC
-		printk(KERN_DEBUG "solo1: DMA: mask: 0x%02x cnt: 0x%04x addr: 0x%08x  st=
at: 0x%02x\n",=20
-		       inb(s->vcbase+0xf), inw(s->vcbase+4), inl(s->vcbase), inb(s->vcba=
se+8));
-#endif
-		//outb(0, s->vcbase+0x8); /* enable controller (enable is low active!!) =
*/
+		outb(0, s->ddmabase+0xd); /* DMA master clear */
+		outb(1, s->ddmabase+0xf); /* mask channel */
+		/*outb(0, s->ddmabase+0x8);*/ /* enable controller (enable is low active=
!!) */
=20
 		pci_set_master(pcidev);  /* enable bus mastering */
 	=09
@@ -2173,6 +2134,8 @@
 			val =3D initvol[i].vol;
 			mixer_ioctl(s, initvol[i].mixch, (unsigned long)&val);
 		}
+		val =3D 1; /* enable mic preamp */
+		mixer_ioctl(s, SOUND_MIXER_PRIVATE1, (unsigned long)&val);
 		set_fs(fs);
 		/* queue it for later freeing */
 		s->next =3D devs;
@@ -2192,7 +2155,7 @@
 	err_irq:
 		release_region(s->iobase, IOBASE_EXTENT);
 		release_region(s->sbbase, SBBASE_EXTENT);
-		release_region(s->vcbase, VCBASE_EXTENT);
+		release_region(s->ddmabase, DDMABASE_EXTENT);
 		release_region(s->mpubase, MPUBASE_EXTENT);
 	err_region:
 		kfree_s(s, sizeof(struct solo1_state));
@@ -2215,13 +2178,14 @@
 		devs =3D devs->next;
 		/* stop DMA controller */
 		outb(0, s->iobase+6);
-		outb(0, s->vcbase+0xd); /* DMA master clear */
+		outb(0, s->ddmabase+0xd); /* DMA master clear */
 		outb(3, s->sbbase+6); /* reset sequencer and FIFO */
 		synchronize_irq();
+		pci_write_config_word(s->pcidev, 0x60, 0); /* turn off DDMA controller a=
ddress space */
 		free_irq(s->irq, s);
 		release_region(s->iobase, IOBASE_EXTENT);
 		release_region(s->sbbase, SBBASE_EXTENT);
-		release_region(s->vcbase, VCBASE_EXTENT);
+		release_region(s->ddmabase, DDMABASE_EXTENT);
 		release_region(s->mpubase, MPUBASE_EXTENT);
 		unregister_sound_dsp(s->dev_audio);
 		unregister_sound_mixer(s->dev_mixer);
