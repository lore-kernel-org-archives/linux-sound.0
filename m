From: Gerd Bavendiek <bav@rw.sni.de>
Date: Mon, 18 Jan 1999 18:54:19 +0000
Subject: Crystal CS4235 with 2.2.0-pre7
Message-Id: <marc-linux-sound-91668586630286@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91669060300940@msgid-missing>
In-Reply-To: <marc-linux-sound-91669060300940@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

Alan Cox stated a few weeks ago that there is support for the Crystal
soundchip CS4235 in kernel 2.1.132ac1. I have an Acer motherboard with 
this chip and so decided to make the latest available kernel
linux-2.2.0-pre7.

I found no references to CS4235 and so took the closest config option
CS4232. 

Unfortunately 

cat /usr/lib/xemacs-20.4/etc/sounds/im_so_happy.au > /dev/audio

simply gave silence.

I would be very glad if someone out there could give me advice.

Kind regards

Gerd

Here are the details:

To avoid module trouble I made a kernel with builtin support for
CS4232. These are my defines:

CONFIG_SOUND_CS4232=y
CONFIG_CS4232_BASES4
CONFIG_CS4232_IRQ=5
CONFIG_CS4232_DMA=0
CONFIG_CS4232_DMA2=1
CONFIG_CS4232_MPU_BASE:8
CONFIG_CS4232_MPU_IRQ=9

I took the values from Windows98 which is alternatively running on the
same box and working fine with the CS4235.

dmesg says the following:

Sound initialization started
<Crystal audio controller (CS4235)> at 0x534 irq 5 dma 0,1
ad1848: Interrupt test failed (IRQ5)
Sound initialization complete

cat /dev/sndstat gives me:

Linux kiki 2.2.0-pre7 #4 Sun Jan 17 06:21:47 CET 1999 i686 unknown
OSS/Free:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux kiki 2.2.0-pre7 #4 Sun Jan 17 06:21:47 CET 1999 i686
Config options: 0

Installed drivers: 
Type 21: CS4232
Type 22: CS4232 MIDI
Type 26: MPU-401 (UART)

Card config: 
CS4232 MIDI at 0x3a8 irq 9 drq 0
CS4232 at 0x534 irq 5 drq 0,1

Audio devices:
0: Crystal audio controller (CS4235) (DUPLEX)

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:
0: Crystal audio controller (CS4235)

According /proc/interupts IRQ 5 is taken by

  5:          0          XT-PIC  Crystal audio controller

/proc/ioports tells me:

0534-0537 : Crystal audio controller
