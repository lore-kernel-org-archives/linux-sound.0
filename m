From: Kai Vehmanen <kaiv@wakkanet.fi>
Date: Tue, 31 Aug 1999 08:09:00 +0000
Subject: loopback in action!
Message-Id: <marc-linux-sound-93608813328397@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

ALSA kicks ass! :) Seriously, I'm currently writing a ALSA plugin 
for Michael Krause's soundtracker. It's still in early beta (output
only, scopes aren't working, etc), but simple module playback works
nicely. Anyway, I decided to finally do some real testing with ALSA
pcm-loopback and it proved to work amazingly well...

First, configured sountracker to use ALSA card 0 and device 0. Then 
started playing some mod file and on to another console...:

 ecasound -i alsalb,0,0 -o alsa,1,0 -etr:40,0,60

A reverbed version of the module comes from my speakers! :) And...

 ecasound -i alsalb,0,0 -o alsa,1,0 -efl:2000 -kos:1,200,4000,0.2

A lowpass filtered version with a 0.2Hz sine oscillator controlling
the filter cutoff! Don't know how useful this is, but this sure put 
a big smile on my face. ;) 

Software versions used were ALSA 0.4.0, SoundTracker 0.3.1 (w/ patched 
ALSA support) and ecasound 1.5.6r5.

PS The biggest problem was that if I tried to capture output from 
   my AWE64G, the capturing program sometimes exited with a 
   "Interrupted system call" error...

-- 
Kai Vehmanen ----------------------------- CS, University of Turku, Finland
 : email                                 mailto:kaiv@wakkanet.fi
 : audio processing for linux            http://www.wakkanet.fi/ecasound/
 : my music (ambient-idm-rock-...mp3/ra) http://www.wakkanet.fi/sculpscape/
