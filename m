From: Mike <cekim@ix.netcom.com>
Date: Sat, 03 Oct 1998 15:07:52 +0000
Subject: Re: How do I use isapnp?
Message-Id: <marc-linux-sound-90742677807362@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90742331706312@msgid-missing>
In-Reply-To: <marc-linux-sound-90742331706312@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have this card running in that I can play and record, but not at the
same time :)

I had some problems with pnpdump on an alpha with the 1.13 version of
isapnptools.  It would find the card, but the resulting file would fail
when I used

./isapnp isapnp.conf

You may or may not have this problem if you are using an intel based
machine, I do not know, but if you do, I recommend the newer version, it
works correctly.

ANYWAY:

The idea of the dumped config file is that it gives you the valid
options and you "uncomment" what you like.  in the end you should have
something like the following "uncommented" (see below for some hints
here):

(DEBUG)
(READPORT 0x0203)
(ISOLATE PRESERVE)
(IDENTIFY *)

#(CONFIGURE OPT0931/18446744073709551615 (LD 0
#     ANSI string -->AUX0<--
#  (ACT Y)
#))

(CONFIGURE OPT0931/18446744073709551615 (LD 1
#     ANSI string -->OPTi Audio 16<--
  (IO 0 (BASE 0x0534))
  (IO 1 (BASE 0x0380))
  (IO 2 (BASE 0x0220))
  (IO 3 (BASE 0x0e0c))
  (INT 0 (IRQ 5 (MODE +E)))
  (DMA 0 (CHANNEL 0))
  (DMA 1 (CHANNEL 1))
  (ACT Y)
))

(CONFIGURE OPT0931/18446744073709551615 (LD 2
#     ANSI string -->Game Port<--
  (IO 0 (BASE 0x0200))
  (ACT Y)
))

(CONFIGURE OPT0931/18446744073709551615 (LD 3
#     ANSI string -->MPU401<--

  (IO 0 (BASE 0x0300))
  (INT 0 (IRQ 9 (MODE +E)))
  (ACT Y)
))
(WAITFORKEY)

HINTS:
I removed much of the commented garbage to save space, I left in a few
things so you can see where you are.  A few notes:

1. I have left the aux device commented on someone's suggestion trying
to solve another of my problems, but as of now it works just as well
with it uncommented.

2. I have chosen a base address of 0x534, a "soundblaster" base address
of 0x220, a an FM synth address of 0x380, and a PNP config address of
0xe0c.

The only must here is the 0x0e0c.  That is hard coded in one of the
drivers.  You are given options for the rest in the various comments of
the isapnpconfig file choose what you need, but these work fine in most
setups.

I have also set this card for an interrupt of 5 and dma 0/1 in this
"-->OPTi Audio 16<--" section, you can use 5,7,9,or 11 I believe and it
will work with the current drivers.  Choose two separate DMAs.  There
are some restrictions here, but if you only use one of the options
pnpdump gives you will be fine.

3. I put the game port at 0x200, no surprises here

4. I put the MPU401 at 0x300 IRQ 9 

I have the (DEBUG) option set, you do not need this, but it helps to
figure out when things are working.  just comment it out when you are
done.

My serial number may/should be different than yours (BTW it was the
serial number that was killing me in the earlier versions of the the
isapnptools - it would not detect it correctly).

The pnpdump basically contains 2 or more copies of "blessed"
configurations as far as the pnp hardware is concerned, it should in
principle work with any of the suggested settings unless you have a
conflict.  Choose only one.

The 1.15 driver has an "auto" mode where it uncomments what it thinks is
best.  This is a nice feature for those who have no clue what theyare
doing at first.  I do not recall the command line at the moment as I had
to hack the command line parsing out to get it work on the alpha
(working on a patch for this as I have time).  

for details on this see:
http://www.roestock.demon.co.uk/isapnptools/

BTW: 0x534 is correct for a base address of 530.  It is 32 bits(4 bytes)
away from the "configure" address.

I hope that helps you get running, so I can ask you a question:

Can you get this card to function in full duplex mode without getting a
recording overrun kernel message?  This is driving me nuts, and I cannot
seem to find anyone who has done this.  

let me know how it goes.

/Mike



Ishaaq Chandy wrote:
> 
> Hi,
> 
> I've been trying to get my PnP OPTi931 card (supposedly Soundblaster Pro
> compatible) to work. Finally I managed to get it working by setting it
> to IO 0x0220, DMA 1, IRQ 7 in DOS and then using Loadlin to load Linux.
> 
> However as the sound quality is awful and I prefer using LILO I am quite
> unsatisfied with this compromise.
> 
> I heard that one can get the card working by using pnpdump, configuring
> its output and lastly using isapnp on the configured output. I tried
> this but pnpdump's output goes way above my head. Can someone help?
> 
> Here is pnpdump's output:
> 
> # $Id: pnpdump.c,v 1.10 1997/07/14 22:30:47 fox Exp $
> # This is free software, see the sources for details.
> # This software has NO WARRANTY, use at your OWN RISK
> #
> # For details of this file format, see isapnp.conf(5)
> #
> # For latest information on isapnp and pnpdump see:
> # http://www.roestock.demon.co.uk/isapnptools/
> #
> # Compiler flags: -DREALTIME -DNEEDSETSCHEDULER
> #
> # Trying port address 0203
> # Board 1 has serial identifier 74 ff ff ff ff 31 09 14 3e
> 
> # (DEBUG)
> (READPORT 0x0203)
> (ISOLATE)
> (IDENTIFY *)
> 
> # Card 1: (serial identifier 74 ff ff ff ff 31 09 14 3e)
> # OPT0931 Serial No -1 [checksum 74]
> # Version 1.0, Vendor version 0.0
> # ANSI string -->OPTi Audio 16<--
> #
> # Logical device id OPTffff
> #
> # Edit the entries below to uncomment out the configuration required.
> # Note that only the first value of any range is given, this may be
> changed if required
> # Don't forget to uncomment the activate (ACT Y) when happy
> 
> (CONFIGURE OPT0931/-1 (LD 0
> #     ANSI string -->AUX0<--
> # (ACT Y)
> ))
> #
> # Logical device id OPT9310
> #
> # Edit the entries below to uncomment out the configuration required.
> # Note that only the first value of any range is given, this may be
> changed if required
> # Don't forget to uncomment the activate (ACT Y) when happy
> 
> (CONFIGURE OPT0931/-1 (LD 1
> #     ANSI string -->OPTi Audio 16<--
> 
> # Multiple choice time, choose one only !
> 
> #     Start dependent functions: priority acceptable
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0534
> #             Maximum IO base address 0x0608
> #             IO base alignment 4 bytes
> #             Number of IO addresses required: 4
> # (IO 0 (BASE 0x0534))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0380
> #             Maximum IO base address 0x03f0
> #             IO base alignment 16 bytes
> #             Number of IO addresses required: 12
> # (IO 1 (BASE 0x0380))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0220
> #             Maximum IO base address 0x0240
> #             IO base alignment 32 bytes
> #             Number of IO addresses required: 16
> # (IO 2 (BASE 0x0220))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0e0c
> #             Maximum IO base address 0x0ffc
> #             IO base alignment 4 bytes
> #             Number of IO addresses required: 4
> # (IO 3 (BASE 0x0e0c))
> #       IRQ 5, 7 or 10.
> #             High true, edge sensitive interrupt (by default)
> # (INT 0 (IRQ 5 (MODE +E)))
> #       First DMA channel 0, 1 or 3.
> #             8 bit DMA only
> #             Logical device is not a bus master
> #             DMA may execute in count by byte mode
> #             DMA may not execute in count by word mode
> #             DMA channel speed type F
> # (DMA 0 (CHANNEL 0))
> #       Next DMA channel 0, 1 or 3.
> #             8 bit DMA only
> #             Logical device is not a bus master
> #             DMA may execute in count by byte mode
> #             DMA may not execute in count by word mode
> #             DMA channel speed type F
> # (DMA 1 (CHANNEL 0))
> 
> #       Start dependent functions: priority acceptable
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0534
> #             Maximum IO base address 0x0ff0
> #             IO base alignment 4 bytes
> #             Number of IO addresses required: 4
> # (IO 0 (BASE 0x0534))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0380
> #             Maximum IO base address 0x03f0
> #             IO base alignment 16 bytes
> #             Number of IO addresses required: 12
> # (IO 1 (BASE 0x0380))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0220
> #             Maximum IO base address 0x0240
> #             IO base alignment 32 bytes
> #             Number of IO addresses required: 16
> # (IO 2 (BASE 0x0220))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0e0c
> #             Maximum IO base address 0x0ffc
> #             IO base alignment 4 bytes
> #             Number of IO addresses required: 4
> # (IO 3 (BASE 0x0e0c))
> #       IRQ 5, 7, 9, 10 or 11.
> #             High true, edge sensitive interrupt (by default)
> # (INT 0 (IRQ 5 (MODE +E)))
> #       First DMA channel 0, 1 or 3.
> #             8 bit DMA only
> #             Logical device is not a bus master
> #             DMA may execute in count by byte mode
> #             DMA may not execute in count by word mode
> #             DMA channel speed type F
> # (DMA 0 (CHANNEL 0))
> #       Next DMA channel 0, 1 or 3.
> #             8 bit DMA only
> #             Logical device is not a bus master
> #             DMA may execute in count by byte mode
> #             DMA may not execute in count by word mode
> #             DMA channel speed type F
> # (DMA 1 (CHANNEL 0))
> 
> #       Start dependent functions: priority acceptable
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0534
> #             Maximum IO base address 0x0ff0
> #             IO base alignment 4 bytes
> #             Number of IO addresses required: 4
> # (IO 0 (BASE 0x0534))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0380
> #             Maximum IO base address 0x03f0
> #             IO base alignment 16 bytes
> #             Number of IO addresses required: 12
> # (IO 1 (BASE 0x0380))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0220
> #             Maximum IO base address 0x0240
> #             IO base alignment 32 bytes
> #             Number of IO addresses required: 16
> # (IO 2 (BASE 0x0220))
> #       Logical device decodes 16 bit IO address lines
> #             Minimum IO base address 0x0e0c
> #             Maximum IO base address 0x0ffc
> #             IO base alignment 4 bytes
> #             Number of IO addresses required: 4
> # (IO 3 (BASE 0x0e0c))
> #       IRQ 5, 7, 9, 10 or 11.
> #             High true, edge sensitive interrupt (by default)
> # (INT 0 (IRQ 5 (MODE +E)))
> #       First DMA channel 0, 1 or 3.
> #             8 bit DMA only
> #             Logical device is not a bus master
> #             DMA may execute in count by byte mode
> #             DMA may not execute in count by word mode
> #             DMA channel speed type F
> # (DMA 0 (CHANNEL 0))
> 
> #     End dependent functions
> # (ACT Y)
> ))
> #
> # Logical device id OPT0001
> #
> # Edit the entries below to uncomment out the configuration required.
> # Note that only the first value of any range is given, this may be
> changed if required
> # Don't forget to uncomment the activate (ACT Y) when happy
> 
> (CONFIGURE OPT0931/-1 (LD 2
> #     ANSI string -->Game Port<--
> #     Logical device decodes 16 bit IO address lines
> #         Minimum IO base address 0x0200
> #         Maximum IO base address 0x020f
> #         IO base alignment 1 bytes
> #         Number of IO addresses required: 1
> # (IO 0 (BASE 0x0200))
> # (ACT Y)
> ))
> #
> # Logical device id OPT0002
> #
> # Edit the entries below to uncomment out the configuration required.
> # Note that only the first value of any range is given, this may be
> changed if required
> # Don't forget to uncomment the activate (ACT Y) when happy
> 
> (CONFIGURE OPT0931/-1 (LD 3
> #     ANSI string -->MPU401<--
> #     Logical device decodes 16 bit IO address lines
> #         Minimum IO base address 0x0300
> #         Maximum IO base address 0x0360
> #         IO base alignment 16 bytes
> #         Number of IO addresses required: 2
> # (IO 0 (BASE 0x0300))
> #     IRQ 5, 7, 9, 10 or 11.
> #         High true, edge sensitive interrupt (by default)
> # (INT 0 (IRQ 5 (MODE +E)))
> # (ACT Y)
> ))
> # End tag... Checksum 0x00 (OK)
> 
> # Returns all cards to the "Wait for Key" state
> (WAITFORKEY)
> 
> I did look at isapnp.conf but that made me even more confused.
> I am using RedHat 5.0 and kernel 2.0.32.
> 
> Sorry for the length of the post but I did'nt know what to cut out. As
> it is I'm not sure I have given all the info needed.
> 
> Thanks
> Ishaaq Chandy
