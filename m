From: "G . Sumner Hayes" <SumnerH@fool.com>
Date: Fri, 21 Apr 2000 02:11:05 +0000
Subject: Two outputs with ESS1869 Audiodrive (Compaq deskpro)
Message-Id: <marc-linux-sound-95628328422913@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I've got an ESS1869 on-board processor (440BZ/ZX, Compaq
deskpro of some sort) that's mostly working fine. However,
the back of the machine has 4 1/8" headphone jacks; one is
"headphone", one is "line out" (the other two are line in
and microphone, I presume). If I plug the speakers in to
the line out or the headphones into the headphone jack, all
is cool. However, if I plug in both headphones and speakers
the speakers don't work. I'm using the sb.o module (details
below)

I'd like to have both headphones and speakers work; I can
shut off the speakers if I don't want to listen to them,
which is a lot easier than reaching around behind the
machine to plug/unplug headphones. Being able to just toggle
the "line 2" in gmix and have it control the speakers would
be even cooler.

Unmuting everything in gmix doesn't help. I'm not sure if
this is something that Compaq or someone believes is a
helpful feature and implements at a low hardware level or
whether it's something I could control with a driver option
somewhere.

Mostly standard Red Hat 6.2, Linux-2.2.15pre16 with the Utah
GLX AGP module

/etc/conf.modules:
alias parport_lowlevel parport_pc
alias eth0 eepro100
post-install awe_wave /bin/sfxload /etc/midi/GU11-ROM.SF2
alias sound-slot-0 sb
#options sound dmabuf=1
alias midi opl3
options opl3 io=0x388
options sb io=0x220 irq=5 dma=1 esstype69
alias char-major-67 coda

/dev/sndstat:
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux collegium 2.2.15pre16 #3 Thu Apr 13 11:52:47 EDT 2000 i686
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: ESS ES1869 AudioDrive (rev 11) (3.01)

Synth devices:
0: Yamaha OPL3

Midi devices:

Timers:
0: System clock

Mixers:
0: Sound Blaster


output of lspci:
00:00.0 Host bridge: Intel Corporation 440BX/ZX - 82443BX/ZX Host bridge (rev 03)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX - 82443BX/ZX AGP bridge (rev 03)
00:12.0 Ethernet controller: Intel Corporation 82557 [Ethernet Pro 100] (rev 08)00:14.0 ISA bridge: Intel Corporation 82371AB PIIX4 ISA (rev 02)
00:14.1 IDE interface: Intel Corporation 82371AB PIIX4 IDE (rev 01)
00:14.2 USB Controller: Intel Corporation 82371AB PIIX4 USB (rev 01)
00:14.3 Bridge: Intel Corporation 82371AB PIIX4 ACPI (rev 02)
01:00.0 VGA compatible controller: ATI Technologies Inc 3D Rage Pro AGP 1X/2X (rev 5c)


-- 
ceci n'est pas une .sig
