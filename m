From: Andrea Arcangeli <andrea@e-mind.com>
Date: Sun, 21 Mar 1999 17:50:02 +0000
Subject: Re: [patch] SBPRO 16bit 44.1khz stereo (and some improvement to sb16
Message-Id: <marc-linux-sound-92203950214727@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92170794120018@msgid-missing>
In-Reply-To: <marc-linux-sound-92170794120018@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 18 Mar 1999, Andrea Arcangeli wrote:

>I did some little improvement to the previous code. This patch is
>incremental and it's called sbpro-16bit-2.2.3-AB (AB because it's
>incremental to A ;).

Oh well I have a final patch that is been tested also on the sb16 side. My
-A and -B patches had a grave bug in the sb16 side.

So this new final patch (sbpro-16bit-2.2.3-C) is just been reported to
works fine also with sb16 (and the sbpro side is tested by me ;), in both
half-duplex and fullduplex mode by Edward S. Marshall
<emarshal@logic.net>.

This new patch make the sb16_copy_to_user operation thread safe (if you
have two sb16 both working in fullduplex you _need_ it) and it avoids us
to do the signed<->unsigned conversion in software because now it's the
sb16 that do that in hardware.

The second part of the patch is sbpro related. If you (like me) have an
old sbpro you'll magically find yourself able to reproduce at 16bit
44.1khz stereo mode as you would using an sb16 :). Obviously the sound
quality is bad, but at least everything works again ;)).

Last but not the least, the patch change the copy_user interface to make
it able to report a segfault and it removes a field of overhead.

Index: linux/drivers/sound/audio.c
diff -u linux/drivers/sound/audio.c:1.1.1.1 linux/drivers/sound/audio.c:1.1.2.2
--- linux/drivers/sound/audio.c:1.1.1.1	Mon Jan 18 02:28:36 1999
+++ linux/drivers/sound/audio.c	Wed Mar 17 16:46:59 1999
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
Index: linux/drivers/sound/dev_table.h
diff -u linux/drivers/sound/dev_table.h:1.1.1.1 linux/drivers/sound/dev_table.h:1.1.2.2
--- linux/drivers/sound/dev_table.h:1.1.1.1	Mon Jan 18 02:28:38 1999
+++ linux/drivers/sound/dev_table.h	Wed Mar 17 16:46:59 1999
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
Index: linux/drivers/sound/sb.h
diff -u linux/drivers/sound/sb.h:1.1.1.4 linux/drivers/sound/sb.h:1.1.2.5
--- linux/drivers/sound/sb.h:1.1.1.4	Tue Mar  9 01:53:33 1999
+++ linux/drivers/sound/sb.h	Thu Mar 18 17:55:41 1999
@@ -95,7 +95,8 @@
 	/* State variables */
  	   int opened;
 	/* new audio fields for full duplex support */
-	   int fullduplex;
+	   int fullduplex:1;
+	   int double_speed:1;
 	   int duplex;
 	   int speed, bits, channels;
 	   volatile int irq_ok;
Index: linux/drivers/sound/sb_audio.c
diff -u linux/drivers/sound/sb_audio.c:1.1.1.2 linux/drivers/sound/sb_audio.c:1.1.2.5
--- linux/drivers/sound/sb_audio.c:1.1.1.2	Mon Jan 18 14:38:39 1999
+++ linux/drivers/sound/sb_audio.c	Sun Mar 21 15:37:08 1999
@@ -19,6 +19,9 @@
  * Daniel J. Rodriksson: Changes to make sb16 work full duplex.
  *                       Maybe other 16 bit cards in this code could behave
  *                       the same.
+ * Andrea Arcangeli:	 Yes Daniel, the sbpro now is behaving the same,
+ *			 now that I developed now a virtual 2 channel
+ *			 44.1khz 16 bit mode for the SBPRO ;).
  */
 
 #include <linux/config.h>
@@ -68,6 +71,7 @@
 	devc->irq_mode_16 = IMODE_NONE;
 	devc->fullduplex = devc->duplex &&
 		((mode & OPEN_READ) && (mode & OPEN_WRITE));
+	devc->double_speed = 0;
 	sb_dsp_reset(devc);
 
 	/* At first glance this check isn't enough, some ESS chips might not 
@@ -325,6 +329,20 @@
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
@@ -347,6 +365,7 @@
 	int count = nr_bytes;
 	sb_devc *devc = audio_devs[dev]->devc;
 	unsigned char cmd;
+	int speed;
 
 	/* DMAbuf_start_dma (dev, buf, count, DMA_MODE_WRITE); */
 
@@ -356,6 +375,11 @@
 
 	devc->irq_mode = IMODE_OUTPUT;
 
+	if (!devc->double_speed)
+		speed = devc->speed;
+	else
+		speed = 22050;
+
 	save_flags(flags);
 	cli();
 	if (sb_dsp_command(devc, 0x48))		/* DSP Block size */
@@ -363,7 +387,7 @@
 		sb_dsp_command(devc, (unsigned char) (count & 0xff));
 		sb_dsp_command(devc, (unsigned char) ((count >> 8) & 0xff));
 
-		if (devc->speed * devc->channels <= 23000)
+		if (speed * devc->channels <= 23000)
 			cmd = 0x1c;	/* 8 bit PCM output */
 		else
 			cmd = 0x90;	/* 8 bit high speed PCM output (SB2.01/Pro) */
@@ -555,7 +579,9 @@
 		if (speed > 44100)
 			speed = 44100;
 		if (devc->channels > 1 && speed > 22050)
-			speed = 22050;
+			devc->double_speed = 1;
+		else
+			devc->double_speed = 0;
 		sb201_audio_set_speed(dev, speed);
 	}
 	return devc->speed;
@@ -733,7 +759,7 @@
 
 	sb_dsp_command(devc, (devc->bits = AFMT_S16_LE ? 0xb6 : 0xc6));
 	sb_dsp_command(devc, ((devc->channels = 2 ? 0x20 : 0) +
-			      (devc->bits = AFMT_S16_LE ? 0x10 : 0)));
+			      (bits = AFMT_S16_LE ? 0x10 : 0)));
 	sb_dsp_command(devc, (unsigned char) (cnt & 0xff));
 	sb_dsp_command(devc, (unsigned char) (cnt >> 8));
 
@@ -835,25 +861,22 @@
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
+		len = max_in > max_out ? max_out : max_in;
 		copy_from_user (localbuf + localoffs, userbuf + useroffs, len);
 		*used = len;
 		*returned = len;
@@ -867,21 +890,14 @@
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
@@ -897,26 +913,102 @@
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
+		if (!devc->double_speed)
+		{
+			len = max_in;
+			copy_from_user(localbuf + localoffs, userbuf + useroffs, len);
+			*used = len;
+			*returned = len;
+		} else {
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
+		}
+	} else {
+		if (!devc->double_speed)
+		{
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
+		} else {
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
+		}
+	}
+	return 0;
 }
 
 static void
@@ -997,12 +1089,12 @@
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
 
@@ -1104,6 +1196,7 @@
 			DDB(printk("Will use SB Pro driver\n"));
 			audio_flags = DMA_AUTOMODE;
 			driver = &sbpro_audio_driver;
+			format_mask |= AFMT_S16_LE;
 	}
 
 	if ((devc->dev = sound_install_audiodrv(AUDIO_DRIVER_VERSION,

Andrea Arcangeli
