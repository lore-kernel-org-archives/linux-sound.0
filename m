From: Tony Nugent <Tony.Nugent@usq.edu.au>
Date: Sun, 31 Jan 1999 13:04:01 +0000
Subject: Esoniq Sound Baster PCI 64
Message-Id: <marc-linux-sound-91778682012308@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I've just got myself one of these SB PCI64 beasts.

After many years of using ess (yech) and sb16 cards, this is a
completely different animal!

Ok, so I'm very new to wavetables, soundfont files and suchlike.  I
have no *.sf2 or *.sbk files to use (well, none that I know of).  So
where do I get the gear I need to set up some good "presets"?

I have so many questions, most of them very probably FAQs.

Can someone point me in a direction where I can find some information
to start to get a handle on how to configure and use this beast?

[I've seen the man sfx* man pages, and had a quick look through the
es1370.c source file.]

Background info:

I'm using it in a box running RedHat 5.1/5.2 (it does not and never
has had a windoze partition on it, and hopefully never will:)

% cat /proc/version
Linux version 2.0.36 (root@porky.redhat.com) (gcc version 2.7.2.3) #1 Tue Dec 29 13:11:13 EST 1998

I've got the very latest RH sndconfig utilities:

% rpm -q sndconfig awesfx sox isapnptools
sndconfig-0.29-6
awesfx-0.4.2-3
sox-11g-7
isapnptools-1.17-0.1

The sndconfig utility correctly identified that card, and the sound
worked.  So now, running "/etc/rc.d/init.d/sound start" the soundcore
and es1370 modules get loaded.  Quake 1 & 2 work just great, full
sound with no breakup (finally!)  But using "play" (ala "sox") results
in ugly static-like noises.

cat'ing /dev/sndstat doesn't work.... not until I manually load the
"sound" module.  (Weird).

% lsmod
Module         Pages    Used by
es1370             6		1
sound             15		0
soundlow           1	[sound]	0
soundcore          1	[es1370 sound]	7
nls_iso8859_1      1		1 (autoclean)
isofs              5		1 (autoclean)
3c59x              5		2 (autoclean)

Once I do that, I get:

%  cat /dev/sndstat
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux tashi.sci.usq.edu.au 2.0.36 #1 Tue Dec 29 13:11:13 EST 1998 i586
Config options: 0

Installed drivers: 

Card config: 

Audio devices:

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:


Also very weird.  According to this, the card isn't working at all :)

When attempting to use a midi player or using the sfx* programs
(sfxload, sfxtest), I get:

open /dev/sequencer: Device not configured

Huh?

Many thanks for any help.

Cheers
Tony
