From: Ishaaq Chandy <kuru@lw1.vsnl.net.in>
Date: Sat, 03 Oct 1998 14:07:18 +0000
Subject: How do I use isapnp?
Message-Id: <marc-linux-sound-90742331706312@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I've been trying to get my PnP OPTi931 card (supposedly Soundblaster Pro
compatible) to work. Finally I managed to get it working by setting it
to IO 0x0220, DMA 1, IRQ 7 in DOS and then using Loadlin to load Linux.

However as the sound quality is awful and I prefer using LILO I am quite
unsatisfied with this compromise.

I heard that one can get the card working by using pnpdump, configuring
its output and lastly using isapnp on the configured output. I tried
this but pnpdump's output goes way above my head. Can someone help?

Here is pnpdump's output:

# $Id: pnpdump.c,v 1.10 1997/07/14 22:30:47 fox Exp $
# This is free software, see the sources for details.
# This software has NO WARRANTY, use at your OWN RISK
#
# For details of this file format, see isapnp.conf(5)
#
# For latest information on isapnp and pnpdump see:
# http://www.roestock.demon.co.uk/isapnptools/
#
# Compiler flags: -DREALTIME -DNEEDSETSCHEDULER
#
# Trying port address 0203
# Board 1 has serial identifier 74 ff ff ff ff 31 09 14 3e

# (DEBUG)
(READPORT 0x0203)
(ISOLATE)
(IDENTIFY *)

# Card 1: (serial identifier 74 ff ff ff ff 31 09 14 3e)
# OPT0931 Serial No -1 [checksum 74]
# Version 1.0, Vendor version 0.0
# ANSI string -->OPTi Audio 16<--
#
# Logical device id OPTffff
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be
changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE OPT0931/-1 (LD 0
#     ANSI string -->AUX0<--
# (ACT Y)
))
#
# Logical device id OPT9310
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be
changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE OPT0931/-1 (LD 1
#     ANSI string -->OPTi Audio 16<--

# Multiple choice time, choose one only !

#     Start dependent functions: priority acceptable
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0534
#             Maximum IO base address 0x0608
#             IO base alignment 4 bytes
#             Number of IO addresses required: 4
# (IO 0 (BASE 0x0534))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0380
#             Maximum IO base address 0x03f0
#             IO base alignment 16 bytes
#             Number of IO addresses required: 12
# (IO 1 (BASE 0x0380))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0240
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 2 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0e0c
#             Maximum IO base address 0x0ffc
#             IO base alignment 4 bytes
#             Number of IO addresses required: 4
# (IO 3 (BASE 0x0e0c))
#       IRQ 5, 7 or 10.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 0, 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed type F
# (DMA 0 (CHANNEL 0))
#       Next DMA channel 0, 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed type F
# (DMA 1 (CHANNEL 0))

#       Start dependent functions: priority acceptable
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0534
#             Maximum IO base address 0x0ff0
#             IO base alignment 4 bytes
#             Number of IO addresses required: 4
# (IO 0 (BASE 0x0534))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0380
#             Maximum IO base address 0x03f0
#             IO base alignment 16 bytes
#             Number of IO addresses required: 12
# (IO 1 (BASE 0x0380))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0240
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 2 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0e0c
#             Maximum IO base address 0x0ffc
#             IO base alignment 4 bytes
#             Number of IO addresses required: 4
# (IO 3 (BASE 0x0e0c))
#       IRQ 5, 7, 9, 10 or 11.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 0, 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed type F
# (DMA 0 (CHANNEL 0))
#       Next DMA channel 0, 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed type F
# (DMA 1 (CHANNEL 0))

#       Start dependent functions: priority acceptable
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0534
#             Maximum IO base address 0x0ff0
#             IO base alignment 4 bytes
#             Number of IO addresses required: 4
# (IO 0 (BASE 0x0534))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0380
#             Maximum IO base address 0x03f0
#             IO base alignment 16 bytes
#             Number of IO addresses required: 12
# (IO 1 (BASE 0x0380))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0240
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 2 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0e0c
#             Maximum IO base address 0x0ffc
#             IO base alignment 4 bytes
#             Number of IO addresses required: 4
# (IO 3 (BASE 0x0e0c))
#       IRQ 5, 7, 9, 10 or 11.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 0, 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed type F
# (DMA 0 (CHANNEL 0))

#     End dependent functions
# (ACT Y)
))
#
# Logical device id OPT0001
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be
changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE OPT0931/-1 (LD 2
#     ANSI string -->Game Port<--
#     Logical device decodes 16 bit IO address lines
#         Minimum IO base address 0x0200
#         Maximum IO base address 0x020f
#         IO base alignment 1 bytes
#         Number of IO addresses required: 1
# (IO 0 (BASE 0x0200))
# (ACT Y)
))
#
# Logical device id OPT0002
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be
changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE OPT0931/-1 (LD 3
#     ANSI string -->MPU401<--
#     Logical device decodes 16 bit IO address lines
#         Minimum IO base address 0x0300
#         Maximum IO base address 0x0360
#         IO base alignment 16 bytes
#         Number of IO addresses required: 2
# (IO 0 (BASE 0x0300))
#     IRQ 5, 7, 9, 10 or 11.
#         High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
# (ACT Y)
))
# End tag... Checksum 0x00 (OK)

# Returns all cards to the "Wait for Key" state
(WAITFORKEY)


I did look at isapnp.conf but that made me even more confused.
I am using RedHat 5.0 and kernel 2.0.32.

Sorry for the length of the post but I did'nt know what to cut out. As
it is I'm not sure I have given all the info needed.

Thanks
Ishaaq Chandy
