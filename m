From: Bryan Bolden <bbolden@UU.NET>
Date: Tue, 15 Feb 2000 18:09:36 +0000
Subject: line-in input doesn't record
Message-Id: <marc-linux-sound-95064847827665@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

hello all!!  I am trying to begin recording/sampling of voice coming in
from my line-in jack.  I have a tape recorder connected (through the tape
recorder' s earphone jack) to the line-in of my sound card (is that right).
 now when I press play on the tape I do hear the voices on tape through my
external spekers but when I test the recording with :

dd if=/dev/audio of=/tmp/audio_test
and then:
cat /tmp/audio_test >/dev/dsp

all I hear is the sound from the mic input.  I have adjusted the line-input
sound level through a mixer at a higher leven that the mic's level but I
don't hear anything from the sampled audio from the tape despite hearing it
from my external speakers.  any suggestions?

thanks!
