From: Kevin Turner <Kevin.Turner@oberlin.edu>
Date: Fri, 15 Jan 1999 07:58:37 +0000
Subject: PAS16 modules: The good, the bad, and the ugly.
Message-Id: <marc-linux-sound-91638724111184@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I know that lots of people have been fighting with the configuration on
this one since the switch to modular sound.  Here are the results of my
latest battle under 2.2.0pre7.

 * Things that work:
 
No more "Sound: DMA (output) timed out - IRQ/DRQ config error?" with
current configuration when playing to /dev/dsp, audio.  Happy day!

 * Things that don't work:

Removing and adding the pas2 module again.  This causes the Pro Audio
Spectrum to be listed as Audio Device 1 instead of 0, and sounds don't
play then.  I have a hunch this is related to dmabuf=1, but haven't
tested that.  It makes configuration testing a bitch because you have to
reboot.  <grumble>

Playing to /dev/dsp1,audio1 works, but only plays the first bit of a
clip.  Then it goes silent or does the old "DMA (output) timed out"
routine while clipping in and out.

Can't record from /dev/dsp1,audio1.  DMA timed out etc.  It may be that
the emulation doesn't support this, but it would be nice if it told you
so.

The PAS (not but not /dev/audio1) sometimes boots into weird moods where
sound played through /dev/audio is way too fast, and dsp is noisy with
our old friend "DMA (output) timed out".  I haven't been able to figure
out how to solve this except by cold reboot.

 * Other odd stuff:

In pas2_card.c, there's a comment in detect_pas_hw that says W:1
disables warm boot reset of the card.  I assume it's referring to the
DOS driver mvsound.sys, but the documentation for that states that /W:1
*enables* a warm boot reset and is the default.

Note I have an Award BIOS.  I don't know why this matters except the
faq from spectrum says to disable warm boot reset if you have award
bios.  I haven't though, because I never have and the kernel source says
not to.

 * Configurations

==/etc/conf.modules:
# I have a ISA motherboard and over 16 MB ram.
# DMA can only access the first 16 MB though, so...
options sound dmabuf=1

# These things should load the sound module...
alias char-major-14 pas2
alias mixer0 pas2

# Options to pas module. 
# DMA's 1-3 are 8 bit, 5-7 are 16 bit, using a 16 bit one for pas.
# That might be important.
# io=0x388 is standard default for pas.
# SB parameters here are standard (sb emulation is 8 bit).
options pas2 dma=5 irq io=0x388 sb_dma=1 sb_irq=5 sb_io=0x220

# To play midi files, use the adlib_card module.
alias synth0 adlib_card
# Point adlib_card module at pas ioport.
options adlib_card io=0x388

# This can use the sb emulation.
# It lets us use /dev/audio1
alias sound-slot-1 sb

# SB options for SB emulation.
# Notice that pas2=1 is NOT here,
# as I don't get "SB 2.0 detected OK (220)" that way.
options sb dma=1 irq=5 io=0x220

==/dosc/config.sys (for reference)
rem the X displays current configuration stats.
DEVICEHIGH /L:3,18480 =C:\SPECTRUM\MVSOUND.SYS D:5 Q:10 S:1,220,3,5 M:1,330,7 J:1 /W:1 X

==/proc/sound (once all relevant modules have been loaded)
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux uwanna.kompile.org 2.2.0-pre7 #1 Thu Jan 14
20:57:16 EST 1999 i486
Config options: 0

Installed drivers:

Card config:

Audio devices:
0: Pro Audio Spectrum
1: Sound Blaster (8 BIT/MONO ONLY) (2.0)

Synth devices:
0: Yamaha OPL3

Midi devices:
0: Pro Audio Spectrum
1: Sound Blaster

Timers:
0: System clock

Mixers:
0: Pro Audio Spectrum 16
