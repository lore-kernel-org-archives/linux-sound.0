From: Miles Lane <miles@speakeasy.org>
Date: Sat, 08 Apr 2000 00:15:46 +0000
Subject: 2.3.99-pre4-4:  SB Live! emu10k1 driver not producing sound.
Message-Id: <marc-linux-sound-95515321222606@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org


What am I doing wrong?

My ESOUND apps seem to be generating sound events (the event counter
shown with the emu10k1 interrupt is incrementing), but I don't=20
hear anything from the speakers.  On the other hand, playing music
in my system's CDROM doesn't cause the counter to increment.

As you can see from this dmesg output, the card is successfully=20
found and the driver gets loaded:

Creative EMU10K1 PCI Audio Driver, version 0.5 , 13:05:25 Apr  7 2000
emu10k1: emu10k1 rev 7 found at IO 0xff80, IRQ 9

/dev contains:

crw-------    1 miles    sys       14,   4 Apr 17  1999 audio
crw-------    1 miles    sys       14,  20 Apr 17  1999 audio1
crw-------    1 miles    sys       14,   3 Apr 17  1999 dsp
crw-------    1 miles    sys       14,  19 Apr 17  1999 dsp1
crw-------    1 miles    sys       35,   0 Apr 17  1999 midi0
crw-------    1 miles    sys       14,   2 Apr 17  1999 midi00
crw-------    1 miles    sys       14,  18 Apr 17  1999 midi01
crw-------    1 miles    sys       14,  34 Apr 17  1999 midi02
crw-------    1 miles    sys       14,  50 Apr 17  1999 midi03
crw-------    1 miles    sys       35,   1 Apr 17  1999 midi1
crw-------    1 miles    sys       35,   2 Apr 17  1999 midi2
crw-------    1 miles    sys       35,   3 Apr 17  1999 midi3
crw-------    1 miles    sys       14,   0 Apr 17  1999 mixer
crw-------    1 miles    sys       14,  16 Apr 17  1999 mixer1

lsmod shows:

Module                  Size  Used by
af_packet              11120   1  (autoclean)
serial                 41904   1  (autoclean)
isa-pnp                28552   0  (autoclean) [serial]
emu10k1                53508   1  (autoclean)
soundcore               3716   4  (autoclean) [emu10k1]
vfat                   10540   1  (autoclean)
fat                    32064   0  (autoclean) [vfat]

My modules.conf file contains:

alias 		sound	 	emu10k1
alias 		char-major-14 	emu10k1
alias		audio		emu10k1
alias		mixer		emu10k1
alias		dsp		emu10k1
alias		dspW		emu10k1
alias		midi		emu10k1

Here's my PCI info:

As you can see, my modem and sound card are sharing IRQ 9.
Is this okay?  The README for the emu10k1 driver states
that I should have "PNP OS" turned off in my system BIOS,
but I've found no setting for PNP that I can modify.

PCI devices found:
  Bus  0, device   0, function  0:
    Host bridge: Advanced Micro Devices [AMD] AMD-751 [Irongate] System
Controller (rev 37).
      Master Capable.  Latencyd. =20
      Prefetchable 32 bit memory at 0xf8000000 [0xfbffffff].
      Prefetchable 32 bit memory at 0xfc9ff000 [0xfc9fffff].
      I/O at 0xffe4 [0xffe7].
  Bus  0, device   1, function  0:
    PCI bridge: Advanced Micro Devices [AMD] AMD-751 [Irongate] AGP
Bridge (rev 1).
      Master Capable.  Latencyd.  Min Gnt=10.
  Bus  0, device   7, function  0:
    ISA bridge: Advanced Micro Devices [AMD] AMD-756 [Viper] ISA (rev
1).
  Bus  0, device   7, function  1:
    IDE interface: Advanced Micro Devices [AMD] AMD-756 [Viper] IDE (rev
3).
      Master Capable.  Latencyd. =20
      I/O at 0xcb00 [0xcb0f].
  Bus  0, device   7, function  3:
    Bridge: Advanced Micro Devices [AMD] AMD-756 [Viper] ACPI (rev 3).
      Master Capable.  Latency". =20
  Bus  0, device   7, function  4:
    USB Controller: Advanced Micro Devices [AMD] AMD-756 [Viper] USB
(rev 6).
      IRQ 10.
      Master Capable.  Latency=16.  Max Lat=80.
      Non-prefetchable 32 bit memory at 0xfebfe000 [0xfebfefff].
  Bus  0, device  15, function  0:
    SCSI storage controller: Adaptec AHA-2930CU (rev 3).
      IRQ 11.
      Master Capable.  Latencyd.  Min Gnt=3D4.Max Lat=3D4.
      I/O at 0xf800 [0xf8ff].
      Non-prefetchable 32 bit memory at 0xfebff000 [0xfebfffff].
  Bus  0, device  18, function  0:
    Communication controller: Lucent Microelectronics Venus WinModem
(V90, 56KFlex) (rev 0).
      IRQ 9.
      Master Capable.  No bursts.  Min Gnt%2.Max Lat=14.
      Non-prefetchable 32 bit memory at 0xfebfdf00 [0xfebfdfff].
      I/O at 0xf400 [0xf4ff].
      I/O at 0xf000 [0xf0ff].
      I/O at 0xffa8 [0xffaf].
  Bus  0, device  19, function  0:
    Ethernet controller: 3Com Corporation 3c905C-TX [Fast Etherlink]
(rev 120).
      IRQ 5.
      Master Capable.  Latencyd.  Min Gnt=10.Max Lat=10.
      I/O at 0xfc00 [0xfc7f].
      Non-prefetchable 32 bit memory at 0xfebfde80 [0xfebfdeff].
  Bus  0, device  20, function  0:
    Multimedia audio controller: Creative Labs SB Live! EMU10000 (rev
7).
      IRQ 9.
      Master Capable.  Latencyd.  Min Gnt=3D2.Max Lat .
      I/O at 0xff80 [0xff9f].
  Bus  0, device  20, function  1:
    Input device controller: Creative Labs SB Live! (rev 7).
      Master Capable.  Latencyd. =20
      I/O at 0xfff0 [0xfff7].
  Bus  1, device   5, function  0:
    VGA compatible controller: PCI device 10de:0101 (nVidia Corporation)
(rev 16).
      IRQ 11.
      Master Capable.  Latencyd.  Min Gnt=3D5.Max Lat=3D1.
      Non-prefetchable 32 bit memory at 0xfd000000 [0xfdffffff].
      Prefetchable 32 bit memory at 0xe8000000 [0xefffffff].
