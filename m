From: Simon Huggins <huggie@dial.pipex.com>
Date: Sun, 04 Apr 1999 11:17:09 +0000
Subject: No MIDI with Ensoniq Soundscape
MIME-Version: 1
Content-Type: multipart/mixed; boundary="azLHFNyN32YCQGCU"
Message-Id: <marc-linux-sound-92322503500870@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii

Hi,

I've managed (with help from Eric Augustus) to get my Ensoniq Soundscape
working with 2.2.x and the new modular sound bits and bobs.

I've not ever been able to get it working with MIDI though.

Attached are:
cat /dev/sndstat
playmidi a_random_midifile.mid

It says it can't find a module called synth0 (and there isn't one).

I tried aliasing it to sscape but that didn't seem to help. Any ideas?

-- 
Simon                           oOoOo "This baby's got a few surprises  oOoOo  
huggie@dial.pipex.com            oOoOo left in her, sweetheart." - Han oOoOo  
http://ds.dial.pipex.com/huggie/  oOoOo             Solo              oOoOo  

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=sndstat

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux boing 2.2.5 #11 Mon Mar 29 20:41:28 BST 1999 i586
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: SoundScape (AD1845)

Synth devices:

Midi devices:
0: SoundScape (MPU401)

Timers:
0: System clock
1: SoundScape (AD1845)

Mixers:
0: SoundScape (AD1845)

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=playmidi

Playmidi 2.4 Copyright (C) 1994-1997 Nathan I. Laredo, AWE32 by Takashi Iwai
This is free software with ABSOLUTELY NO WARRANTY.
For details please see the file COPYING.
modprobe: can't locate module synth0
playmidi: No playback device found.

--azLHFNyN32YCQGCU--
