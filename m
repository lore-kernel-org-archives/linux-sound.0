From: Jeremy Schneider <Jeremy_Schneider@iname.com>
Date: Thu, 07 Jan 1999 18:00:53 +0000
Subject: problem configuring PAS16 and RedHat 5.2 w/ modular sound
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------71D903D98AFB9F8A7CC42593"
Message-Id: <marc-linux-sound-91583727426355@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------71D903D98AFB9F8A7CC42593
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi.  I hope some of you can help me with this.  I have spent a lot of
time reading the howtos, searching dejanews, doing trial an error to get
as far as I have, but I think that now I need some more help, please,
hopefully from someone who has fixed a similar problem in the past.  I
just joined the list yesterday.  If there is some FAQ I should have read
first, I apologize -- please point me at it.

I'm having problems setting up a Pro Audio Spectrum 16 with RedHat 5.2.
I seem to have it partially set up, because after I use sndconfig to set
up the parameters, the sound sample ("Hello, this is Linux Torvalds, and
I pronounce Linux, 'Linux'") does play correctly, with no error
messages.  I can cat the file to /dev/audio, and it works fine.   But
when I use a program (xaudio, x11amp, tk3play, it doesn't matter which)
to play mp3's, I get extremely scratchy sound, and I get messages
saying, "Sound: DMA (output) timed out - IRQ/DRQ config error?"  I don't
doubt that I have a config error, but I'm having trouble tracking down
the conflict.  Several times, I have gone into DOS (DRDOS, actually --
NO MS on this machine!) and used the install program that came with the
sound card to change the parameters, and then used redhat's sndconfig to
match those parameters.  I have tried a few different available
configurations, but I always get the same thing: very scratchy sound and
that error message.  Here are the IRQ, DMA settings I have tried:
I/O port, IRQ, DMA:
220, 7, 1
220, 3, 3
220, 7, 0
220, 3, 0

I am not enabling the SB compatibility of the sound card, so I guess I'm
attempting to use the card's native capabilities.  Also not enabling the
MPU401.  I'm only using the card for the D-A capability.  I have use the
aumix program to put all other inputs down to 0%, using only the DSP set
at about 70% volume.  The sound sample from sndconfig sounds fine at
that level.  Clear, with not too much background hiss.  When playing an
mp3, the music is clearly audible below the scratchiness -- it's not
distorted.  It's not the same wild distortion that you get when you cat
a .au file into /dev/dsp.

Here is my machine configuration: Dell Omniplex 590.  90 MHz Pentium, 16
Meg ram, two ide hard drives, 3Com etherlink III on IRQ 5 (I still get
the same problem when I remove that card).  Running the stock kernel of
5.2 as it came on my CD from LinuxCentral (2.0.36), which is, if I
recall correctly, actually a pre-release, version 2.0.36-0.7.

Attached is a typescript of some more configuration information, and my
latest /var/log/messages file.

Any help you can provide that would point me in the right direction for
resolving this configuration issue would be greatly appreciated.  I
really want to attach this system to my stereo, convert all my CDs to
mp3, and listen to my music...

Sincerely,
--
Jeremy Schneider
jeremy_schneider@iname.com


--------------71D903D98AFB9F8A7CC42593
Content-Type: text/plain; charset=us-ascii;
 name="typesc~1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="typesc~1"

Script started on Thu Jan  7 12:39:20 1999
[root@p90 /dev]# cat /dev/sndstat
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux p90.jnet 2.0.36 #1 Tue Oct 13 22:17:11 EDT 1998 i586
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Pro Audio Spectrum

Synth devices:

Midi devices:
0: Pro Audio Spectrum

Timers:
0: System clock

Mixers:
0: Pro Audio Spectrum 16
[root@p90 /dev]# cat /proc/dma
 3: PAS16
 4: cascade
[root@p90 /dev]# cat /proc/interrupts 
 0:     200766   timer
 1:       1918   keyboard
 2:          0   cascade
 3:        138   PAS16
 5:          6   3c509
 8:          1 + rtc
12:        105   PS/2 Mouse
13:          1   math error
14:     117911 + ide0
15:         14 + ncr53c8xx
[root@p90 /dev]# cat /proc/ioports 
0000-001f : dma1
0020-003f : pic1
0040-005f : timer
0060-006f : keyboard
0070-007f : rtc
0080-009f : dma page reg
00a0-00bf : pic2
00c0-00df : dma2
00f0-00ff : npu
01f0-01f7 : ide0
03c0-03df : vga+
03f0-03f5 : floppy
03f6-03f6 : ide0
03f7-03f7 : floppy DIR
3000-300f : 3c509
ff00-ff7f : ncr53c8xx
[root@p90 /dev]# cat /proc/pci
PCI devices found:
  Bus  0, device  15, function  0:
    Non-VGA device: NCR 53c810 (rev 1).
      Medium devsel.  IRQ 15.  Master Capable.  Latency=64.  
      I/O at 0xff00.
      Non-prefetchable 32 bit memory at 0x3effff00.
  Bus  0, device  11, function  0:
    Non-VGA device: Intel 82375EB (rev 3).
      Medium devsel.  Master Capable.  Latency=248.  
  Bus  0, device   4, function  0:
    VGA compatible controller: ATI 68800AX (rev 2).
      Medium devsel.  IRQ 9.  
      Non-prefetchable 32 bit memory at 0x40000000.
  Bus  0, device   0, function  0:
    Host bridge: Intel 82434LX Mercury/Neptune (rev 3).
      Slow devsel.  Master Capable.  Latency=16.  
[root@p90 /dev]# cat /proc/stat
cpu  5703 0 3549 200341
disk 2912 2942 0 0
disk_rio 2181 2687 0 0
disk_wio 731 255 0 0
disk_rblk 4342 5374 0 0
disk_wblk 1474 510 0 0
page 40479 19750
swap 2 3
intr 329803 209593 2014 0 138 0 6 2 0 1 0 0 0 105 1 117929 14
ctxt 16659
btime 915728790
processes 456
Character devices:
 1 mem
 2 pty
 3 ttyp
 4 ttyp
 5 cua
 7 vcs
10 misc
14 sound

Block devices:
 1 ramdisk
 2 fd
 3 ide0
 9 md
[root@p90 /dev]# exit

Script done on Thu Jan  7 12:41:44 1999

--------------71D903D98AFB9F8A7CC42593
Content-Type: text/plain; charset=us-ascii;
 name="messages"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="messages"

Jan  7 12:07:40 p90 syslogd 1.3-3: restart.
Jan  7 12:07:41 p90 kernel: klogd 1.3-3, log source = /proc/kmsg started.
Jan  7 12:07:42 p90 kernel: Loaded 4253 symbols from /boot/System.map.
Jan  7 12:07:42 p90 kernel: Symbols match kernel version 2.0.36.
Jan  7 12:07:42 p90 kernel: Loaded 219 symbols from 13 modules.
Jan  7 12:07:42 p90 kernel: Memory: sized by int13 0e801h
Jan  7 12:07:42 p90 kernel: Console: 16 point font, 400 scans
Jan  7 12:07:42 p90 kernel: Console: colour VGA+ 80x25, 1 virtual console (max 63)
Jan  7 12:07:42 p90 kernel: pcibios_init : BIOS32 Service Directory structure at 0x000ffe80
Jan  7 12:07:42 p90 kernel: pcibios_init : BIOS32 Service Directory entry at 0xffe90
Jan  7 12:07:42 p90 kernel: pcibios_init : PCI BIOS revision 2.00 entry at 0xfcabc
Jan  7 12:07:42 p90 kernel: Probing PCI hardware.
Jan  7 12:07:42 p90 kernel: Calibrating delay loop.. ok - 35.94 BogoMIPS
Jan  7 12:07:42 p90 kernel: Memory: 14472k/16384k available (748k kernel code, 384k reserved, 588k data)
Jan  7 12:07:42 p90 kernel: Swansea University Computer Society NET3.035 for Linux 2.0
Jan  7 12:07:42 p90 kernel: NET3: Unix domain sockets 0.13 for Linux NET3.035.
Jan  7 12:07:42 p90 kernel: Swansea University Computer Society TCP/IP for NET3.034
Jan  7 12:07:42 p90 kernel: IP Protocols: IGMP, ICMP, UDP, TCP
Jan  7 12:07:42 p90 kernel: Linux IP multicast router 0.07.
Jan  7 12:07:42 p90 kernel: VFS: Diskquotas version dquot_5.6.0 initialized
Jan  7 12:07:42 p90 kernel: 
Jan  7 12:07:42 p90 kernel: Checking 386/387 coupling... Hmm, FDIV bug i586 system
Jan  7 12:07:42 p90 kernel: Checking 'hlt' instruction... Ok.
Jan  7 12:07:42 p90 kernel: Intel Pentium with F0 0F bug - workaround enabled.
Jan  7 12:07:42 p90 kernel: alias mapping IDT readonly ...  ... done
Jan  7 12:07:42 p90 kernel: Linux version 2.0.36 (root@porky.redhat.com) (gcc version 2.7.2.3) #1 Tue Oct 13 22:17:11 EDT 1998
Jan  7 12:07:42 p90 kernel: Starting kswapd v 1.4.2.2 
Jan  7 12:07:42 p90 kernel: Serial driver version 4.13 with no serial options enabled
Jan  7 12:07:42 p90 kernel: PS/2 auxiliary pointing device detected -- driver installed.
Jan  7 12:07:42 p90 kernel: Real Time Clock Driver v1.09
Jan  7 12:07:42 p90 kernel: Ramdisk driver initialized : 16 ramdisks of 4096K size
Jan  7 12:07:42 p90 kernel: hda: WDC AC1270F, 257MB w/64kB Cache, CHS=917/12/48
Jan  7 12:07:42 p90 kernel: hdb: Maxtor 90680D4, 6485MB w/256kB Cache, CHS=13176/16/63
Jan  7 12:07:42 p90 kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Jan  7 12:07:42 p90 kernel: Floppy drive(s): fd0 is 1.44M, fd1 is 1.2M
Jan  7 12:07:42 p90 kernel: FDC 0 is a National Semiconductor PC87306
Jan  7 12:07:42 p90 kernel: md driver 0.36.3 MAX_MD_DEV=4, MAX_REAL=8
Jan  7 12:07:42 p90 kernel: scsi : 0 hosts.
Jan  7 12:07:42 p90 kernel: scsi : detected total.
Jan  7 12:07:42 p90 kernel: Partition check:
Jan  7 12:07:42 p90 kernel:  hda: hda1 < hda5 hda6 hda7 > hda2
Jan  7 12:07:42 p90 kernel:  hdb: [EZD] [remap 0->1] [826/255/63] hdb1 hdb2
Jan  7 12:07:42 p90 kernel: RAMDISK: Compressed image found at block 0
Jan  7 12:07:42 p90 kernel: VFS: Mounted root (ext2 filesystem).
Jan  7 12:07:42 p90 kernel: ncr53c8xx: at PCI bus 0, device 15, function 0
Jan  7 12:07:42 p90 kernel: ncr53c8xx: 53c810 detected 
Jan  7 12:07:42 p90 kernel: ncr53c810-0: rev=0x01, base=0x3effff00, io_port=0xff00, irq=15
Jan  7 12:07:42 p90 kernel: ncr53c810-0: ID 7, Fast-10, Parity Checking
Jan  7 12:07:42 p90 kernel: ncr53c810-0: restart (scsi reset).
Jan  7 12:07:42 p90 kernel: scsi0 : ncr53c8xx - revision 2.5f.1
Jan  7 12:07:42 p90 kernel: scsi : 1 host.
Jan  7 12:07:42 p90 kernel: VFS: Mounted root (ext2 filesystem) readonly.
Jan  7 12:07:42 p90 kernel: Trying to unmount old root ... okay
Jan  7 12:07:42 p90 kernel: Adding Swap: 51236k swap-space (priority -1)
Jan  7 12:07:42 p90 kernel: Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
Jan  7 12:07:42 p90 kernel: Pro Audio Spectrum driver Copyright (C) by Hannu Savolainen 1993-1996
Jan  7 12:07:42 p90 kernel: sysctl: ip forwarding off
Jan  7 12:07:42 p90 kernel: Swansea University Computer Society IPX 0.34 for NET3.035
Jan  7 12:07:42 p90 kernel: IPX Portions Copyright (c) 1995 Caldera, Inc.
Jan  7 12:07:42 p90 kernel: Appletalk 0.17 for Linux NET3.035
Jan  7 12:07:42 p90 kernel: eth0: 3c509 at 0x3000 tag 0, 10baseT port, address  00 20 af 3c e4 0c, IRQ 5.
Jan  7 12:07:42 p90 kernel: 3c509.c:1.16 2/3/98 becker@cesdis.gsfc.nasa.gov
Jan  7 12:07:42 p90 kernel: eth0: Setting Rx mode to 1 addresses.
Jan  7 12:08:11 p90 PAM_pwdb[363]: (login) session opened for user root by (uid=0)
Jan  7 12:08:11 p90 login[363]: ROOT LOGIN ON tty1
Jan  7 12:08:11 p90 PAM_pwdb[363]: (login) session closed for user root
Jan  7 12:09:25 p90 kernel: Sound: DMA (output) timed out - IRQ/DRQ config error?
Jan  7 12:11:11 p90 PAM_pwdb[364]: (login) session opened for user root by (uid=0)
Jan  7 12:11:11 p90 login[364]: ROOT LOGIN ON tty2
Jan  7 12:11:11 p90 PAM_pwdb[364]: (login) session closed for user root

--------------71D903D98AFB9F8A7CC42593--
