From: Ofer Achler <oachler@ucsd.edu>
Date: Mon, 25 Nov 2002 18:37:57 +0000
Subject: AZT1008 on HP Vectra VL6
Message-Id: <marc-linux-sound-103825052826476@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a couple of old PII HP vectra machines with this sound card.

(Redhat 8.0)
Sndconfig will see it but the kernel module will not admit that the card
exists:
Nov 25 10:32:19 newthird kernel: ad1848/cs4248 codec driver Copyright
(C) by Hannu Savolainen 1993-1996
Nov 25 10:32:19 newthird kernel: ad1848: No ISAPnP cards found, trying
standard ones...


I tried to manually set the configuration via /proc/isapnp and set the
module parameters by hand via insmod (insmod ad1848 ioS4 irq=5 dma=1
dma2=3), it doesnt work.

Tried via sndconfig, still doesnt work...

Any ideas?

Here's the current output (after manually making the card activate in
isapnp) of /proc/isapnp:

Card 1 'AZT1008:AZT1008 PnP SOUND DEVICE' PnP version 1.0 Product
version 0.3
  Logical device 0 'AZT0500:IDE CDROM DISABLED'
    Supported registers 0x2
    Device is not active
    Resources 0
      Priority preferred
      Port 0x0-0x0, align 0x7, size 0x0, 16-bit address decoding
      Port 0x0-0x0, align 0x1, size 0x0, 16-bit address decoding
      IRQ <none> High-Edge
  Logical device 1 'AZT1008:AUDIO'
    Supported registers 0x2
    Device is active
    Active port 0x220,0x388,0x534
    Active IRQ 5 [0x2]
    Active DMA 1,3
    Resources 0
      Priority preferred
      Port 0x220-0x220, align 0xf, size 0x10, 16-bit address decoding
      Port 0x388-0x388, align 0x7, size 0x8, 16-bit address decoding
      Port 0x534-0x534, align 0x3, size 0x4, 16-bit address decoding
      IRQ 5 High-Edge
      DMA 1 8-bit byte-count compatible
      DMA 3 8-bit byte-count compatible
      Alternate resources 0:1
        Priority acceptable
        Port 0x220-0x240, align 0x1f, size 0x10, 16-bit address decoding
        Port 0x388-0x388, align 0x7, size 0x8, 16-bit address decoding
        Port 0x534-0x608, align 0xd3, size 0x4, 16-bit address decoding
        IRQ 5,2/9,10 High-Edge
        DMA 0,1,3 8-bit byte-count compatible
        DMA 0,1,3 8-bit byte-count compatible
      Alternate resources 0:2

