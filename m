From: Andrea Arcangeli <andrea@e-mind.com>
Date: Thu, 18 Mar 1999 16:55:26 +0000
Subject: Re: [patch] SBPRO 16bit 44.1khz stereo (and some improvement to sb16
Message-Id: <marc-linux-sound-92177849204081@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92170794120018@msgid-missing>
In-Reply-To: <marc-linux-sound-92170794120018@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 17 Mar 1999, Andrea Arcangeli wrote:

>This patch is against 2.2.3 and is called sbpro-16bit-2.2.3-A.

I did some little improvement to the previous code. This patch is
incremental and it's called sbpro-16bit-2.2.3-AB (AB because it's
incremental to A ;).

Index: sb.h
=================================RCS file: /var/cvs/linux/drivers/sound/sb.h,v
retrieving revision 1.1.2.4
diff -u -r1.1.2.4 sb.h
--- sb.h	1999/03/09 01:23:44	1.1.2.4
+++ linux/drivers/sound/sb.h	1999/03/18 16:40:53
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
Index: sb_audio.c
=================================RCS file: /var/cvs/linux/drivers/sound/sb_audio.c,v
retrieving revision 1.1.2.3
diff -u -r1.1.2.3 sb_audio.c
--- sb_audio.c	1999/03/17 15:46:59	1.1.2.3
+++ linux/drivers/sound/sb_audio.c	1999/03/18 16:50:54
@@ -71,6 +71,7 @@
 	devc->irq_mode_16 = IMODE_NONE;
 	devc->fullduplex = devc->duplex &&
 		((mode & OPEN_READ) && (mode & OPEN_WRITE));
+	devc->double_speed = 0;
 	sb_dsp_reset(devc);
 
 	/* At first glance this check isn't enough, some ESS chips might not 
@@ -364,7 +365,7 @@
 	int count = nr_bytes;
 	sb_devc *devc = audio_devs[dev]->devc;
 	unsigned char cmd;
-	unsigned long bits;
+	int speed;
 
 	/* DMAbuf_start_dma (dev, buf, count, DMA_MODE_WRITE); */
 
@@ -374,17 +375,19 @@
 
 	devc->irq_mode = IMODE_OUTPUT;
 
+	if (!devc->double_speed)
+		speed = devc->speed;
+	else
+		speed = 22050;
+
 	save_flags(flags);
 	cli();
-	bits = devc->bits;
-	devc->bits = AFMT_U8;
-
 	if (sb_dsp_command(devc, 0x48))		/* DSP Block size */
 	{
 		sb_dsp_command(devc, (unsigned char) (count & 0xff));
 		sb_dsp_command(devc, (unsigned char) ((count >> 8) & 0xff));
 
-		if (devc->speed * devc->channels <= 23000)
+		if (speed * devc->channels <= 23000)
 			cmd = 0x1c;	/* 8 bit PCM output */
 		else
 			cmd = 0x90;	/* 8 bit high speed PCM output (SB2.01/Pro) */
@@ -394,7 +397,6 @@
 	}
 	else
 		printk(KERN_ERR "Sound Blaster: unable to start DAC.\n");
-	devc->bits = bits;
 	restore_flags(flags);
 	devc->intr_active = 1;
 }
@@ -576,6 +578,10 @@
 			speed = 4000;
 		if (speed > 44100)
 			speed = 44100;
+		if (devc->channels > 1 && speed > 22050)
+			devc->double_speed = 1;
+		else
+			devc->double_speed = 0;
 		sb201_audio_set_speed(dev, speed);
 	}
 	return devc->speed;
@@ -934,8 +940,13 @@
 
 	if (devc->bits = AFMT_U8)
 	{
-		if (devc->speed > 40000 && devc->channels = 2)
+		if (!devc->double_speed)
 		{
+			len = max_in;
+			copy_from_user(localbuf + localoffs, userbuf + useroffs, len);
+			*used = len;
+			*returned = len;
+		} else {
 			unsigned char *buf22k;
 			unsigned char *buf44k;
 			int i;
@@ -954,50 +965,45 @@
 			*used = len << 1;
 			/* returned = ( samples * 8 bits size ) */
 			*returned = len;
-		} else {
-			len = max_in;
-			copy_from_user(localbuf + localoffs, userbuf + useroffs, len);
-			*used = len;
-			*returned = len;
 		}
 	} else {
-		if (devc->speed > 40000 && devc->channels = 2)
+		if (!devc->double_speed)
 		{
-			unsigned char *buf8_22k;
-			signed short *buf16_44k;
+			unsigned char *buf8;
+			signed short  *buf16;
 			int i;
 
-			len = ( (max_in >> 2) > max_out) ? max_out : (max_in >> 2);
-			buf8_22k = (unsigned char *) (localbuf + localoffs);
-			buf16_44k = (signed short *) (userbuf + useroffs);
+			len = ( (max_in >> 1) > max_out) ? max_out : (max_in >> 1);
+			buf8 = (unsigned char *) (localbuf + localoffs);
+			buf16 = (signed short *) (userbuf + useroffs);
 			for (i=0; i<len; i++)
 			{
 				signed short sample;
-				if (get_user(sample, buf16_44k+i*2))
+				if (get_user(sample, buf16+i))
 					return -EFAULT;
-				buf8_22k[i] = ~(sample >> 8) ^ 0x80;
+				buf8[i] = ~(sample >> 8) ^ 0x80;
 			}
 			/* used = ( samples * 16 bits size ) */
-			*used = len << 2;
+			*used = len << 1;
 			/* returned = ( samples * 8 bits size ) */
 			*returned = len;
 		} else {
-			unsigned char *buf8;
-			signed short  *buf16;
+			unsigned char *buf8_22k;
+			signed short *buf16_44k;
 			int i;
 
-			len = ( (max_in >> 1) > max_out) ? max_out : (max_in >> 1);
-			buf8 = (unsigned char *) (localbuf + localoffs);
-			buf16 = (signed short *) (userbuf + useroffs);
+			len = ( (max_in >> 2) > max_out) ? max_out : (max_in >> 2);
+			buf8_22k = (unsigned char *) (localbuf + localoffs);
+			buf16_44k = (signed short *) (userbuf + useroffs);
 			for (i=0; i<len; i++)
 			{
 				signed short sample;
-				if (get_user(sample, buf16+i))
+				if (get_user(sample, buf16_44k+i*2))
 					return -EFAULT;
-				buf8[i] = ~(sample >> 8) ^ 0x80;
+				buf8_22k[i] = ~(sample >> 8) ^ 0x80;
 			}
 			/* used = ( samples * 16 bits size ) */
-			*used = len << 1;
+			*used = len << 2;
 			/* returned = ( samples * 8 bits size ) */
 			*returned = len;
 		}

Andrea Arcangeli
