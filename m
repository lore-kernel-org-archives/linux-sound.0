From: Andrea Arcangeli <andrea@e-mind.com>
Date: Wed, 17 Mar 1999 15:46:17 +0000
Subject: [patch] SBPRO 16bit 44.1khz stereo (and some improvement to sb16
Message-Id: <marc-linux-sound-92170794120018@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

My brother grabbed my AWE32 for doing games with it, so I am been
downgraded to my old sbpro I bought 7/8 years ago ;). Since I want to
continue to use all software I was using in the past without having to
hack it or LD_PRELOAD continously a write(2) and ioctl(2) wrapper that
will convert in realtime all data that will go to the dsp, I hacked the
kernel sb driver to handle a virtual sbpro mode at 16bit 44.1khz stereo.
It will handle also 8bit 44.1khz stereo and hopefully all other various
combination.

I also changed the sb16 full-duplex mode in order to do the signed <->
unsigned data conversion in hardware (obvious improvement) and to avoid a
copy of the data from the tmp buffer to the kernel dma pool. I think this
last could be an improvement because get_user should be reduced only to a
movl in the fast path, and we was doing a movl also before while doing the
conversion. But the reason I removed the buffer is just that I don't like
a static buffer, if write(2) would be threaded (in the case we'll drop
sometime in the future the big kernel lock) the static buffer would not be
thread safe. This part of the patch (the sb16 part) is completly untested
though and I would like to get feedback about it ;).

This patch is against 2.2.3 and is called sbpro-16bit-2.2.3-A.

Index: drivers/sound//audio.c
=================================RCS file: /var/cvs/linux/drivers/sound/audio.c,v
retrieving revision 1.1.2.1
diff -u -r1.1.2.1 audio.c
--- audio.c	1999/01/18 01:36:14	1.1.2.1
+++ linux/drivers/sound/audio.c	1999/03/17 14:08:38
@@ -249,12 +249,12 @@
 			if(copy_from_user(dma_buf, &(buf)[p], l))
 				return -EFAULT;
 		} 
-		else audio_devs[dev]->d->copy_user (dev,
-						dma_buf, 0,
-						buf, p,
-						c, buf_size,
-						&used, &returned,
-						l);
+		else if (audio_devs[dev]->d->copy_user (dev,
+							dma_buf, 0,
+							buf, p,
+							c, buf_size,
+							&used, &returned))
+			return -EFAULT;
 		l = returned;
 
 		if (audio_devs[dev]->local_conversion & CNV_MU_LAW)
Index: drivers/sound//dev_table.h
=================================RCS file: /var/cvs/linux/drivers/sound/dev_table.h,v
retrieving revision 1.1.2.1
diff -u -r1.1.2.1 dev_table.h
--- dev_table.h	1999/01/18 01:36:17	1.1.2.1
+++ linux/drivers/sound/dev_table.h	1999/03/17 14:09:42
@@ -190,12 +190,11 @@
 	int (*prepare_for_output) (int dev, int bufsize, int nbufs);
 	void (*halt_io) (int dev);
 	int (*local_qlen)(int dev);
-	void (*copy_user) (int dev,
-			char *localbuf, int localoffs,
-                        const char *userbuf, int useroffs,
-                        int max_in, int max_out,
-                        int *used, int *returned,
-                        int len);
+	int (*copy_user) (int dev,
+			  char *localbuf, int localoffs,
+			  const char *userbuf, int useroffs,
+			  int max_in, int max_out,
+			  int *used, int *returned);
 	void (*halt_input) (int dev);
 	void (*halt_output) (int dev);
 	void (*trigger) (int dev, int bits);
Index: drivers/sound//sb_audio.c
=================================RCS file: /var/cvs/linux/drivers/sound/sb_audio.c,v
retrieving revision 1.1.2.2
diff -u -r1.1.2.2 sb_audio.c
--- sb_audio.c	1999/01/18 13:56:39	1.1.2.2
+++ linux/drivers/sound/sb_audio.c	1999/03/17 15:36:44
@@ -19,6 +19,9 @@
  * Daniel J. Rodriksson: Changes to make sb16 work full duplex.
  *                       Maybe other 16 bit cards in this code could behave
  *                       the same.
+ * Andrea Arcangeli:	 Yes Daniel, the sbpro now is behaving the same,
+ *			 now that I developed now a virtual 2 channel
+ *			 44.1khz 16 bit mode for the SBPRO ;).
  */
 
 #include <linux/config.h>
@@ -325,6 +328,20 @@
 	return devc->bits = 8;
 }
 
+static unsigned int sbpro_audio_set_bits(int dev, unsigned int bits)
+{
+	sb_devc *devc = audio_devs[dev]->devc;
+	if (bits != 0)
+	{
+		if (bits = AFMT_S16_LE && !(devc->opened & OPEN_READ))
+			devc->bits = AFMT_S16_LE;
+		else
+			devc->bits = AFMT_U8;
+	}
+
+	return devc->bits;
+}
+
 static void sb1_audio_halt_xfer(int dev)
 {
 	unsigned long flags;
@@ -347,6 +364,7 @@
 	int count = nr_bytes;
 	sb_devc *devc = audio_devs[dev]->devc;
 	unsigned char cmd;
+	unsigned long bits;
 
 	/* DMAbuf_start_dma (dev, buf, count, DMA_MODE_WRITE); */
 
@@ -358,6 +376,9 @@
 
 	save_flags(flags);
 	cli();
+	bits = devc->bits;
+	devc->bits = AFMT_U8;
+
 	if (sb_dsp_command(devc, 0x48))		/* DSP Block size */
 	{
 		sb_dsp_command(devc, (unsigned char) (count & 0xff));
@@ -373,6 +394,7 @@
 	}
 	else
 		printk(KERN_ERR "Sound Blaster: unable to start DAC.\n");
+	devc->bits = bits;
 	restore_flags(flags);
 	devc->intr_active = 1;
 }
@@ -554,8 +576,6 @@
 			speed = 4000;
 		if (speed > 44100)
 			speed = 44100;
-		if (devc->channels > 1 && speed > 22050)
-			speed = 22050;
 		sb201_audio_set_speed(dev, speed);
 	}
 	return devc->speed;
@@ -733,7 +753,7 @@
 
 	sb_dsp_command(devc, (devc->bits = AFMT_S16_LE ? 0xb6 : 0xc6));
 	sb_dsp_command(devc, ((devc->channels = 2 ? 0x20 : 0) +
-			      (devc->bits = AFMT_S16_LE ? 0x10 : 0)));
+			      (bits = AFMT_S16_LE ? 0x10 : 0)));
 	sb_dsp_command(devc, (unsigned char) (cnt & 0xff));
 	sb_dsp_command(devc, (unsigned char) (cnt >> 8));
 
@@ -835,25 +855,22 @@
 	devc->trigger_bits = bits | bits_16;
 }
 
-static unsigned char lbuf8[2048];
-static signed short *lbuf16 = (signed short *)lbuf8;
-#define LBUFCOPYSIZE 1024
-static void
+static int
 sb16_copy_from_user(int dev,
 		char *localbuf, int localoffs,
 		const char *userbuf, int useroffs,
 		int max_in, int max_out,
-		int *used, int *returned,
-		int len)
+		int *used, int *returned)
 {
 	sb_devc       *devc = audio_devs[dev]->devc;
-	int           i, c, p, locallen;
+	int           i, len;
 	unsigned char *buf8;
 	signed short  *buf16;
 
 	/* if not duplex no conversion */
 	if (!devc->fullduplex)
 	{
+		len = max_in;
 		copy_from_user (localbuf + localoffs, userbuf + useroffs, len);
 		*used = len;
 		*returned = len;
@@ -867,21 +884,14 @@
 		/* c, count of samples remaining in buffer ( 16 bits )*/
 		/* p, count of samples already processed ( 16 bits )*/
 		len = ( (max_in >> 1) > max_out) ? max_out : (max_in >> 1);
-		c = len;
-		p = 0;
-		buf8 = (unsigned char *)(localbuf + localoffs);
-		while (c)
+		buf8 = (unsigned char *) (localbuf + localoffs);
+		buf16 = (signed short *) (userbuf + useroffs);
+		for (i=0; i<len; i++)
 		{
-			locallen = (c >= LBUFCOPYSIZE ? LBUFCOPYSIZE : c);
-			/* << 1 in order to get 16 bit samples */
-			copy_from_user (lbuf16,
-					userbuf+useroffs + (p << 1),
-					locallen << 1);
-			for (i = 0; i < locallen; i++)
-			{
-				buf8[p+i] = ~((lbuf16[i] >> 8) & 0xff) ^ 0x80;
-			}
-			c -= locallen; p += locallen;
+			signed short sample;
+			if (get_user(sample, buf16+i))
+				return -EFAULT;
+			buf8[i] = sample >> 8;
 		}
 		/* used = ( samples * 16 bits size ) */
 		*used = len << 1;
@@ -897,26 +907,102 @@
 		/* c, count of samples remaining in buffer ( 8 bits )*/
 		/* p, count of samples already processed ( 8 bits )*/
 		len = max_in > (max_out >> 1) ? (max_out >> 1) : max_in;
-		c = len;
-		p = 0;
-		buf16 = (signed short *)(localbuf + localoffs);
-		while (c)
+		buf16 = (signed short *) (localbuf + localoffs);
+		buf8 = (unsigned char *) (userbuf + useroffs);
+		for (i=0; i<len; i++)
 		{
-			locallen = (c >= LBUFCOPYSIZE ? LBUFCOPYSIZE : c);
-			copy_from_user (lbuf8,
-					userbuf+useroffs + p,
-					locallen);
-			for (i = 0; i < locallen; i++)
-			{
-				buf16[p+i] = (~lbuf8[i] ^ 0x80) << 8;
-			}
-	      		c -= locallen; p += locallen;
+			unsigned char sample;
+			if (get_user(sample, buf8+i))
+				return -EFAULT;
+			buf16[i] = sample << 8;
 		}
 		/* used = ( samples * 8 bits size ) */
 		*used = len;
 		/* returned = ( samples * 16 bits size ) */
 		*returned = len << 1;
 	}
+	return 0;
+}
+
+static int sbpro_copy_from_user(int dev, char *localbuf, int localoffs,
+		const char *userbuf, int useroffs,
+		int max_in, int max_out,
+		int *used, int *returned)
+{
+	sb_devc *devc = audio_devs[dev]->devc;
+	int len;
+
+	if (devc->bits = AFMT_U8)
+	{
+		if (devc->speed > 40000 && devc->channels = 2)
+		{
+			unsigned char *buf22k;
+			unsigned char *buf44k;
+			int i;
+
+			len = ( (max_in >> 1) > max_out) ? max_out : (max_in >> 1);
+			buf22k = (unsigned char *) (localbuf + localoffs);
+			buf44k = (unsigned char *) (userbuf + useroffs);
+			for (i=0; i<len; i++)
+			{
+				unsigned char sample;
+				if (get_user(sample, buf44k+i*2))
+					return -EFAULT;
+				buf22k[i] = sample;
+			}
+			/* used = ( samples * 16 bits size ) */
+			*used = len << 1;
+			/* returned = ( samples * 8 bits size ) */
+			*returned = len;
+		} else {
+			len = max_in;
+			copy_from_user(localbuf + localoffs, userbuf + useroffs, len);
+			*used = len;
+			*returned = len;
+		}
+	} else {
+		if (devc->speed > 40000 && devc->channels = 2)
+		{
+			unsigned char *buf8_22k;
+			signed short *buf16_44k;
+			int i;
+
+			len = ( (max_in >> 2) > max_out) ? max_out : (max_in >> 2);
+			buf8_22k = (unsigned char *) (localbuf + localoffs);
+			buf16_44k = (signed short *) (userbuf + useroffs);
+			for (i=0; i<len; i++)
+			{
+				signed short sample;
+				if (get_user(sample, buf16_44k+i*2))
+					return -EFAULT;
+				buf8_22k[i] = ~(sample >> 8) ^ 0x80;
+			}
+			/* used = ( samples * 16 bits size ) */
+			*used = len << 2;
+			/* returned = ( samples * 8 bits size ) */
+			*returned = len;
+		} else {
+			unsigned char *buf8;
+			signed short  *buf16;
+			int i;
+
+			len = ( (max_in >> 1) > max_out) ? max_out : (max_in >> 1);
+			buf8 = (unsigned char *) (localbuf + localoffs);
+			buf16 = (signed short *) (userbuf + useroffs);
+			for (i=0; i<len; i++)
+			{
+				signed short sample;
+				if (get_user(sample, buf16+i))
+					return -EFAULT;
+				buf8[i] = ~(sample >> 8) ^ 0x80;
+			}
+			/* used = ( samples * 16 bits size ) */
+			*used = len << 1;
+			/* returned = ( samples * 8 bits size ) */
+			*returned = len;
+		}
+	}
+	return 0;
 }
 
 static void
@@ -997,12 +1083,12 @@
 	sbpro_audio_prepare_for_output,
 	sb1_audio_halt_xfer,
 	NULL,			/* local_qlen */
-	NULL,			/* copy_from_user */
+	sbpro_copy_from_user,	/* copy_from_user */
 	NULL,
 	NULL,
 	sb20_audio_trigger,
 	sbpro_audio_set_speed,
-	sb1_audio_set_bits,
+	sbpro_audio_set_bits,
 	sbpro_audio_set_channels
 };
 
@@ -1104,6 +1190,7 @@
 			DDB(printk("Will use SB Pro driver\n"));
 			audio_flags = DMA_AUTOMODE;
 			driver = &sbpro_audio_driver;
+			format_mask |= AFMT_S16_LE;
 	}
 
 	if ((devc->dev = sound_install_audiodrv(AUDIO_DRIVER_VERSION,
 

Forget to tell, I also changed the copy_user api to be enabled to
segfault, and I removed a redundant field.

BTW, what about the alsa drivers? Are they going to replace OSS?

Andrea Arcangeli
