From: "Soulier, Frederic" <Frederic.P.Soulier@British-Airways.com>
Date: Fri, 04 Jun 1999 10:07:09 +0000
Subject: AWE64 midi sound
Message-Id: <marc-linux-sound-92849162911089@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Steve wrote:
>Hi Fred
>This probably isn't the answer you are after but at least you should get
>sounds. I use the same soundcard, you might try launching KMid which is the
>Midi/Karaoke Player then from Options - Midi Setup choose which ever option
>gives you the best sound quality, AWE Midi Emu - External Midi Port or
>AWE32-0.4.3 (RAM4096k) and use that. I haven't got kmidi to work yet. In that
>KMid will happily play a mid song for me but kmidi will refuse to play the
>exact same song. I think it might be a sound font issue, but I'm not sure.
>
>If you want to see the exact details of my setup:
>
>http://www.dialspace.dial.pipex/town/parade/fe88/awe64config.shtml
>
>Let me know how you get on.


o I tried KMid with the "AWE Midi Emu - External Midi Port" option and I
  do not get any sound at all!
  note: whatever the option is for midi, I do not get any sound..

doing #cat /dev/sndstat shows:

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux wallaby 2.2.5 #1 Sun May 30 17:46:47 BST 1999 i686
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.16) (DUPLEX)

Synth devices:
0: Yamaha OPL3
1: AWE32-0.4.3 (RAM512k)

Midi devices:
0: Sound Blaster 16
1: AWE Midi Emu

Timers:
0: System clock

Mixers:
0: Sound Blaster

o also I cannot access your www site, Netscape says it cannot access
  the server.


Ciao
Fred
