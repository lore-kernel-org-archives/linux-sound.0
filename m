From: cyl <ironyman13@gmail.com>
Date: Tue, 18 Oct 2011 18:09:46 +0000
Subject: occasional sound loss
Message-Id: <20111018180946.GA595@thinkpad.wireless.utoronto.ca>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Occasionally, sound would stop playing while running mplayer or
nspluginplayer. Restarting mplayer, or other programs that play sound,
there would still be no sound, and no error. The problem solves itself
after I kill all the programs that are playing sound and waiting for
a while. This is still annoying though. 

sudo lspci -v | grep -A 20 -i audio
00:1b.0 Audio device: Intel Corporation 5 Series/3400 Series Chipset High Definition Audio (rev 06)
	Subsystem: Lenovo Device 215e
	Flags: bus master, fast devsel, latency 0, IRQ 43
	Memory at f2520000 (64-bit, non-prefetchable) [sizeK]
	Capabilities: [50] Power Management version 2
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
	Capabilities: [100] Virtual Channel
	Capabilities: [130] Root Complex Link
	Kernel driver in use: HDA Intel
	Kernel modules: snd-hda-intel

What other information should I provide about my system?
