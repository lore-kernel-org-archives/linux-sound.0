From: ali <faali@mweb.co.za>
Date: Mon, 22 Mar 1999 01:37:47 +0000
Subject: AWE64-Midi-Problems
Message-Id: <marc-linux-sound-92260469820891@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi!!

I've gone through all the documentation for the AWE64 that I could find but I
still can't get midi to work. My card plays mp3 .wav files and music CD's
perfectly. It's just midi that's the problem. 

I invoke xplaymidi with the command: xplaymidi -e /dev/audio name_of_file.mid

The interface comes up and shows every indication that the file is playing (I
see the differnent sound levels changing etc), but there's no sound :-(

When I load awe_wave (Which is supposed to be for the AWE64, I get a Awe32 not
found. I then have to do a insmod awe_wave io=0x620 which loads the driver but
hangs the insmod program. I then have to manually issue a break with ctrl-C to
get back to the shell)


 I'm using RH5.0 (kernel 2.2.1)
playmidi 2.3
The Latest Midi Driver   
Sound support is compiled as modules

output of /dev/sndstat
----------------------------------------------------
OSS/Free:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux localhost.localdomain 2.2.1 #35 Wed Mar 3 03:26:20 SAT 1999 i586
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:
0: AWE32-0.4.3 (RAM0k)

Midi devices:
0: AWE Midi Emu

Timers:
0: System clock

Mixers:
0: Sound Blaster
-------------------------------------------------------------
