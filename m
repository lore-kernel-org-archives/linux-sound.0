From: hcchin@strd.csam.com.my
Date: Tue, 06 Jul 1999 01:58:34 +0000
Subject: Sound problem.
Message-Id: <marc-linux-sound-93122676821094@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I have a sound configure problem, I works before, but I am not sure what 
have I done and it is not working now:

I am running Slackware, kernal 3.0.30, with Sound Blaster.

% cat sound.au > /dev/audio
bash: /dev/audio: No such device or address

% cat /dev/sndstat
Sound Driver:3.5.4-960630 (Tue Mar 2 20:13:38 SGT 1999 root,
Linux funny 2.0.30 #6 Tue Mar 2 17:14:53 SGT 1999 i586 unknown)
Kernel: Linux funny 2.0.30 #2 Tue Mar 2 21:38:06 SGT 1999 i586
Config options: 0

Installed drivers: 
Type 2: Sound Blaster
Type 7: SB MPU-401

Card config: 
(Sound Blaster at 0x220 irq 7 drq 1,5)
(SB MPU-401 irq 1 drq 0)

Audio devices:

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:

% lsmod

Module:        #pages:  Used by:
sound             22		0 (autoclean)
ppp                5		0
slhc               2	[ppp]	0
lp                 2		0
