From: Karim Yaghmour <karym@info.polymtl.ca>
Date: Fri, 14 May 1999 04:25:02 +0000
Subject: SB PRo compatible with no valid driver
Message-Id: <marc-linux-sound-92672963004016@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I just got a notebook that has SB Pro compatible card
(Don't they all :) ). To make long stories short, it
doesn't work with any driver configuration I've seen
on the linux laptop pages or in
linux/Documentation/sound/
In windows it says that it's Sound Blaster Pro
compatible at 0x220 with irq 5. I also know that
there's a yamaha synthesizer chip (read OPL3 compatible).

Now, even if I load only the uart401 and sb with
the right paraemeters, I always get :
... 'dev/dsp': Device or resource busy
when I try to write. And when I try to read using:
more /dev/dsp
I get :
Sound: DMA (input) timed out - ....

I've tried all sort of things but nothing works.
I know that previous models of the notebook used
the YMF715. That means I should use OPL3-SA2,
but that doesn't work. It actually detects one,
but when it tries to check some stuff, it fails
in step B of ad1848_detect. I get :
ad1848 detect error - step B (ff/ff)
when loading it at 0x220 (if I try any other
address it fails at step A).

Anyways, does anyone has an idea on how to solve
this or even where to start in order to investigate
on whether this is a new "unknown" card?

Thanx in advance!

=======================
              Karim Yaghmour
          karym@info.polymtl.ca
            Computer Engineer
      Ecole Polytechnique de Montreal
=======================
