From: "Soulier, Frederic" <Frederic.P.Soulier@British-Airways.com>
Date: Fri, 04 Jun 1999 10:15:16 +0000
Subject: AWE64 ISA PnP Midi pbm
Message-Id: <marc-linux-sound-92849263911788@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Paco wrote:
>Hi Frederic
>Could you please send me a copy of your /etc/isapnp.conf?  There may be
>some info missing from there.
>
>The AWE64 has a hardware bug that causes it to not report all of the
>necessary isapnp information.  In particular, the wave table of the AWE64
>doesn't get initialized properly.
>-Paco

Here is my /etc/isapnp.conf
If you do not get it correctly I can try to send it as an attachment.

# $Id: pnpdump.c,v 1.17 1998/11/10 22:45:04 fox Exp $
# This is free software, see the sources for details.
# This software has NO WARRANTY, use at your OWN RISK
#
# For details of this file format, see isapnp.conf(5)
#
# For latest information on isapnp and pnpdump see:
# http://www.roestock.demon.co.uk/isapnptools/
#
# Compiler flags: -DREALTIME -DNEEDSETSCHEDULER -DABORT_ONRESERR
#
# Trying port address 0203
# Board 1 has serial identifier b0 1f 81 7f 99 c7 00 8c 0e

# (DEBUG)
(READPORT 0x0203)
(ISOLATE PRESERVE)
(IDENTIFY *)
(VERBOSITY 2)
(CONFLICT (IO FATAL)(IRQ FATAL)(DMA FATAL)(MEM FATAL)) # or WARNING

# Card 1: (serial identifier b0 1f 81 7f 99 c7 00 8c 0e)
# Vendor Id CTL00c7, Serial Number 528580505, checksum 0xB0.
# Version 1.0, Vendor version 1.0
# ANSI string -->Creative AWE64 PnP<--
# Vendor defined tag:  73 02 45 02
#
# Logical device id CTL0045
#     Device supports vendor reserved register @ 0x3a
#     Device supports vendor reserved register @ 0x3d
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE CTL00c7/528580505 (LD 0
#     ANSI string -->Audio<--

# Multiple choice time, choose one only !

#     Start dependent functions: priority preferred
#       IRQ 7.
#             High true, edge sensitive interrupt (by default)
(INT 0 (IRQ 7 (MODE +E)))
#       First DMA channel 1.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
(DMA 0 (CHANNEL 1))
#       Next DMA channel 5.
#             16 bit DMA only
#             Logical device is not a bus master
#             DMA may not execute in count by byte mode
#             DMA may execute in count by word mode
#             DMA channel speed in compatible mode
(DMA 1 (CHANNEL 5))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0220
#             IO base alignment 1 bytes
#             Number of IO addresses required: 16
(IO 0 (SIZE 16) (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0330
#             Maximum IO base address 0x0330
#             IO base alignment 1 bytes
#             Number of IO addresses required: 2
(IO 1 (SIZE 2) (BASE 0x0330))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0388
#             Maximum IO base address 0x0388
#             IO base alignment 1 bytes
#             Number of IO addresses required: 4
(IO 2 (SIZE 4) (BASE 0x0388))
#     End dependent functions
 (NAME "CTL00c7/528580505[0]{Audio               }")
(ACT Y)))
#
# Logical device id CTL0022
#     Device supports vendor reserved register @ 0x3a
#     Device supports vendor reserved register @ 0x3d
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE CTL00c7/528580505 (LD 2
#     ANSI string -->WaveTable<--

# Multiple choice time, choose one only !

#     Start dependent functions: priority preferred
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0620
#             Maximum IO base address 0x0620
#             IO base alignment 1 bytes
#             Number of IO addresses required: 4
(IO 0 (SIZE 4) (BASE 0x0620))

#       Start dependent functions: priority acceptable
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0620
#             Maximum IO base address 0x0680
#             IO base alignment 32 bytes
#             Number of IO addresses required: 4
(IO 1 (SIZE 4) (BASE 0x0A20))

#       Start dependent functions: priority acceptable
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0620
#             Maximum IO base address 0x0680
#             IO base alignment 32 bytes
#             Number of IO addresses required: 4
(IO 2 (SIZE 4) (BASE 0x0E20))

#     End dependent functions
#     Vendor defined tag:  75 01 03 46 ca 8a
 (NAME "CTL00c7/528580505[2]{WaveTable           }")
(ACT Y)))
# End tag... Checksum 0x00 (OK)

# Returns all cards to the "Wait for Key" state
(WAITFORKEY)


Ciao
Fred
