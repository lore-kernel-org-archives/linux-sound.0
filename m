From: Tim Koopman <tkoopman@email.com>
Date: Sun, 04 Apr 1999 21:34:12 +0000
Subject: Setting up a sound card (PCI 368 DSP Thunderbird)
Message-Id: <marc-linux-sound-92326198517795@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I have a PCI 368DSP sound card.  I have never set any type of sound card

up in linux before (Well, I am actually new to linux), so I would like
some help in doing so.
Can any please email me where I can find out what IRQ & I/Os the sound
card is on and anything else I might need to know.  I think the IRQ is 9

but I am not sure on the I/Os.  I have the /proc/pci file append on the
end if that helps.

Thanks Tim.

PCI devices found:
  Bus  0, device   0, function  0:
    Host bridge: Intel 440LX - 82443LX PAC Host (rev 3).
      Medium devsel.  Fast back-to-back capable.  Master Capable.
Latency2.
      Prefetchable 32 bit memory at 0xf0000000 [0xf0000008].
  Bus  0, device   1, function  0:
    PCI bridge: Intel 440LX - 82443LX PAC AGP (rev 3).
      Medium devsel.  Fast back-to-back capable.  Master Capable.
Latencyd.  Min Gnt.
  Bus  0, device   7, function  0:
    ISA bridge: Intel 82371AB PIIX4 ISA (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.  No
bursts.
  Bus  0, device   7, function  1:
    IDE interface: Intel 82371AB PIIX4 IDE (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.
Latency2.
      I/O at 0xfff0 [0xfff1].
  Bus  0, device   7, function  2:
    USB Controller: Intel 82371AB PIIX4 USB (rev 1).
      Medium devsel.  Fast back-to-back capable.  Master Capable.
LatencyH.
      I/O at 0x5800 [0x5801].
  Bus  0, device   7, function  3:
    Bridge: Intel 82371AB PIIX4 ACPI (rev 1).
      Medium devsel.  Fast back-to-back capable.
  Bus  0, device  20, function  0:
    Multimedia audio controller: VLSI Unknown device (rev 25).
      Vendor id04. Device id04.
      Medium devsel.  Fast back-to-back capable.  IRQ 9.  Master
Capable.  Latencyr.  Min Gnt=9.Max Lat@.
      I/O at 0x7c00 [0x7c01].
      I/O at 0x6c70 [0x6c71].
      I/O at 0x6c54 [0x6c55].
      I/O at 0x6c58 [0x6c59].
  Bus  0, device  20, function  1:
    Input device controller: VLSI Unknown device (rev 25).
      Vendor id04. Device id05.
      Medium devsel.  Fast back-to-back capable.
      I/O at 0x6c60 [0x6c61].
  Bus  0, device  20, function  2:
    Serial controller: VLSI Unknown device (rev 25).
      Vendor id04. Device id06.
      Medium devsel.  Fast back-to-back capable.
      I/O at 0x6c68 [0x6c69].
  Bus  1, device   0, function  0:
    VGA compatible controller: Cirrus Logic GD 5465 (rev 3).
      Medium devsel.  Fast back-to-back capable.  IRQ 9.  Master
Capable.  Latency8.  Min Gnt.Max Lat.
      Non-prefetchable 32 bit memory at 0xf6000000 [0xf6000000].
      Non-prefetchable 32 bit memory at 0xf5ff0000 [0xf5ff0000].
