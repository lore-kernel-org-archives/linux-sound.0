From: Hal MacArgle <haltec@iceweb.net>
Date: Mon, 16 Jul 2001 20:00:14 +0000
Subject: SoundBlaster PCI128?
MIME-Version: 1
Content-Type: multipart/mixed; boundary="f2QGlHpHGjS2mn6Y"
Message-Id: <marc-linux-sound-99531378505973@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii

Greetings: Read that Linux supports the SB PCI128 card but I'm stuck
trying to install the driver modules.. sb.o - awe_wave.o - and several
others won't "take."

I know about modinfo -p <driver> and cat /proc/sndstat for checking
but the proper driver and parameters escape me.. Have no IRQ
conflicts that I know of. <grin>

I've attached an edited copy of dmesg pertaining to what was found. I
have no previous experience with the report.. I need a helping hand..

TIA, 
      Hal - in Terra Alta,  WV    A M$ Free Environment
	       email:        haltec@iceweb.net
.

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.txt"

Linux version 2.2.16 (root@bigkitty) (gcc version egcs-2.91.66 19990314/Linux (egcs-1.1.2 release)) #73 Fri Jun 16 18:48:22 PDT 2000
Detected 233870 kHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 466.94 BogoMIPS
Memory: 386736k/393216k available (1640k kernel code, 416k reserved, 4188k data, 236k init)
.................edited.....
cat uses obsolete /proc/pci interface
VFS: Disk change detected on device ide1(22,0)
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb_card: I/O, IRQ, and DMA are mandatory
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb_card: I/O, IRQ, and DMA are mandatory
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb_card: I/O, IRQ, and DMA are mandatory
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
AWE32: not detected
es1370: version v0.31 time 19:19:49 Jun 20 2000
VFS: Disk change detected on device ide1(22,0)
hdc: timeout waiting for DMA
hdc: irq timeout: status=0xd0 { Busy }
hdc: DMA disabled
hdc: ATAPI reset complete
ATAPI device hdc:
  Error: Unit attention -- (Sense key=0x06)
  Power on, reset or hardware reset occurred -- (asc=0x29, ascq=0x00)
VFS: Disk change detected on device ide1(22,0)
ISO 9660 Extensions: Microsoft Joliet Level 3
ISOFS: changing to secondary root
AWE32: not detected
AWE32: not detected
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
Turtle Beach WaveFront Driver
Copyright (C) by Hannu Solvainen, Paul Barton-Davis 1993-1998.
WaveFront: irq and io options must be set.

--f2QGlHpHGjS2mn6Y--
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
