From: Paul Cassella <fortytwo-vger@manetheren.bigw.org>
Date: Sun, 13 Feb 2005 11:31:56 +0000
Subject: [PATCH] 2.6.10 oss/es1371.c, open_mode and FMODE_DAC
Message-Id: <Pine.LNX.4.61.0502130248330.4940@manetheren>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi.

I've been having a strange problem with this driver as long as I've been 
using 2.6:  When /dev/dsp1 is in use, processes block opening /dev/dsp0. 
I _can_ open /dev/dsp1 when /dev/dsp0 is in use.  Both orders worked fine 
in the 2.4 series.

I added some printk()s.  I saw this when I did dsp0 and then dsp1:

    es1371_open:     minor  3, open_mode 0, f_mode e
    es1371_open_dac: minor 19, open_mode 2, f_mode e

es1371_open_dac() only checks for open_mode & FMODE_DAC (which is 4), so 
it goes ahead.

I saw this when I did dsp1 and then dsp0:

    es1371_open_dac: minor 19, open_mode 0, f_mode e
    es1371_open:     minor  3, open_mode 4, f_mode e

es1371_open() checks open_mode & f_mode, and so it waits.

Since these functions make the same checks in the last 2.4 kernel I looked 
at, I'm guessing that in 2.4 f_mode doesn't have 0x4 set.

Since the code is almost the same as 2.4, when it worked, and since it 
appears to be safe to have both in use when the devices are opened in the 
other order, I'm assuming that it's ok to just let es1371_open() proceed 
in this case.

Based on that assumption, here's the patch I came up with.  I've been 
using it since this morning, under fairly gentle use.  (This is actually 
2.6.10-ac12, but the ac patch doesn't touch this file.)

--- sound/oss/es1371.c~	2005-01-02 11:57:39.000000000 -0800
+++ sound/oss/es1371.c	2005-02-12 11:43:05.000000000 -0800
@@ -1931,7 +1931,7 @@
  	file->private_data = s;
  	/* wait for device to become free */
  	down(&s->open_sem);
-	while (s->open_mode & file->f_mode) {
+	while ((s->open_mode & ~FMODE_DAC) & file->f_mode) {
  		if (file->f_flags & O_NONBLOCK) {
  			up(&s->open_sem);
  			return -EBUSY;

I don't know how this might interact with the _midi routines.


BTW, the MAINTAINERS file still lists the old web page:

   PCI SOUND DRIVERS (ES1370, ES1371 and SONICVIBES)
   [...]
   W:	http://www.ife.ee.ethz.ch/~sailer/linux/pciaudio.html


Also BTW, I couldn't find the actual drivers on

   http://www.baycom.org/~tom/linux/pciaudio.html

so I don't know if the version in the kernel is the most recent.


-- 
Paul Cassella
