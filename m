From: Magic Phibo <phibo@gmx.li>
Date: Thu, 04 Oct 2001 13:47:29 +0000
Subject: Problems recording sound with ISAPnp Soundcard since Kernel-2.4.x
Message-Id: <marc-linux-sound-100220329623616@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello 

Sorry, if this mail arrives twice ...

Since upgrade to Kernel-2.4.x (currently 2.4.10) I got problems recording sound
causing following error message in /var/log/messages:

Sep 30 15:53:16 osiris kernel: Sound: DMA (input) timed out - IRQ/DRQ configerror?

It's a redhat dist. (7.0) with a Yamaha ISAPnp Soundcard (OPL3 YMF719) and a
self configured Kernel-2.4.10.

With 2.2-Kernels and the isapnp tools (pnpdump/isapnp) the soundcard worked
fine. But with the same isapnp.conf and module parameters (irq,ioports,dma) and 
Kernel-2.4.x the soundcard is recognized, modules are loaded successfully and
any kind of soundfiles can be played, but recording like

'rec /tmp/soundfile.au' oder 'cat > /tmp/soundfile.au < /dev/audio'

does NOT work anymore.

I also tried the new isapnp support (included since Kernel-2.4.x) as module or
directly in the kernel. Here is the output of 'dmesg':

isapnp: Scanning for PnP cards...
isapnp: Card 'OPL3-SA3 Sound Board'
isapnp: 1 Plug & Play card detected total 
ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
ad1848: No ISAPnP cards found, trying standard ones...
opl3sa2: Activated ISA PnP card 0 (active=1)
opl3sa2: chipset version = 0x4
opl3sa2: Found OPL3-SA3 (YMF715E or YMF719E)
<OPL3-SA3> at 0x100
<MS Sound System (CS4231)> at 0xe84 irq 5 dma 1,3
<MPU-401 0.0  Midi interface #1> at 0x300 irq 5
opl3sa2: 1 PnP card(s) found.
YM3812 and OPL-3 driver Copyright (C) by Hannu Savolainen, Rob Hooft 1993-1996
<Yamaha OPL3> at 0x388

Here the contents of /proc/isapnp:

Card 1 'YMH0800:OPL3-SA3 Sound Board' PnP version 1.0  Logical device 0
'YMH0021:Unknown' Device is active
Active port 0x240,0xe80,0x388,0x300,0x100
Active IRQ 5 [0x2]
Active DMA 1,3
Resources 0
Priority preferred
Port 0x220-0x220, align 0xf, size 0x10, 16-bit address decoding
Port 0x530-0x530, align 0x7, size 0x8, 16-bit address decoding
Port 0x388-0x388, align 0x7, size 0x8, 16-bit address decoding
Port 0x330-0x330, align 0x1, size 0x2, 16-bit address decoding
Port 0x370-0x370, align 0x1, size 0x2, 16-bit address decoding
IRQ 5 High-Edge
DMA 0 8-bit byte-count type-A
DMA 1 8-bit byte-count type-A
Alternate resources 0:1
Priority acceptable
Port 0x240-0x240, align 0xf, size 0x10, 16-bit address decoding
Port 0xe80-0xe80, align 0x7, size 0x8, 16-bit address decoding
Port 0x388-0x388, align 0x7, size 0x8, 16-bit address decoding
Port 0x300-0x300, align 0x1, size 0x2, 16-bit address decoding
Port 0x100-0xffe, align 0x1, size 0x2, 16-bit address decoding
IRQ 5,7,2/9,10,11 High-Edge
DMA 0,1,3 8-bit byte-count type-A
DMA 0,1,3 8-bit byte-count type-A
Alternate resources 0:2
Priority functional
Port 0x220-0x280, align 0xf, size 0x10, 16-bit address decoding
Port 0x530-0xf48, align 0x7, size 0x8, 16-bit address decoding
Port 0x388-0x3f8, align 0x7, size 0x8, 16-bit address decoding
Port 0x300-0x334, align 0x1, size 0x2, 16-bit address decoding
Port 0x100-0xffe, align 0x1, size 0x2, 16-bit address decoding
IRQ 3,5,7,2/9,10,11 High-Edge
DMA 0,1,3 8-bit byte-count type-A
DMA 0,1,3 8-bit byte-count type-A
Logical device 1 'YMH0022:Unknown'
Compatible device PNPb02f
Device is not active
Active DMA 0,0
Resources 0
Priority preferred
Port 0x201-0x201, align 0x0, size 0x1, 16-bit address decoding
Alternate resources 0:1
Priority acceptable
Port 0x202-0x202, align 0x0, size 0x1, 16-bit address decoding
Alternate resources 0:2
Priority acceptable
Port 0x203-0x203, align 0x0, size 0x1, 16-bit address decoding
Alternate resources 0:3
Priority acceptable
Port 0x204-0x20f, align 0x0, size 0x1, 16-bit address decoding 

The result is just the same: card recognized, modules loaded, soundfiles
can be played, but NO recording causing the same error message as 
mentioned above.

Here is my /etc/isapnp.conf (for the isapnp tools without isapnp support
in the kernel):

(READPORT 0x0273)
(ISOLATE PRESERVE)
(IDENTIFY *)
(VERBOSITY 2)
(CONFLICT (IO FATAL)(IRQ FATAL)(DMA FATAL)(MEM FATAL)) # or WARNING
(CONFIGURE YMH0800/-1 (LD 0
(IO 0 (SIZE 16) (BASE 0x0220))
(IO 1 (SIZE 8) (BASE 0x0530))
(IO 2 (SIZE 8) (BASE 0x0388))
(IO 3 (SIZE 2) (BASE 0x0330))
(IO 4 (SIZE 2) (BASE 0x0370))
(INT 0 (IRQ 5 (MODE +E))) 
(DMA 0 (CHANNEL 0))
(DMA 1 (CHANNEL 1))
(NAME "YMH0800/-1[0]{OPL3-SA3 Sound Board}")
(ACT Y)
))
(CONFIGURE YMH0800/-1 (LD 1
(IO 0 (SIZE 1) (BASE 0x0201))
(NAME "YMH0800/-1[1]{OPL3-SA3 Sound Board}")
(ACT Y)
))
(WAITFORKEY)

And my /etc/modules.conf:

alias sound-slot-0 opl3sa2
options sound dmabuf=1
alias midi opl3
options opl3 io=0x388
options opl3sa2 mss_io=0x530 irq=5 dma=0 dma2=1 mpu_io=0x330 io=0x370

I also tried different dma channels (dma=1 dma2=3) leading to the same result. 
Moreover I checked another ISAPnp soundcard (Soundblaster), which also
worked perfectly with Kernel-2.2.x, but with Kernel-2.4.x it's behaviour is just
the same as with the Yamaha soundcard: card recognized, modules loaded
successfully, soundfiles can be played but NO recording !!!

What can I try else or did I forget anything ?

Thanks in advance for your help !


Cheers,
Phibo








