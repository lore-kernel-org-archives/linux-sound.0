From: Jean Francois Ortolo <ortolojf@cybercable.fr>
Date: Tue, 15 Feb 2000 08:10:14 +0000
Subject: /dev/audio, /dev/dsp not running for an es1371
Message-Id: <marc-linux-sound-95060250626587@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello
  I have Linux RedHat6.1 installed, with a Creative Lab
SoundBlaster PCI 128 in the box. It's not a clone,
the chip is a Creative Lab chip.

  The sndconfig detects an Ensoniq card, for which it
installs an es1371 module in /etc/conf.modules
  While doing this, the generated speech is
well heard by me, so I might believe that
all is all right.

  However, a 'cat /dev/sndstat' then reports
"no device with this type", and the /dev/audio0
and /dev/dsp0 don't appear in their directory.

  So, a try for reading from anyone either of the 
/dev/audio or /dev/dsp with the command:
 'dd bs=8k count=5 </dev/audio > sample.au'
or the same with /dev/dsp... It doesn't read
anything, such that the sample.au file
contains always the same character, indicating
that there is only a silence.
  So the command 'cat sample.au > /dev/audio'
gives only a 5 seconds silence, the same
with the /dev/dsp interface.

  Although, under the Gnome Windows Manager,
the sounds appear fine for any events they
are set up for.
  So I can't understand which way Gnome
is successful with its sound managering,
though the /dev/audio and /dev/dsp
interfaces are not available yet.

  Any help cheerfully welcome.

  Jean Francois
