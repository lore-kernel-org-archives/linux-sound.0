From: Daniel James <daniel@mondodesigno.com>
Date: Tue, 24 Apr 2001 15:43:44 +0000
Subject: Tropez Plus recording not working
Message-Id: <marc-linux-sound-98812819816853@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I'm using a Turtle Beach Tropez Plus set up via isapnp.conf and 
sndconfig on a Mandrake 7.2 machine which works fine for playback, 
but won't record audio. I just get noise on the file when trying to 
record with Broadcast 2000. 

If I try this test:

dd bs=8k count=4 </dev/audio> sample.au

I get:

dd: standard input: Input/output error
0+0 records in
0+0 records out


cat /dev/sndstat shows:

OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux server 2.2.17-21mdksecure #1 SMP Thu Oct 5 12:52:38 
CEST 2000 i686Config options: 0
 
Installed drivers:
 
Card config:
 
Audio devices:
0: Crystal audio controller (CS4232) (DUPLEX)
 
Synth devices:
0: Yamaha OPL3
 
Midi devices:
 
Timers:
0: System clock
1: Crystal audio controller (CS4232)
 
Mixers:
0: Crystal audio controller (CS4232) 


lsmod shows:

Module                  Size  Used by
8139too                12544   1  (autoclean)
opl3                   11376   1
cs4232                  2960   1
ad1848                 16976   1  [cs4232]
uart401                 6480   1  [cs4232]
sound                  60256   0  [opl3 cs4232 ad1848 uart401]
soundlow                 464   0  [sound]
soundcore               3184   5  [sound]
reiserfs              129072   2  

I haven't attempted getting wavefront or midi going yet.

Any ideas?

Thanks
 
Daniel James
News + Web Editor
LinuxUser magazine
http://www.linuxuser.co.uk
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
