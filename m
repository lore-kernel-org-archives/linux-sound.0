From: Mike <cekim@ix.netcom.com>
Date: Sun, 08 Nov 1998 18:26:26 +0000
Subject: full-duplex
Message-Id: <marc-linux-sound-91054699525706@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have been working with this off and on for some time now and with the
release of 2.1.126, there seems to be some light at the end of the
tunnel:

System:
Alpha 164LX RH 5.1 2.1.126 sound - 82c931

I can now assign two seperate DMAs to the card and play/record without
overruns.

But I cannot play and record at the same time.  It returns a device busy
warning.

"sox: Can't open output file '/dev/dsp': Device or resource busy"

To record I use:
[root@Z speak_freely-6.1c]# dd bs=8k count8 </dev/audio >sample.au
128+0 records in
128+0 records out

to play I am using:
play -t ul -r 8000 sample.au 

Although I can record a sample and play it back correctly in
soundstudio, "dd" results in loud static being recorded.  I assume that
is a format problem so I am not worried about it.  But it is the same
noise I hear when I try to transmit sound over a network via
speakfreely.

Any thoughts?

/Mike

info below:


[root@Z /proc]# m dma
 0: MAD16 WSS
 1: MAD16 WSS
 4: cascade

[root@Z /proc]# m /dev/sndstat 
at Nov 7 14:17:37 EST 1998 alpha
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: MAD16 WSS (82C930) (DUPLEX)

Synth devices:

Midi devices:
0: Mad16/Mozart

Timers:
0: System clock

Mixers:
0: MAD16 WSS (82C930)
