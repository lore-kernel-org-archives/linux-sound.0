From: "Aki M Laukkanen" <amlaukka@cc.helsinki.fi>
Date: Wed, 21 Jun 2000 17:59:25 +0000
Subject: [RFT] PM patch to sb driver
Message-Id: <marc-linux-sound-96200429928840@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org


Hello, this is an experimental patch to add pm support to the soundblaster
driver. Contrary to what I earlier said I couldn't test it myself because
sound worked with the sb driver just fine after suspend (On a Toshiba 220CS=
).=20
I happened to test it only after making this patch so now I need testers wh=
o=20
have troubles with suspend and the sb driver.


diff -urN --exclude=3D*.flc linux-2.4.0-test1-ac22/drivers/sound/sb.h linux=
-2.4.0-test1-ac22.sb/drivers/sound/sb.h
--- linux-2.4.0-test1-ac22/drivers/sound/sb.h	Sun Apr 16 19:33:22 2000
+++ linux-2.4.0-test1-ac22.sb/drivers/sound/sb.h	Wed Jun 21 01:57:06 2000
@@ -1,3 +1,5 @@
+#include <linux/pm.h>
+
 #define DSP_RESET	(devc->base + 0x6)
 #define DSP_READ	(devc->base + 0xA)
 #define DSP_WRITE	(devc->base + 0xC)
@@ -138,7 +140,9 @@
            void *midi_irq_cookie;		/* IRQ cookie for the midi */
=20
            struct sb_module_options sbmo;	/* Module options */
-
+      =20
+	/* Power management */
+	   struct pm_dev *pmdev;
         } sb_devc;
        =20
 /*
@@ -160,18 +164,16 @@
 int sb_dsp_detect (struct address_info *hw_config, int pci, int pciio, str=
uct sb_module_options *sbmo);
 int sb_dsp_init (struct address_info *hw_config);
 void sb_dsp_unload(struct address_info *hw_config, int sbmpu);
-int sb_mixer_init(sb_devc *devc);
-void sb_mixer_unload(sb_devc *devc);
-void sb_mixer_set_stereo (sb_devc *devc, int mode);
-void smw_mixer_init(sb_devc *devc);
 void sb_dsp_midi_init (sb_devc *devc);
 void sb_audio_init (sb_devc *devc, char *name);
 void sb_midi_interrupt (sb_devc *devc);
 void sb_chgmixer (sb_devc * devc, unsigned int reg, unsigned int mask, uns=
igned int val);
 int sb_common_mixer_set(sb_devc * devc, int dev, int left, int right);
=20
+
 int sb_audio_open(int dev, int mode);
 void sb_audio_close(int dev);
+int sb_pm_callback(struct pm_dev *dev, pm_request_t rqst, void *data);
=20
 extern sb_devc *last_sb;
=20
@@ -184,3 +186,11 @@
=20
 void unload_sb16(struct address_info *hw_info);
 void unload_sb16midi(struct address_info *hw_info);
+
+/*	From sb_mixer.c */
+int sb_mixer_set(sb_devc *devc, int dev, int value);
+int sb_set_recmask(sb_devc *devc, int mask);
+int sb_mixer_init(sb_devc *devc);
+void sb_mixer_unload(sb_devc *devc);
+void sb_mixer_set_stereo (sb_devc *devc, int mode);
+void smw_mixer_init(sb_devc *devc);
diff -urN --exclude=3D*.flc linux-2.4.0-test1-ac22/drivers/sound/sb_audio.c=
 linux-2.4.0-test1-ac22.sb/drivers/sound/sb_audio.c
--- linux-2.4.0-test1-ac22/drivers/sound/sb_audio.c	Mon Feb 28 17:18:20 2000
+++ linux-2.4.0-test1-ac22.sb/drivers/sound/sb_audio.c	Wed Jun 21 01:57:38 =
2000
@@ -1122,4 +1122,10 @@
         }
         audio_devs[devc->dev]->mixer_dev =3D devc->my_mixerdev;
         audio_devs[devc->dev]->min_fragment =3D 5;
+
+	/* FIXME: PM_PCI_ID() needed but no access to pcidev */
+	devc->pmdev =3D pm_register(devc->caps&SB_PCI_IRQ?PM_PCI_DEV:PM_ISA_DEV, =

+				  devc->dev, sb_pm_callback);
+	if (devc->pmdev)
+		devc->pmdev->data =3D devc;
 }
diff -urN --exclude=3D*.flc linux-2.4.0-test1-ac22/drivers/sound/sb_card.c =
linux-2.4.0-test1-ac22.sb/drivers/sound/sb_card.c
--- linux-2.4.0-test1-ac22/drivers/sound/sb_card.c	Wed Jun 21 00:03:52 2000
+++ linux-2.4.0-test1-ac22.sb/drivers/sound/sb_card.c	Wed Jun 21 20:11:48 2=
000
@@ -45,6 +45,8 @@
  * 25-05-2000 Added Creative SB AWE64 Gold (CTL00B2).=20
  * 	P=E5l-Kristian Engstad <engstad@att.net>
  *=20
+ * 21-06-2000 Power Management support.=20
+ *	Aki Laukkanen <amlaukka@cs.helsinki.fi>
  */
=20
 #include <linux/config.h>
@@ -489,6 +491,7 @@
         }
         return(dev);
 }
+
=20
 static struct pci_dev *sb_init(struct pci_bus *bus, struct address_info *h=
w_config, struct address_info *mpu_config, int slot, int card)
 {
diff -urN --exclude=3D*.flc linux-2.4.0-test1-ac22/drivers/sound/sb_common.=
c linux-2.4.0-test1-ac22.sb/drivers/sound/sb_common.c
--- linux-2.4.0-test1-ac22/drivers/sound/sb_common.c	Sat Apr 29 14:27:55 20=
00
+++ linux-2.4.0-test1-ac22.sb/drivers/sound/sb_common.c	Wed Jun 21 20:14:23=
 2000
@@ -891,6 +891,9 @@
=20
         if (devc && devc->base =3D hw_config->io_base)
         {
+		if (devc->pmdev)
+			pm_unregister(devc->pmdev);
+
                 if ((devc->model & MDL_ESS) && devc->pcibase)
                         release_region(devc->pcibase, 8);
=20
@@ -915,6 +918,7 @@
                                 sound_unload_mididev(devc->my_mididev);
                         sound_unload_audiodev(devc->dev);
                 }
+
                 kfree(devc);
         }
         else
@@ -1291,6 +1295,65 @@
 #endif
         unload_uart401(hw_config);
 }
+
+static int sb_suspend(sb_devc *devc)
+{
+	return 0;
+}
+
+static int sb_resume(sb_devc *devc)
+{
+	int mixer_levels[SOUND_MIXER_NRDEVICES], i;
+
+	/* store old mixer levels */
+	memcpy(mixer_levels, devc->levels, sizeof (mixer_levels));
+
+	/* FIXME: can not test this */
+#if 0
+	if (!((devc->caps & SB_NO_AUDIO) && (devc->caps & SB_NO_MIDI)) && hw_conf=
ig->irq > 0) {
+		/* rewrite incase was forgotten */
+		if (devc->major =3D 4) {
+			sb16_set_irq_hw(devc, devc->irq);
+			sb16_set_dma_hw(devc, devc);
+		}
+	}
+#endif
+
+	if (!sb_dsp_reset(devc)) {
+		DDB(printk("SB reset failed\n"));
+#ifdef MODULE
+		printk(KERN_INFO "sb: dsp reset failed.\n");
+#endif
+		return 0;
+	}
+
+	/* restore mixer settings */
+	for (i =3D 0; i < SOUND_MIXER_NRDEVICES; i++)
+		sb_mixer_set(devc, i, mixer_levels[i]);
+
+	if (devc->model !=3D MDL_ESS || !ess_mixer_reset (devc))
+		sb_set_recmask(devc, SOUND_MASK_MIC);
+	return 0;
+}
+
+
+int sb_pm_callback(struct pm_dev *dev, pm_request_t rqst, void *data)
+{
+	sb_devc *devc =3D dev->data;
+	if (devc) {
+		DEB(printk(KERN_DEBUG "sb: dev %p pm_event: %d\n", devc, rqst));
+		switch (rqst) {
+		case PM_SUSPEND:
+			sb_suspend(devc);
+			break;
+		case PM_RESUME:
+			sb_resume(devc);
+			break;
+		}
+	}
+	return 0;
+}
+
=20
 EXPORT_SYMBOL(sb_dsp_init);
 EXPORT_SYMBOL(sb_dsp_detect);
diff -urN --exclude=3D*.flc linux-2.4.0-test1-ac22/drivers/sound/sb_mixer.c=
 linux-2.4.0-test1-ac22.sb/drivers/sound/sb_mixer.c
--- linux-2.4.0-test1-ac22/drivers/sound/sb_mixer.c	Sun Apr 16 19:33:22 2000
+++ linux-2.4.0-test1-ac22.sb/drivers/sound/sb_mixer.c	Wed Jun 21 01:36:30 =
2000
@@ -344,7 +344,7 @@
         return left | (right << 8);
 }
=20
-static int sb_mixer_set(sb_devc * devc, int dev, int value)
+int sb_mixer_set(sb_devc * devc, int dev, int value)
 {
         int left =3D value & 0x000000ff;
         int right =3D (value & 0x0000ff00) >> 8;
@@ -387,7 +387,7 @@
         sb_setmixer(devc, RECORD_SRC, (sb_getmixer(devc, RECORD_SRC) & ~7)=
 | (src & 0x7));
 }
=20
-static int set_recmask(sb_devc * devc, int mask)
+int sb_set_recmask(sb_devc * devc, int mask)
 {
         int devmask, i;
         unsigned char  regimageL, regimageR;
@@ -569,7 +569,7 @@
                         switch (cmd & 0xff)=20
                         {
                                 case SOUND_MIXER_RECSRC:
-					ret =3D set_recmask(devc, val);
+					ret =3D sb_set_recmask(devc, val);
                                         break;
=20
                                 case SOUND_MIXER_OUTSRC:
@@ -654,7 +654,7 @@
                 sb_mixer_set(devc, i, devc->levels[i]);
=20
         if (devc->model !=3D MDL_ESS || !ess_mixer_reset (devc)) {
-		set_recmask(devc, SOUND_MASK_MIC);
+		sb_set_recmask(devc, SOUND_MASK_MIC);
         };
 }
=20



--=20
D.
