From: Alexis DOMJAN <disco@igaia.ch>
Date: Sun, 27 Sep 1998 19:04:43 +0000
Subject: AWE32 initialization wiht isapnp
Message-Id: <marc-linux-sound-90692428831897@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

In order to use the wavetable device of my AWE32 I was starting under
MSDOS, executing ctpnp to configure the card and then I was running
loadlin and the Wavetable was properly detected.

However I only want to use lilo, so I'm using isapnp to configure the
awe32 (audio and wavetable) and then I "modprobe" sound module. Then the
audio device (dsp, opl2/3) is correclty detected, but the AWE32 Wavetable
on port 0x620 is not detected (according to /proc/ioports).

Can someone help me please ?

---
Alexis Domjan <adomjan@horus.ch>
