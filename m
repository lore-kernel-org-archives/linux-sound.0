From: Jeff Garzik <jgarzik@mandrakesoft.com>
Date: Fri, 02 Jun 2000 09:21:59 +0000
Subject: PATCH: Looking for nm256 audio driver users to test this...
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------071EA45A44A6A7461DF9C32B"
Message-Id: <marc-linux-sound-95993865831652@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------071EA45A44A6A7461DF9C32B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Anyone have any sound hardware (usually found on laptops) which uses the
nm256 audio driver?  The attached patch would allow us to hook this
nm256 driver into a more modern AC97 kernel interface, but unfortunately
I have no hardware for testing this change.

Any testing and "it works!" or "it doesn't work!" feedback would be
greatly appreciated.

Simple cookbook testing procedure:

1) download and unpack latest development kernel tarball from
ftp://ftp.us.kernel.org/pub/linux/kernel/v2.4/

2) download latest development kernel Alan Cox "ac" patch kit from
ftp://ftp.us.kernel.org/pub/linux/kernel/people/alan/2.4.0test/ and
apply this patch to the kernel unpacked in step #1.

3) build and test a "plain" kernel.  note how well your audio works. 
nothing fancy, just make sure MP3s play and stuff.  :)

4) apply the patch attached to this e-mail.

5) build and test a modified kernel.  note differences (hopefully
none...) in functioning of audio.  This patch changes the mixer code, so
testing the mixer is a good idea.

For more info see the Linux Kernel HOWTO: 
http://www.linuxdoc.org/HOWTO/Kernel-HOWTO.html

Thanks,

	Jeff




-- 
Jeff Garzik              | Liberty is always dangerous, but
Building 1024            | it is the safest thing we have.
MandrakeSoft, Inc.       |      -- Harry Emerson Fosdick
--------------071EA45A44A6A7461DF9C32B
Content-Type: text/plain; charset=us-ascii;
 name="nm256.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nm256.patch"

diff -urN vanilla/linux-2.4.0-test1-ac7/drivers/sound/Makefile linux/drivers/sound/Makefile
--- vanilla/linux-2.4.0-test1-ac7/drivers/sound/Makefile	Wed May 31 09:05:53 2000
+++ linux/drivers/sound/Makefile	Fri Jun  2 05:09:42 2000
@@ -71,7 +71,7 @@
 obj-$(CONFIG_SOUND_MSNDCLAS)	+= msnd.o msnd_classic.o
 obj-$(CONFIG_SOUND_MSNDPIN)	+= msnd.o msnd_pinnacle.o
 obj-$(CONFIG_SOUND_VWSND)	+= vwsnd.o
-obj-$(CONFIG_SOUND_NM256)	+= nm256_audio.o ac97.o
+obj-$(CONFIG_SOUND_NM256)	+= nm256_audio.o ac97_codec.o
 obj-$(CONFIG_SOUND_ICH)		+= i810_audio.o ac97_codec.o
 obj-$(CONFIG_SOUND_SONICVIBES)	+= sonicvibes.o
 obj-$(CONFIG_SOUND_CMPCI)	+= cmpci.o
diff -urN vanilla/linux-2.4.0-test1-ac7/drivers/sound/nm256.h linux/drivers/sound/nm256.h
--- vanilla/linux-2.4.0-test1-ac7/drivers/sound/nm256.h	Mon Oct 25 11:26:52 1999
+++ linux/drivers/sound/nm256.h	Fri Jun  2 05:09:26 2000
@@ -1,7 +1,6 @@
 #ifndef _NM256_H_
 #define _NM256_H_
 
-#include "ac97.h"
 
 /* The revisions that we currently handle.  */
 enum nm256rev {
@@ -18,7 +17,7 @@
     /* Revision number */
     enum nm256rev rev;
 
-    struct ac97_hwint mdev;
+    struct ac97_codec ac97;
 
     /* Our audio device numbers. */
     int dev[2];
@@ -32,9 +31,6 @@
        these are the actual device numbers. */
     int dev_for_play;
     int dev_for_record;
-
-    /* The mixer device. */
-    int mixer_oss_dev;
 
     /* 
      * Can only be opened once for each operation.  These aren't set
diff -urN vanilla/linux-2.4.0-test1-ac7/drivers/sound/nm256_audio.c linux/drivers/sound/nm256_audio.c
--- vanilla/linux-2.4.0-test1-ac7/drivers/sound/nm256_audio.c	Tue Mar  7 16:40:24 2000
+++ linux/drivers/sound/nm256_audio.c	Fri Jun  2 05:09:26 2000
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pm.h>
+#include <linux/ac97_codec.h>
 #include "sound_config.h"
 #include "soundmodule.h"
 #include "nm256.h"
@@ -123,7 +124,7 @@
     struct nm256_info *card;
 
     for (card = nmcard_list; card != NULL; card = card->next_card)
-	if (card->mixer_oss_dev == dev)
+	if (card->ac97.dev_mixer == dev)
 	    return card;
 
     return NULL;
@@ -751,9 +752,9 @@
  */
 
 static int
-nm256_isReady (struct ac97_hwint *dev)
+nm256_isReady (struct ac97_codec *ac97)
 {
-    struct nm256_info *card = (struct nm256_info *)dev->driver_private;
+    struct nm256_info *card = (struct nm256_info *)ac97->private_data;
     int t2 = 10;
     u32 testaddr;
     u16 testb;
@@ -781,48 +782,46 @@
 
 /*
  * Return the contents of the AC97 mixer register REG.  Returns a positive
- * value if successful, or a negative error code.
+ * value if successful, or zero.
  */
-static int
-nm256_readAC97Reg (struct ac97_hwint *dev, u8 reg)
+static u16
+nm256_readAC97Reg (struct ac97_codec *ac97, u8 reg)
 {
-    struct nm256_info *card = (struct nm256_info *)dev->driver_private;
+    struct nm256_info *card = (struct nm256_info *)ac97->private_data;
 
     if (card->magsig != NM_MAGIC_SIG) {
 	printk (KERN_ERR "NM256: Bad magic signature in readAC97Reg!\n");
-	return -EINVAL;
+	return 0;
     }
 
     if (reg < 128) {
 	int res;
 
-	nm256_isReady (dev);
+	nm256_isReady (ac97);
 	res = nm256_readPort16 (card, 2, card->mixer + reg);
 	/* Magic delay.  Bleah yucky.  */
         udelay (1000);
 	return res;
     }
-    else
-	return -EINVAL;
+    return 0;
 }
 
 /* 
  * Writes VALUE to AC97 mixer register REG.  Returns 0 if successful, or
  * a negative error code. 
  */
-static int
-nm256_writeAC97Reg (struct ac97_hwint *dev, u8 reg, u16 value)
+static void
+nm256_writeAC97Reg (struct ac97_codec *ac97, u8 reg, u16 value)
 {
     unsigned long flags;
     int tries = 2;
     int done = 0;
     u32 base;
-
-    struct nm256_info *card = (struct nm256_info *)dev->driver_private;
+    struct nm256_info *card = (struct nm256_info *)ac97->private_data;
 
     if (card->magsig != NM_MAGIC_SIG) {
 	printk (KERN_ERR "NM256: Bad magic signature in writeAC97Reg!\n");
-	return -EINVAL;
+	return;
     }
 
     base = card->mixer;
@@ -830,12 +829,12 @@
     save_flags (flags);
     cli ();
 
-    nm256_isReady (dev);
+    nm256_isReady (ac97);
 
     /* Wait for the write to take, too. */
     while ((tries-- > 0) && !done) {
 	nm256_writePort16 (card, 2, base + reg, value);
-	if (nm256_isReady (dev)) {
+	if (nm256_isReady (ac97)) {
 	    done = 1;
 	    break;
 	}
@@ -844,8 +843,6 @@
 
     restore_flags (flags);
     udelay (1000);
-
-    return ! done;
 }
 
 /* 
@@ -882,9 +879,9 @@
 
 /* Initialize the AC97 into a known state.  */
 static int
-nm256_resetAC97 (struct ac97_hwint *dev)
+nm256_resetAC97 (struct ac97_codec *ac97)
 {
-    struct nm256_info *card = (struct nm256_info *)dev->driver_private;
+    struct nm256_info *card = (struct nm256_info *)ac97->private_data;
     int x;
 
     if (card->magsig != NM_MAGIC_SIG) {
@@ -900,7 +897,7 @@
 
     if (! card->mixer_values_init) {
 	for (x = 0; nm256_ac97_initial_values[x].port != 0xffff; x++) {
-	    ac97_put_register (dev,
+	    nm256_writeAC97Reg (ac97,
 			       nm256_ac97_initial_values[x].port,
 			       nm256_ac97_initial_values[x].value);
 	    card->mixer_values_init = 1;
@@ -910,40 +907,50 @@
     return 0;
 }
 
-/*
- * We don't do anything particularly special here; it just passes the
- * mixer ioctl to the AC97 driver.
- */
-static int
-nm256_default_mixer_ioctl (int dev, unsigned int cmd, caddr_t arg)
+static int nm256_mixer_open (struct inode *inode, struct file *file)
 {
-    struct nm256_info *card = nm256_find_card_for_mixer (dev);
-    if (card != NULL)
-	return ac97_mixer_ioctl (&(card->mdev), cmd, arg);
-    else
+	int minor = MINOR(inode->i_rdev);
+	struct nm256_info *card;
+	
+	MOD_INC_USE_COUNT;
+
+	card = nm256_find_card_for_mixer (minor);
+	if (card)
+		goto match;
+
+	MOD_DEC_USE_COUNT;
 	return -ENODEV;
+
+match:
+	file->private_data = &card->ac97;
+	return 0;
 }
 
-static struct mixer_operations nm256_mixer_operations = {
-    "NeoMagic",
-    "NM256AC97Mixer",
-    nm256_default_mixer_ioctl
-};
+static int nm256_mixer_release (struct inode *inode, struct file *file)
+{
+	MOD_DEC_USE_COUNT;
+	return 0;
+}
 
-/*
- * Default settings for the OSS mixer.  These are set last, after the
- * mixer is initialized.
- *
- * I "love" C sometimes.  Got braces?
- */
-static struct ac97_mixer_value_list mixer_defaults[] = {
-    { SOUND_MIXER_VOLUME,  { { 85, 85 } } },
-    { SOUND_MIXER_SPEAKER, { { 100 } } },
-    { SOUND_MIXER_PCM,     { { 65, 65 } } },
-    { SOUND_MIXER_CD,      { { 65, 65 } } },
-    { -1,                  {  { 0,  0 } } }
-};
+static int nm256_mixer_ioctl (struct inode *inode, struct file *file, unsigned int cmd,
+			    unsigned long arg)
+{
+	struct ac97_codec *codec = file->private_data;
+
+	return codec->mixer_ioctl(codec, cmd, arg);
+}
 
+static loff_t nm256_llseek(struct file *file, loff_t offset, int origin)
+{
+	return -ESPIPE;
+}
+
+static struct file_operations nm256_mixer_fops = {
+	open:		nm256_mixer_open,
+	release:	nm256_mixer_release,
+	llseek:		nm256_llseek,
+	ioctl:		nm256_mixer_ioctl,
+};
 
 /* Installs the AC97 mixer into CARD.  */
 static int
@@ -951,28 +958,36 @@
 {
     int mixer;
 
-    card->mdev.reset_device = nm256_resetAC97;
-    card->mdev.read_reg = nm256_readAC97Reg;
-    card->mdev.write_reg = nm256_writeAC97Reg;
-    card->mdev.driver_private = (void *)card;
-
-    if (ac97_init (&(card->mdev)))
-	return -1;
-
-    mixer = sound_alloc_mixerdev();
-    if (num_mixers >= MAX_MIXER_DEV) {
-	printk ("NM256 mixer: Unable to alloc mixerdev\n");
-	return -1;
+    memset (&card->ac97, 0, sizeof (card->ac97));
+    card->ac97.private_data = (void *)card;
+    card->ac97.codec_read = nm256_readAC97Reg;
+    card->ac97.codec_write = nm256_writeAC97Reg;
+    
+    mixer = register_sound_mixer (&nm256_mixer_fops, -1);
+    if (mixer < 0) {
+	printk (KERN_ERR "NM256 mixer: Unable to alloc mixerdev\n");
+	goto err_out;
+    }
+    
+    card->ac97.dev_mixer = mixer;
+    
+    if (nm256_resetAC97 (&card->ac97)) {
+	printk (KERN_ERR "NM256 mixer: Unable to reset AC97 codec\n");
+    	goto err_out_mixer;
+    }
+
+    if (!ac97_probe_codec(&card->ac97)) {
+	printk (KERN_ERR "NM256 mixer: Unable to probe AC97 codec\n");
+	goto err_out_mixer;
     }
 
-    mixer_devs[mixer] = &nm256_mixer_operations;
-    card->mixer_oss_dev = mixer;
-
-    /* Some reasonable default values.  */
-    ac97_set_values (&(card->mdev), mixer_defaults);
-
     printk(KERN_INFO "Initialized AC97 mixer\n");
     return 0;
+
+err_out_mixer:
+    unregister_sound_mixer (mixer);
+err_out:
+    return -1;
 }
 
 /* Perform a full reset on the hardware; this is invoked when an APM
@@ -981,7 +996,10 @@
 nm256_full_reset (struct nm256_info *card)
 {
     nm256_initHw (card);
-    ac97_reset (&(card->mdev));
+    
+    /* note! this depends on ac97_probe_codec not allocating
+     * or registering anything... */
+    ac97_probe_codec (&card->ac97);
 }
 
 /* 
@@ -1209,7 +1227,7 @@
      * And our mixer.  (We should allow support for other mixers, maybe.)
      */
 
-    nm256_install_mixer (card);
+    nm256_install_mixer (card); /* XXX check return value */
 
     pmdev = pm_register(PM_PCI_DEV, PM_PCI_ID(pcidev), handle_pm_event);
     if (pmdev)
@@ -1265,12 +1283,16 @@
     while((pcidev = pci_find_device(PCI_VENDOR_ID_NEOMAGIC,
 				    PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO,
 				    pcidev)) != NULL) {
+	if (pci_enable_device(pcidev))
+		continue;
 	count += nm256_install(pcidev, REV_NM256AV, "256AV");
     }
 
     while((pcidev = pci_find_device(PCI_VENDOR_ID_NEOMAGIC,
 				    PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO,
 				    pcidev)) != NULL) {
+	if (pci_enable_device(pcidev))
+		continue;
 	count += nm256_install(pcidev, REV_NM256ZX, "256ZX");
     }
 
@@ -1675,7 +1697,7 @@
 	    if (card->has_irq)
 		free_irq (card->irq, card);
 	    nm256_release_ports (card);
-	    sound_unload_mixerdev (card->mixer_oss_dev);
+	    unregister_sound_mixer (card->ac97.dev_mixer);
 	    sound_unload_audiodev (card->dev[0]);
 	    sound_unload_audiodev (card->dev[1]);
 	    next_card = card->next_card;

--------------071EA45A44A6A7461DF9C32B--
