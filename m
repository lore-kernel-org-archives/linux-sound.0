From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 26 Aug 1999 17:34:03 +0000
Subject: Bad MIDI performance : 10ms latency instead of the expected 1-1.5ms
Message-Id: <marc-linux-sound-93568883025986@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi folks,

I finished my MIDI performance tests:  ( DISAPPOINTING  :-(  )

I did basically the following:
connected the external MIDI-out of my AWE64 to the MIDI-in port with a MIDI
cable.
Then I wrote a little app which opens the midi device in O_RDWR mode
and then does
time1=gettime() 
- write 3 bytes to the midi device ( to simulate a Note-on cmd)
- read back the data
time2=gettime()
prints out the timediff

I tested both a 2.2.5 and a 2.2.10 kernel , same results.

I wrote this to measure the MIDI output-to-input delay.
I tried both with blocking I/O and non-blocking I/O.
Unfortunately I get bad values in both modes:
about 11.5ms , and this is exactly the MIDI transfer time (1.3ms) plus
10ms = 1 jiffie.
If I run the test on a HZ00 kernel I get about 2ms.

11ms is not acceptable to implement realtime MIDI processing apps,
like soft-synths, virtual midi-thru boxes (or via sequencers), midi-filters etc.


Does anyone know if there is a way to get the values down to the effective
transfer time. ?

 ( are there lowlatency serial flags similar to those of the
regular serial devices ?)

You can get my mididelay benchmark here:

http://www.gardena.net/benno/linux/audio/mididelay0.1.tgz

Do you get better values on ALSA ?

comments ?

PS: Paul: I was wrong about not being able to open the midi device in
O_NONBLOCK.


regards,
Benno.

Benno Senoner
E-Mail: sbenno@gardena.net
Linux scheduling latency benchmarks
http://www.gardena.net/benno/linux/audio
