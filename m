From: Clemens Ladisch <clemens@ladisch.de>
Date: Thu, 28 Nov 2002 12:10:34 +0000
Subject: [PATCH][2.2.x,2.4.x] OSS MIDI output loses data
Message-Id: <marc-linux-sound-103848544518164@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


In the 2.1.6 kernel, the output loop in midi_poll() was changed to enable
interrupts during the outputc() call. Unfortunately, the check whether the
device has accepted the current byte ("ok") was moved behind the code
which removes the byte from the output queue, so one byte would be lost
every time the hardware FIFO is full.

-- 
Clemens


--- linux-2.4.19/drivers/sound/midibuf.c	Wed Nov 27 12:34:56 2002
+++ linux/drivers/sound/midibuf.c	Wed Nov 27 16:32:31 2002
@@ -129,15 +129,16 @@
 		for (dev = 0; dev < num_midis; dev++)
 			if (midi_devs[dev] != NULL && midi_out_buf[dev] != NULL)
 			{
-				int ok = 1;
-
-				while (DATA_AVAIL(midi_out_buf[dev]) && ok)
+				while (DATA_AVAIL(midi_out_buf[dev]))
 				{
+					int ok;
 					int c = midi_out_buf[dev]->queue[midi_out_buf[dev]->head];

 					restore_flags(flags);	/* Give some time to others */
 					ok = midi_devs[dev]->outputc(dev, c);
 					cli();
+					if (!ok)
+						break;
 					midi_out_buf[dev]->head = (midi_out_buf[dev]->head + 1) % MAX_QUEUE_SIZE;
 					midi_out_buf[dev]->len--;
 				}

