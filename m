From: Bill Schoolcraft <Bill@wiliweld.com>
Date: Wed, 12 May 1999 03:28:30 +0000
Subject: Edit /etc/isapnp.conf ?
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------49EFB5D6F7AB381FA2B614C8"
Message-Id: <marc-linux-sound-92651509718123@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------49EFB5D6F7AB381FA2B614C8
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello "Family",

	Having done viewed my first output from isapnp.conf, I am confused as
to how many lines to "uncomment" in the enclosed file.

	The sound card works fine for Win95 shares this hard drive and 
reveals IRQ=5, DMA=01 & 05, IO RANGE=0220-022F, IO RANGE=0330-0331, IO
RANGE=0388-038B

	I've put this off for quite a while to concentrate on the networking
of the other 2 Linux boxes on my home LAN, but some of the Windows-95
guys at work today were giving my the business on LINUX  saying that
it doesn't support sound, so here I am. :)
-- 


	         " ne cede malis sed contra audientor ito "

	                  ___ Linux  Anthem ___
         	        
                 Bill Schoolcraft    http://www.wiliweld.com
--------------49EFB5D6F7AB381FA2B614C8
Content-Type: text/plain; charset=us-ascii; name="isapnp.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="isapnp.conf"

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
# Board 1 has serial identifier e5 ff ff ff ff 70 00 8c 0e

# (DEBUG)
(READPORT 0x0203)
(ISOLATE)
(IDENTIFY *)

# Card 1: (serial identifier e5 ff ff ff ff 70 00 8c 0e)
# CTL0070 Serial No -1 [checksum e5]
# Version 1.0, Vendor version 1.0
# ANSI string -->Creative ViBRA16C PnP<--
#
# Logical device id CTL0001
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE CTL0070/-1 (LD 0
#     ANSI string -->Audio<--

# Multiple choice time, choose one only !

#     Start dependent functions: priority preferred
#       IRQ 5.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 1.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 0 (CHANNEL 1))
#       Next DMA channel 5.
#             16 bit DMA only
#             Logical device is not a bus master
#             DMA may not execute in count by byte mode
#             DMA may execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 1 (CHANNEL 5))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0220
#             IO base alignment 1 bytes
#             Number of IO addresses required: 16
# (IO 0 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0330
#             Maximum IO base address 0x0330
#             IO base alignment 1 bytes
#             Number of IO addresses required: 2
# (IO 1 (BASE 0x0330))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0388
#             Maximum IO base address 0x0388
#             IO base alignment 1 bytes
#             Number of IO addresses required: 4
# (IO 2 (BASE 0x0388))

#       Start dependent functions: priority acceptable
#       IRQ 5, 7, 9 or 10.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 0 (CHANNEL 1))
#       Next DMA channel 5 or 7.
#             16 bit DMA only
#             Logical device is not a bus master
#             DMA may not execute in count by byte mode
#             DMA may execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 1 (CHANNEL 5))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0280
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 0 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0300
#             Maximum IO base address 0x0330
#             IO base alignment 48 bytes
#             Number of IO addresses required: 2
# (IO 1 (BASE 0x0300))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0388
#             Maximum IO base address 0x0388
#             IO base alignment 1 bytes
#             Number of IO addresses required: 4
# (IO 2 (BASE 0x0388))

#       Start dependent functions: priority acceptable
#       IRQ 5, 7, 9 or 10.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 0 (CHANNEL 1))
#       Next DMA channel 5 or 7.
#             16 bit DMA only
#             Logical device is not a bus master
#             DMA may not execute in count by byte mode
#             DMA may execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 1 (CHANNEL 5))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0280
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 0 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0300
#             Maximum IO base address 0x0330
#             IO base alignment 48 bytes
#             Number of IO addresses required: 2
# (IO 1 (BASE 0x0300))

#       Start dependent functions: priority functional
#       IRQ 5, 7, 9 or 10.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 0 (CHANNEL 1))
#       Next DMA channel 5 or 7.
#             16 bit DMA only
#             Logical device is not a bus master
#             DMA may not execute in count by byte mode
#             DMA may execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 1 (CHANNEL 5))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0280
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 0 (BASE 0x0220))

#       Start dependent functions: priority functional
#       IRQ 5, 7, 9 or 10.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 0 (CHANNEL 1))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0280
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 0 (BASE 0x0220))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0300
#             Maximum IO base address 0x0330
#             IO base alignment 48 bytes
#             Number of IO addresses required: 2
# (IO 1 (BASE 0x0300))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0388
#             Maximum IO base address 0x0388
#             IO base alignment 1 bytes
#             Number of IO addresses required: 4
# (IO 2 (BASE 0x0388))

#       Start dependent functions: priority functional
#       IRQ 5, 7, 9 or 10.
#             High true, edge sensitive interrupt (by default)
# (INT 0 (IRQ 5 (MODE +E)))
#       First DMA channel 1 or 3.
#             8 bit DMA only
#             Logical device is not a bus master
#             DMA may execute in count by byte mode
#             DMA may not execute in count by word mode
#             DMA channel speed in compatible mode
# (DMA 0 (CHANNEL 1))
#       Logical device decodes 16 bit IO address lines
#             Minimum IO base address 0x0220
#             Maximum IO base address 0x0280
#             IO base alignment 32 bytes
#             Number of IO addresses required: 16
# (IO 0 (BASE 0x0220))

#     End dependent functions
# (ACT Y)
))
#
# Logical device id CTL7001
#
# Edit the entries below to uncomment out the configuration required.
# Note that only the first value of any range is given, this may be changed if required
# Don't forget to uncomment the activate (ACT Y) when happy

(CONFIGURE CTL0070/-1 (LD 1
#     Compatible device id PNPb02f
#     ANSI string -->Game<--
#     Logical device decodes 16 bit IO address lines
#         Minimum IO base address 0x0200
#         Maximum IO base address 0x0200
#         IO base alignment 1 bytes
#         Number of IO addresses required: 8
# (IO 0 (BASE 0x0200))
# (ACT Y)
))
# End tag... Checksum 0x00 (OK)

# Returns all cards to the "Wait for Key" state
(WAITFORKEY)

--------------49EFB5D6F7AB381FA2B614C8--
