From: kswisher@iolinc.net (Swisher, Karl)
Date: Sun, 27 Jun 1999 22:32:08 +0000
Subject: SB Live Results & Problems
Message-Id: <marc-linux-sound-93054294024581@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello
     I've been working with SB Live for a while.   I am new to Linux and
migrated here from the Amiga community.   I am looking forward to
the day I can throw away Windows.  Here is what I would like to be able to
do with SB Live in Linux.  Have full analog and digital I/O access with editing
capabilities of Sound Forge for that other OS.   Have the midi capabilities of
Bars&Pipes (from the Amiga).  

     Below are my experiences so far.  Any help and suggestions will be greatly
appreciated.  I've provided a good bit of information to help assist us.  I'm
not sure whether Open Sound System is suppose to be use in conjunction with
Creative's SBLive driver or not.  Have made several attempts at diferent
combinations.  The best combination found so far is only using Creative's
SBLive drive alone with no OSS.   Since sound support was modular I removed all
sound modules from /lib/modules/2.0.36.  Using Creative's instructions
installation reported success usin an auto install.    During boot the card is
initalized with a slight pop.  At this time the screen reports sblive.o has
unresolved symbol(s).    After boot  KDE's menu Settings/Information/Sound
reports that OSS/free is loaded as a module.  This still occurs after a kernel
recompile and a complete removal of OSS/free and any indiividual sound card
support.  Only modular sound card support was selected.  I can remove Creative'
sblive.o and install OSS.  No problem on installation.  Everything reports
success with notation that the SBLive driver is not supported yet.   KDE's menu
Settings/Information/Sound confirms that OSS is loaded.  (not OSS/free)  Tryng
to install OSS with Creative's sblive.o in modules results in an error from OSS
stating a sound driver is already loaded.

     When I use Creative's drive, why does KDE's menu
Settings/Information/Sound  report OSS/free as the driver ?   OSS/free I
understand doesn't support digital I/O.  I don't understand why Creative
wound make a Linux driver for their card that requires another driver that
doesn't allow the full use of the features of their card.  Haven't got digital
I/O working yet.  Typing modprobe sblive doen't seem make any difference.

I'm running RH 5.2 with a 2.0.36 kernel on a AMD K6-2, 350Mhz 128MB


SYSTEM REPORTS:

 These lines are in /etc/conf.modules.  All other sound card references removed.
alias sound sblive
pre-install sblive insmod soundcore
post-remove sblive rmmod soundcore



The program sbmixer reports the following using the -D debug option

DEBUG: Debugging mode on.
DEBUG: device mask 0x1049F1, stereo device mask 0x4951
DEBUG: recordable device mask 0x1041C0, caps mask 0x1
DEBUG: Supports vol (0x0) as a stereo device.
DEBUG: Doesn't support bass (0x1).
DEBUG: Doesn't support treble (0x2).
DEBUG: Doesn't support synth (0x3).
DEBUG: Supports pcm (0x4) as a stereo device.
DEBUG: Supports speaker (0x5) as a mono device.
DEBUG: Supports line (0x6) as a stereorecording device.
DEBUG: Supports mic (0x7) as a monorecording device.
DEBUG: Supports cd (0x8) as a stereorecording device.
DEBUG: Doesn't support mix (0x9).
DEBUG: Doesn't support pcm2 (0xA).
DEBUG: Supports rec (0xB) as a stereo device.
DEBUG: Doesn't support igain (0xC).
DEBUG: Doesn't support ogain (0xD).
DEBUG: Supports line1 (0xE) as a stereorecording device.
DEBUG: Doesn't support line2 (0xF).
DEBUG: Doesn't support line3 (0x10).
DEBUG: Doesn't support dig1 (0x11).
DEBUG: Doesn't support dig2 (0x12).
DEBUG: Doesn't support dig3 (0x13).
DEBUG: Supports phin (0x14) as a monorecording device.
DEBUG: Doesn't support phout (0x15).
DEBUG: Doesn't support video (0x16).
DEBUG: Doesn't support radio (0x17).
DEBUG: Doesn't support monitor (0x18).
Vol  : 76 76
Pcm  : 100 100
Spkr :  19
Line : 74 74
Mic  :  0
CD   : 64 64
Rec  : 34 34
Line1: 16 16
PhoneIn:  1          



KDE's menu Settings/Information/Sound reports this:

OSS/Free: 3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux localhost.localdomain 2.0.36 #19 Sun May 9 16:44:29 EDT 1999 i586
Config options: 0

Installed drivers:
Tupe 0: Sound Blaster Live! (0.1)

Card config:
(Sound Blaster Live at 0xdc00 irq 11)

Audio devices:
0: Sound Blaster Live! (DUPLEX)

Synth devices:
Not supported by current driver

Midi devices:
0: Sound Blaster Live!

Timers:
0: System Clock

Mixers:
0: Sound Blaster Live!


Results with tried software:

KMid - Loads midi file but when play is pressed error box appears
       and states: "Couldn't open /dev/sequencer
                    Probably there is another program using it"


Kmidi - Loads all midi files I've tried.  Only been able hear a single
        instrument and only on a limited number of files. On the files
        that I dont hear anything the Info window displays things like:

         Tone bank 16 is undefined
         Tone bank 8 is undefined
         Drum set 56 is undefined
         No instrument mapped to tone bank 0, program 5 - this instrument will not be heard
         ect.............

         This is not any external midi device connected. The sound I hear must
         be coming from the card. I haven't got the external sigal going yet.
	 Haven't had a chance to verify all the possible settings on the external
         midi devices so the fault may be there.

kscd -   Works and sounds great !!!!!!!!!!

KMp3 -   Sounds great then the pops or clicks go away.  About every song that starts
         starts with these clicks.  At some random point in the song the go away
         with a dropout.  Will go away at different places in the same song repeated
         over and over again.  Pressing pause/play will also remove this noise until
         a song is started again.  Then we are back in the same cycle again.  Mp3's
         don't have this problem under KJukeBox.  It has a different problem.

KJukebox - Sounds great with no pops or clicks on Mp3s.  However on every song
           at random times through each song, the song pauses for 1 or 2 seconds.
           This happens at occurences of 5 to 30 seconds apart.

KMix  -  Setting the Line input to record allows analog line inputs on the back
         of the card in.  They sound great.  However attention must be paid to
         the pcm fader.  Take it out.  Lots of clipping occurs if it is up.
         Haven't found if anything goes to RecMon yet.  Line1 fader has no signal.


Thanks
Karl Swisher
kswisher@iolinc.net
