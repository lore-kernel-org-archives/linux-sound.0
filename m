From: Yao Wang <ywangz@eecs.umich.edu>
Date: Wed, 19 Jan 2000 01:13:30 +0000
Subject: sound blaster 16 config
Message-Id: <marc-linux-sound-94826594212109@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi:

I am running 2.2.5-22 from RH 6.0 with a sound blaster 16 card with 
base_addr=0x220, IRQ=5, 8-bit DMA=1 and 16-bit DMA=5 (uncommenting 
a few lines in the pnpdump output. After running isapnp on this config
file, the sound-modules appeared loaded after rebooting.
# lsmod
Module                  Size  Used by
sound                  58392   0  (autoclean) (unused)
soundlow                 300   0  (autoclean) [sound]
soundcore               2404   3  (autoclean) [sound]
autofs                  9188   1  (autoclean)
nfs                    30072  14  (autoclean)
nfsd                  151576   8  (autoclean)
lockd                  31208   1  (autoclean) [nfs nfsd]
sunrpc                 52420   1  (autoclean) [nfs nfsd lockd]
via-rhine               9024   1  (autoclean)
nls_iso8859-1           2020   1  (autoclean)
nls_cp437               3548   1  (autoclean)
vfat                   11420   1  (autoclean)
fat                    25344   1  (autoclean) [vfat]          

# cat /proc/devices
Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
  7 vcs
 10 misc
 14 sound
 21 sg
 29 fb
 36 netlink
128 ptm
136 pts

Block devices:
  1 ramdisk
  2 fd
  3 ide0
  8 sd
  9 md
 11 sr
 22 ide1            

But:
#cat /dev/sndstat
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux lion 2.2.5-22 #3 Thu Jan 13 17:50:55 EST
2000 i686
Config options: 0

Installed drivers:

Card config:

Audio devices:

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:                             

I could not play music to it and was wondering about some info on
sound config with 2.2.x (sound + soundcore + soundlow)? Am i running
something new on an rather old hardware?

more info:
# isapnp /etc/isapnp.conf
Board 1 has Identity e5 ff ff ff ff 70 00 8c 0e:  CTL0070 Serial No -1
[checksum e5]

could someone give me any hint?


Thanks a lot.
