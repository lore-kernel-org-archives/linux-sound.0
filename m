From: Greg Wooledge <wooledge@kellnet.com>
Date: Fri, 08 Jan 1999 03:27:19 +0000
Subject: 2.2.0-pre5 SB16 problem: /dev/dsp does not work (DMA problem?)
Message-Id: <marc-linux-sound-91586554603717@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Not sure where to send this.  This is only my second kernel bug report
ever.  Go easy on me, ok? :-)

I've searched the mailing list archives and noticed that this problem
has been reported for quite some time.  But I didn't see any satisfactory
answers.

I'm running 2.2.0-pre5 on a K6-2 system, with a Soundblaster ViBRA16
(Plug and Play).  See techy details at the end of this message.

I can play *.au files ("Hello, this is Linus Torvalds...") to /dev/audio
with no problem.

But whenever I try to write data to /dev/dsp (e.g., to play an MP3) I
get no sound output.  dmesg shows the line:

Sound: DMA (output) timed out - IRQ/DRQ config error?

which appears over and over until I interrupt the process writing to
/dev/dsp.

This is also my first real experience with PnP.  At first I thought I must
have done something wrong with isapnp, but I get identical results with
every combination I've tried.  (I also got the same results with 2.1.132.)

I have not yet tried sound under a 2.0 kernel on this system, but I do
get sounds with many games under Win98 (ulch) installed on this system.
I don't know which of them are 8-bit vs. 16-bit, but all evidence so
far indicates that the card works.

I get the same behavior with the distributed.net RC5DES client running
or not running (SIGSTOP'ed).  There are no other resource-intensive
processes running during this testing.

OK, here's the fun stuff....

jekyll# dmesg
Linux version 2.2.0-pre5 (root@jekyll) (gcc version 2.7.2.3) #2 Thu Jan 7 20:57:58 EST 1999
Detected 333112313 Hz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 665.19 BogoMIPS
Memory: 63544k/65536k available (588k kernel code, 412k reserved, 960k data, 32k init)
CPU: AMD AMD-K6(tm) 3D processor
Checking 386/387 coupling... OK, FPU using exception 16 error reporting.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
PCI: PCI BIOS revision 2.10 entry at 0xfb3d0
PCI: Using configuration type 1
PCI: Probing PCI hardware
PCI: 00:38 [1106/0586]: Work around ISA DMA hangs (00)
Activating ISA DMA hang workarounds.
[...]
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
SB 4.16 detected OK (220)
Sound: DMA (output) timed out - IRQ/DRQ config error?
Sound: DMA (output) timed out - IRQ/DRQ config error?
[...]

jekyll# grep -v '^#' /etc/isapnp.conf 
[...]
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
[...]

jekyll# cat /etc/conf.modules
[...]
alias eth0 ne
alias sound sb
alias midi opl3
options ne io=0x6c00 irq=9
options opl3 io=0x388 
options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330 
[...]

jekyll# lsmod
Module                  Size  Used by
sb                     27700   0  (autoclean)
uart401                 5588   0  (autoclean) [sb]
sound                  55300   0  (autoclean) [sb uart401]
soundcore               2084   6  (autoclean) [sb sound]
[...]

jekyll# cat /proc/sound
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux jekyll 2.2.0-pre5 #2 Thu Jan 7 20:57:58 EST 1999 i586
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster

jekyll# cat /proc/interrupts 
           CPU0       
  0:     212887          XT-PIC  timer
  1:       8195          XT-PIC  keyboard
  2:          0          XT-PIC  cascade
  5:         23          XT-PIC  soundblaster
  9:       7809          XT-PIC  NE2000
 12:      46547          XT-PIC  PS/2 Mouse
 13:          1          XT-PIC  fpu
 14:       6105          XT-PIC  ide0
NMI:          0

jekyll# cat /proc/dma 
 1: SoundBlaster8
 4: cascade
 5: SoundBlaster16

jekyll# cat /proc/ioports 
0000-001f : dma1
0020-003f : pic1
0040-005f : timer
0060-006f : keyboard
0080-008f : dma page reg
00a0-00bf : pic2
00c0-00df : dma2
00f0-00ff : fpu
01f0-01f7 : ide0
0220-022f : soundblaster
02f8-02ff : serial(set)
0330-0333 : MPU-401 UART
03c0-03df : vga+
03f6-03f6 : ide0
03f8-03ff : serial(set)
6400-6407 : ide0
6408-640f : ide1
6c00-6c1f : NE2000

$ strace mpg123 02-Cruel.mp3
[...]
open("/dev/dsp", O_WRONLY)              = 4
ioctl(4, SNDCTL_DSP_GETBLKSIZE, 0x8068df8) = 0
ioctl(4, SNDCTL_DSP_RESET, 0)           = 0
ioctl(4, SNDCTL_DSP_SETFMT, 0xbffff828) = 0
ioctl(4, SNDCTL_DSP_STEREO, 0xbffff824) = 0
ioctl(4, SNDCTL_DSP_SPEED, 0xbffff820)  = 0
close(4)                                = 0
open("/dev/dsp", O_WRONLY)              = 4
ioctl(4, SNDCTL_DSP_GETBLKSIZE, 0x8068df8) = 0
ioctl(4, SNDCTL_DSP_RESET, 0)           = 0
ioctl(4, SNDCTL_DSP_SETFMT, 0xbffff92c) = 0
ioctl(4, SNDCTL_DSP_STEREO, 0xbffff928) = 0
ioctl(4, SNDCTL_DSP_SPEED, 0xbffff924)  = 0
write(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 16384) = 16384
write(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 16384) = 16384
write(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 16384) = 16384
write(4, "7\0\364\377/\0\322\377)\0\336\377"..., 16384) = 16384
write(4, "t\0\373\377q\0\324\377\203\0\361"..., 16384 <unfinished ...>

jekyll# modprobe --version
modprobe (Linux modutils) 2.1.121
[...]

jekyll# cat /etc/debian_version 
2.1

(As you can see) I can provide lots and lots of details if anyone needs
them... just ask.

-- 
Greg Wooledge                    | Distributed.NET http://www.distributed.net/
wooledge@kellnet.com             | because a CPU is a terrible thing to waste.
http://www.kellnet.com/wooledge/ |
