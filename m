From: Kyle Christensen <mute@snip.net>
Date: Thu, 16 Dec 1999 18:16:06 +0000
Subject: SB64 + Tyan s1837DLUN-BX Problems
Message-Id: <marc-linux-sound-94536959722572@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I recently purchased a new motherboard, and have been running into a
problem with my older soundcard.
Before i get started, here's some info about my computer:

Tyan s1837DLUN-BX Thunderbolt 100 (Onboard Ethernet, Dual Onboard
Scsi,Dual Proc's)
AWE64 Gold sndcard IO"0 irq=5 dma=1 dma16=5

Running redhat linux 6.1 and kernel 2.2.13.

Up until i put in my new motherboard, i had been using the oss sound
modules for 100% soundblaster compatible w/ no problems.

After i installed my new motherboard, and turned OFF 'PnP Aware OS' in
my bios, i tried booting my old kernel and got this error:

Dec 14 19:32:00 irc kernel: sb: Interrupt test on IRQ5 failed - Probable
IRQ conflict
Dec 14 19:32:00 irc kernel: <Sound Blaster 16 (4.16)> at 0x220 irq 5 dma
1,5

So i boot to windows, and it detect's my soundcard on the settings i
specified in the kernel, with _no_ conflicts.

I recompiled 2.2.13 w/ modular sound and tried:

modprobe sound
insmod uart401
insmod sb io=0x220 irq=5 dma=1 dma16=5

and got the same "Probable IRQ Conflict"

So i recompiled the kernel w/o any sound, and downloaded OSS from
www.opensound.com

It autodetected my soundcard fine, on the settings i thought it would,
and upon running 'soundon' my card worked properly.

So at this point i was reasonably certain there was no problem with the
settings i was giving it.

I even went so far as to force the single ISA slot i have on my
motherboard to use irq 5, dma 1 and 5 from the bios, to no avail.


Here is the output of my cat'ing /proc/interrupts and /dev/sndstat
*while using external OSS*

/proc/interrupts/

           CPU0       
  0:    6093818    IO-APIC-edge  timer
  1:     102125    IO-APIC-edge  keyboard
  2:          0          XT-PIC  cascade
  5:     726841    IO-APIC-edge  soundblaster
 12:     537071    IO-APIC-edge  PS/2 Mouse
 13:          1          XT-PIC  fpu
 16:     283054   IO-APIC-level  aic7xxx, aic7xxx
 19:     199254   IO-APIC-level  Intel EtherExpress Pro 10/100 Ethernet
NMI:          0
ERR:          0


/dev/sndstat/

OSS/Linux 3.9.3b (C) 4Front Technologies 1996-1999

Build: 2.2.13-SMP

Card config: 
Generic PnP support
SoundBlaster AWE64 Gold at 0x220 irq 5 drq 1,5
OPL-2/OPL-3 FM at 0x388
SB MPU-401 at 0x330 irq 5
Emu 8000 Synthesizer Engine at 0x620

Audio devices:
0: Creative SB AWE64 Gold (4.16) (DUPLEX)
1: SB secondary device (DUPLEX)

Synth devices:
0: Yamaha OPL-3
1: AWE32-0.4.2 (RAM4096k)

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster
1: AWE32 Equalizer



Note: When compiling my kernel with sound, i selected:

CONFIG_SOUND_OSS=y
CONFIG_SOUND_DMAP=y
CONFIG_SOUND_SB=y
CONFIG_SB_BASE"0
CONFIG_SB_IRQ=5
CONFIG_SB_DMA=1
CONFIG_SB_DMA2=5
CONFIG_SB_MPU_BASE30
CONFIG_SB_MPU_IRQ=-1


I did not select other low level sound drivers, and i tried the kernel
both with and with out PnP built into the kernel.

I had read on a webpage about perhaps putting #define SB_NO_IRQ_TEST in
/usr/src/linux/drivers/sound/sb_common.c in the headers,
but i tried it with no results.


Any help you could give me would be very helpful, as i had previously
had great luck with in kernel sound, and would like to continue to do so
as i often run development kernels, which OSS is not released for
seperately :(

If anyone replies to this, please cc: it to me incase i miss the post to
the mailing list,

If any more information is needed please feel free to mail me.

thanks in advance,

-Kyle
