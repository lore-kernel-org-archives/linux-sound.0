From: Georg Wendt <Georg.Wendt@stud.uni-karlsruhe.de>
Date: Wed, 13 Jan 1999 23:16:05 +0000
Subject: PCI128 WORKS:-))
Message-Id: <marc-linux-sound-91626958722453@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello everybody!

> I guess we need help from some one who has successfully done this before.
> If you get everything done right, let me know.

I got my Creative Soundblaster PCI 128 working!

It happened like this:

- RedHat 5.2 with Kernel 2.0.36 Sources installed
- 2.0.34-modular-3.patch applied by "patch -p0 < 2.0.34-modular-3.patch"
	(ignoring all the messages)
- configure the Kernel with "make config" in /usr/src/linux/:
	a) SoundCard Support as MODULE
	b) ES1370 and ES1371 as MODULE
- "make dep; make clean"
- "make boot"
- "make modules"
- remove old Modules in /lib/modules/
- "make modules_install"
- cp new Kernel to /boot and update LILO
- restart linux with new Kernel
- "sndconfig" finds PCIaudio (in my case 1370)

Done + Happy :-)

Good Night
	Georg
