From: "Adam M. Costello" <amc@cs.berkeley.edu>
Date: Wed, 23 Feb 2000 00:10:44 +0000
Subject: Where are my 32 mixer levels?  (SB16)
Message-Id: <marc-linux-sound-95127425904031@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

After poking around various sound documents and driver source code,
it looks like my SoundBlaster (a "Creative ViBRA16C PnP" according to
pnpdump) is supposed to have 32 different PCM volume levels, but in fact
there are only 8.  Levels 0..11 are all silent, then there is a jump
from 11 to 12.  Levels 12..14 are all the same, then there is another
jump from 24 to 25, then 37/38, 49/50, 62/63, 75/76, 88/89.

I'm using aumix -w to set the level, under Linux 2.2.14.  I have the
following aliases set in modutils.conf:

alias char-major-14     soundcore  # basic sound capabilities
alias sound-slot-0      sb         # main sound card hardware driver
alias sound-service-0-0 sound      # mixer taken care of by sound.o
alias sound-service-0-2 sb         # uart support part of sb
alias sound-service-0-3 sound      # /dev/dsp & /dev/audio support in sound.o
alias sound-service-0-6 sound      # /dev/sndstat support in sound.o

Does anyone knows whether I'm really supposed to have 32 different
levels, and if so, what might be going wrong?

Also, does anyone know what this 0..100 scale is supposed to mean?  By
doing listening experiments where I compare the effect of aumix -w
to the effect of multiplying the audio samples by a constant, I've
determined that the seven non-silent levels have output amplitudes
roughly in the proportion 1:2:4:7:10:16:23, which is bizarre.  The first
two jumps are +6 dB, the next is about +5 dB, and the last three are
about +3.5 dB.

I'd really like to understand what the mixer levels mean, so that if I
pipe my sound through a filter that scales down the samples to avoid
overflow, I can compensate for it by increasing the mixer level the
proper amount.

Can anyone offer any clues?

Thanks,
AMC
