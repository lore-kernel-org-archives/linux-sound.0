From: Josh Steiner <jsteiner@antioch-college.edu>
Date: Wed, 07 Apr 1999 03:04:49 +0000
Subject: AWE64g recognized as a SB?
Message-Id: <marc-linux-sound-92345450620485@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I'm running 2.2.3, with SB support compiled as modules.  Why is my Sound
Blaster AWEg isa pnp being recognized only as a SB16? 

Below is my system setup info.  Thanks for any help.

---
Joshua W. H. Steiner - jsteiner@antioch-college.edu - http://joschi.base.org

"Reality is the leading cause of stress among those in touch with it"
   - Jane Wagner



[root@bw66 joschi]# cat /etc/conf.modules
alias eth0 3c509 
alias sound sb
options -k sb io=0x220 irq=5 dma=1 dma16=5

[root@bw66 joschi]# cat /dev/sndstat
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux bw66 2.2.3-5 #4 Thu Apr 1 13:27:54 PST 1999 i686
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:
0: Sound Blaster

[root@bw66 joschi]# /sbin/lsmod 
Module                  Size  Used by
joy-analog              3864   0 
joystick                6912   0  [joy-analog]
isofs                  17096   1  (autoclean)
vmnet                   8844   3 
vmmon                   9996   0  (unused)
vfat                   11304   2  (autoclean)
fat                    23904   2  (autoclean) [vfat]
sb                     31192   3 
uart401                 5588   3  [sb]
sound                  54532   0  [sb uart401]
soundlow                 208   0  [sound]
soundcore               2100   5  [sb sound]

[root@bw66 joschi]# cat /etc/isapnp.conf
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
# Board 1 has serial identifier 40 09 53 7c 8f 9e 00 8c 0e

# (DEBUG)
(READPORT 0x0203)
(ISOLATE)
(IDENTIFY *)

# ANSI string -->Creative SB AWE64 Gold<--

(CONFIGURE CTL009e/156466319 (LD 0
#     ANSI string -->Audio<--
   (INT 0 (IRQ  5 (MODE +E)))
   (DMA 0 (CHANNEL  1))
   (DMA 1 (CHANNEL  5))
   (IO 0 (BASE 0x220))
   (IO 1 (BASE 0x0330))
   (IO 2 (BASE 0x0388))
   (ACT Y)
))

(CONFIGURE CTL009e/156466319 (LD 1
#     ANSI string -->Game<--~
   (IO 0 (BASE 0x0200))
   (ACT Y)
))

(CONFIGURE CTL009e/156466319 (LD 2
#     ANSI string -->WaveTable<--

   (IO 0 (BASE 0x0620))
   (IO 0 (BASE 0x0A20))
   (IO 0 (BASE 0x0E20))
   (ACT Y)
))

# Returns all cards to the "Wait for Key" state
(WAITFORKEY)
