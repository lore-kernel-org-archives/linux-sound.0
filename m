From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Fri, 06 Jun 2003 01:50:49 +0000
Subject: Patch: linux-2.5.70-bk10/sound/usb/audio.c fix
Message-Id: <marc-linux-sound-105486422005785@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[Earlier today, I sent this message to tiwai@suse.de and meant to cc
it to linux-sound, but accidentally cc'ed it to the invalid email
address linux-audio.  --Adam Richter]

        linux-2.5.70-bk10/sound/usb/audio.c does not compile, due to a
debugging statement.  Here is a proposed patch.  If this looks good
to you, could you please approve it and submit it to Linus?

Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Miplitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."

--- linux-2.5.70-bk10/sound/usb/usbaudio.c      2003-06-05 12:18:06.000000000 -0700
+++ linux/sound/usb/usbaudio.c  2003-06-05 15:24:41.000000000 -0700
@@ -1944,7 +1944,7 @@
        switch (format) {
        case 0: /* some devices don't define this correctly... */
                snd_printdd(KERN_INFO "%d:%u:%d : format type 0 is detected, processed as PCM\n",
-                           dev->devnum, iface_no, altno);
+                           dev->devnum, fp->iface, fp->altsetting);
                /* fall-through */
        case USB_AUDIO_FORMAT_PCM:
                if (sample_width > sample_bytes * 8) {

