From: Greg Wooledge <wooledge@kellnet.com>
Date: Sun, 10 Jan 1999 16:48:32 +0000
Subject: problem solved (Re: 2.2.0-pre5 SB16 problem: /dev/dsp does not work (DMA problem?))
Message-Id: <marc-linux-sound-91602184825333@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Oleg Drokin (green@ccssu.ccssu.crimea.ua) wrote:

> GW> (INT 0 (IRQ 5 (MODE +E)))
> GW> (DMA 0 (CHANNEL 1))
> GW> (DMA 1 (CHANNEL 3))
> Perhaps this it is, but I may be wrong.
> 
> GW> options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
> Aha, you have it, then it might be the case, that your sb's 16 bit dma
> is not on channel 5.

/me feels stupid

I made the mistake of reading the comments in the isapnp.conf file.  I'll
know not to do that next time.  They only served to confuse me.

Changing the /etc/conf.modules line to read

options sb io=0x220 irq=5 dma=1 dma16=3 mpu_io=0x330 

fixed my problem.  I can now play sounds on /dev/dsp with 2.2.0-pre5.
Sounds great, actually (taking into account the quality of my speakers).
:-)

For the benefit of anyone who, like me, is searching through the
linux-kernel mailing list archives for answers to problems, let me
summarize my understanding of the /etc/isapnp.conf stuff:

0) (Search fodder....)  The problem: dmesg used to say this whenever I
   tried to use /dev/dsp:

      Sound: DMA (output) timed out - IRQ/DRQ config error?

1) Run pnpdump >/etc/isapnp.conf to generate the template file.  This
   will contain a bunch of lines for the PnP card.

2) The isapnp.conf file will contain this comment:

      # Multiple choice time, choose one only !

   This does not mean "choose one line".  It means "choose one section".
   You need to uncomment all the LISP-like lines of the section you choose,
   not just one line.

3) The isapnp.conf file will contain this comment:

      # Don't forget to uncomment the activate (ACT Y) when happy

   This one is valid.

4) For a Soundblaster ViBRA16, the isapnp.conf file contains:

      #       Next DMA channel 3.
      #             8 bit DMA only
      #             Logical device is not a bus master
      #             DMA may execute in count by byte mode
      #             DMA may not execute in count by word mode
      #             DMA channel speed in compatible mode
      (DMA 1 (CHANNEL 3))

   This is what screwed me up.  The "DMA 1" channel (3) is what I had to
   put in as the "dma16" parameter to the sb module in /etc/conf.modules.
   To me, this means that it's really a 16-bit DMA channel, not an 8-bit
   channel (but see the message below...).

5) Final working configuration:

   In /etc/isapnp.conf:

     (READPORT 0x0203)
     (ISOLATE PRESERVE)
     (IDENTIFY *)
     (VERBOSITY 2)
     (CONFLICT (IO FATAL)(IRQ FATAL)(DMA FATAL)(MEM FATAL)) # or WARNING
     (CONFIGURE CTL00f0/-1 (LD 0
      (INT 0 (IRQ 5 (MODE +E)))
      (DMA 0 (CHANNEL 1))
      (DMA 1 (CHANNEL 3))
      (IO 0 (SIZE 16) (BASE 0x0220))
      (IO 1 (SIZE 2) (BASE 0x0330))
      (IO 2 (SIZE 4) (BASE 0x0388))
      (NAME "CTL00f0/-1[0]{Audio               }")
      (ACT Y)
     ))
     (CONFIGURE CTL00f0/-1 (LD 1
      (NAME "CTL00f0/-1[1]{Game                }")
     ))
     (WAITFORKEY)

   In /etc/conf.modules (among other things):

     alias sound sb
     alias midi opl3
     options opl3 io=0x388 
     options sb io=0x220 irq=5 dma=1 dma16=3 mpu_io=0x330 

I don't know whether the MIDI options are correct -- I don't have any
MIDI files to test at this point.

I am getting one error message in dmesg:

Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
SB 4.16 detected OK (220)
SB16: Bad or missing 16 bit DMA channel

However, since sound works at this point, and all my attempts to change
the configuration to eliminate this error only made things worse, I'm
going to ignore this message.

-- 
Greg Wooledge                    | Distributed.NET http://www.distributed.net/
wooledge@kellnet.com             | because a CPU is a terrible thing to waste.
http://www.kellnet.com/wooledge/ |
