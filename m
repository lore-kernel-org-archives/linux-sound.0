From: Raimi <raimi@lkcc.org>
Date: Fri, 09 Apr 1999 20:45:00 +0000
Subject: ViperMax (ESS + GUS) / GUS Volume
Message-Id: <marc-linux-sound-92368213931275@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hello all!

I have  Souncard called ViperMax produced by the long-gone company
Synergy.

Furthermore I am talking about a Vanilla 2.2.5 kernel in x86 Linux.

The ViperMax is basically an ESS ES1688 Audiodrive and a Gravis
Ultrasound Max. Unfortunately they left out the CS4231 which
is the mixer, I believe.

Thus my dmesg says: ----------------------------------------------
Sound initialization started
<ESS ES1688 AudioDrive (rev 11) (3.1)> at 0x220 irq 7 dma 1,5
<ESS ES1688> at 0x330 irq 7 dma 0
GUS: No CS4231 ??<Gravis UltraSound MAX (1024k)> at 0x240 irq 5 dma 3,3
<Yamaha OPL3> at 0x388
Sound initialization complete
------------------------------------------------------------------

First 'bug': No \n in the 'GUS: No CS4231 ??' message generated in
line 3064 of drivers/sound/gus_wave.c

Well, the Audiodrive is /dev/audio which works just fine. The
Ultrasound is /dev/audio1 which works (it seems) but is far too
silent (no volume). I dunno if the sound is correct, I have to
turn up my stereo quite a bit to hear something. There might be
electronic noise disturbing the signal.

Real bug:
I used aumix and cam to turn up the volume of the Ultrasound
part. They both list it as "Line2" (for info: the Windows ESS driver's
mixer calls it AuxB, controlling GUS' volume perfectly).
Well, Line2 controlls the volume, but even if I turn it to
the maximum, it is still not loud enough.

Questions:
 - Does the ultrasound code work even if it doesn't find the CS4231 ?
   ( My impression while reading the sources was that it doesn't care
     after the init )
 - Is the ESS mixer code to be fixed? If so, who does it?

I am not quite a kernel hacker but I will do my best if someone just
could tell me what to do... Or where to start.

Contact me for further info or if you have something I should check for
you.

Thanks in advance,
    Raimi

--
      __/\     _/\    _____/\____/\
     /   /    /  /___/   ____/  __/\     Name    : Raimi
    /   /  __/    __/   / __/  / _\/     Contact : raimi@lkcc.org
   /   /__/ /     \/   /_/_/  /_/        Visit   : http://www.lkcc.org
  /________/___/\__\______/_____/\       3.141592653589793238462643383
  \________\___\/__/\_____\_____\/       27950288419716939937510582097
