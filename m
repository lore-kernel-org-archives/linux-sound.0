From: "Adam M. Costello" <amc@cs.berkeley.edu>
Date: Sun, 12 Mar 2000 04:20:17 +0000
Subject: Does an SB16 have 32 volume levels or 8?
Message-Id: <marc-linux-sound-95283558718384@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Anyone who has some flavor of SoundBlaster 16, especially a Vibra 16C,
could you please try the following simple experiment for me?

Adjust the PCM volume level from 0 to 100 (I use aumix -w), and count
how many distinct levels you hear.

When I do this, there are only 8 levels, one of which is silent.  The
constant ranges are 0-11, 12-24, 25-37, 38-49, 50-62, 63-75, 76-88,
89-100.

Various documents and code that I've poked around in say that there are
supposed to be 32 levels with SB16 hardware.

Does anyone know the true story?  Also, does anyone know how these
levels are supposed to map to amplitude or dB?

I'm using Linux 2.2.14, with the following aliases set in modutils.conf:

alias char-major-14     soundcore  # basic sound capabilities
alias sound-slot-0      sb         # main sound card hardware driver
alias sound-service-0-0 sound      # mixer taken care of by sound.o
alias sound-service-0-2 sb         # uart support part of sb
alias sound-service-0-3 sound      # /dev/dsp & /dev/audio support in sound.o
alias sound-service-0-6 sound      # /dev/sndstat support in sound.o

Thanks,
AMC
