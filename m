From: Ian and Iris <brooke@jump.net>
Date: Tue, 30 May 2000 06:41:12 +0000
Subject: Patch for Sound Makefile
Message-Id: <marc-linux-sound-95966907612502@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have an MSS compatible sound system.

Actually it is a Media-Magic ISP-16 two-mode sound card once popular on "Austin"
brand computers. There were never any win95 drivers written for it. I put it in
MSS-compatibility mode with the dos utility prior to running loadlin to start an
actual operating system.

To get a mixer operational, I had to make the patch below.

This is on devices/sound/Makefile on version 2.3.99-pre9

(Pre-8 worked.)

This is for a modular sound system. I have not tried compiling this in, so I do
not know if the link order issues referred to in the makefile would affect this.

narcissus:/tmp$ cat sound-diffs 
--- Makefile~   Tue May 30 01:24:22 2000
+++ Makefile    Tue May 30 01:24:22 2000
@@ -48,7 +48,7 @@
 obj-$(CONFIG_SOUND_MAD16)      += mad16.o ad1848.o sb_lib.o uart401.o
 obj-$(CONFIG_SOUND_CS4232)     += cs4232.o uart401.o
 obj-$(CONFIG_SOUND_OPL3SA2)    += opl3sa2.o ad1848.o uart401.o mpu401.o
-obj-$(CONFIG_SOUND_MSS)                += ad1848.o
+obj-$(CONFIG_SOUND_MSS)                += ad1848.o cs4232.o uart401.o
 obj-$(CONFIG_SOUND_PAS)                += pas2.o sb_lib.o uart401.o
 obj-$(CONFIG_SOUND_SB)         += sb.o sb_lib.o uart401.o
 obj-$(CONFIG_SOUND_WAVEFRONT)  += wavefront.o
