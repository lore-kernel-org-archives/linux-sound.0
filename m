From: Idris Samawi Hamid <ishamid@acsu.buffalo.edu>
Date: Sat, 27 Mar 1999 14:32:41 +0000
Subject: Soundblaster AWE64 and RedHat 5.2
Message-Id: <marc-linux-sound-92254564325852@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings:

I bought, from a linux systems distributor, a SoundBlaster AWE64
soundcard. I cannot
get it to work. I use Linux Mandrake 5.3 (RedHat 5.2).

I ran sndconfig but it failed to set up sound (although my card is
listed in the soundcard list). I tried again and sndconfig would just
freeze, forcing me to have to kill kvt. This happened a number of times.

dmesg gives me
------
Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
sb: dsp reset failed.
AWE32: not detected
------
My old RedHat 5.0 Installation guide says that the AWE64 only works in
SB-16 mode. Isthis related to the [sound] problem?

I tried sndconfig --noprobe (this option somehow does not cause
sndconfig to freeze). Based on info in the second and smaller SB booklet

that came with the soundcard, I changed the settings as follows:

I/O PORT   IRQ   DMA 1   DMA 2   MPU I/O       x
  0x220    [5]     0       0     [0x330]       x
  0x240     7     [1]      1      0x300        x
  0x260     9      3       3                   x
  0x280    10             [5]                  x

But it still does not work! I checked my Win95 partition and the sound
card is indeed installed on irq5 (where it works just fine).

I checked /proc/interrupts:

/proc]# more interrupts
 0:      45539   timer
 1:        282   keyboard
 2:          0   cascade
 3:       1988 + serial
 8:          1 + rtc
13:          0   math error
14:      63529 + ide0
15:          0 + ide1

Any advice is greatly appreciated

Thank you in advance
Idris
