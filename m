From: Benno Senoner <sbenno@gardena.net>
Date: Sat, 11 Sep 1999 15:42:35 +0000
Subject: low-latency benchmarks: excellent results of RTC clock + SIGIO notification, audio-latency now down
Message-Id: <marc-linux-sound-93706455029492@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi,
good news folks:

Paul Barton Davis added async notification via SIGIO to the RTC device,
and I enhanced "latencytest" (you can get the latest version from my page) =
to
measure timedifferences between two SIGIO calls, All benchmarks performed u=
sing
Mingo's low-latency patch (without his patch timing sucks)
The results are very good,
In my example I used an RTC frequency of 2048HZ, and the maximum jitter was
about 500usecs (very sporadic , shows up every 60-100secs).

look at the the results:
CPU load=80%
http://www.gardena.net/benno/linux/audio/rtc2048-cpu80/2048.html

CPU load=10%
http://www.gardena.net/benno/linux/audio/rtc2048-cpu10/2048.html

A typical use could be an app which needs 1ms timing precision
( MIDI sequencer for example).


I have more good news,  On my audio benchmarks I was able to
reduce the audio buffer size from 4.3ms to ONLY 2.1ms ( 3x0.7ms buffers) ! ,
without losing reliability ,in this case the max jitter is about  0.7ms  in=
 the
range of the fragment-time.

look at the results:
CPU load=80%
http://www.gardena.net/benno/linux/audio/audio3x128-cpu80/3x128.html

CPU load=10%
http://www.gardena.net/benno/linux/audio/audio3x128-cpu10/3x128.html

It's interesting that If I use 4.3ms =3D 3x1.45ms buffers, the max jitter (=
again
very sporadic) is about 1.5ms , the time it takes to play one fragment. =20

Seems that under high disk I/O load,
(very seldom, about every 30-100secs) the process
gets woken up one IRQ period later.
Ideas why this happens.

The trick to deliver rock-solid audio seems to use 3 buffer, so that you can
have about 33% headroom.

Seems that we are now able to outperform most of the other OSes in terms of=
=20
timing precision/ latency ( multimedia loves this)
:-)

In future, we will probably not need RT-Linux to deliver realtime audio
on Linux. (As processors get faster , jitter will go down)

comments ?

regards,
Benno.


---
Benno Senoner
E-Mail: sbenno@gardena.net
Linux low latency audio / scheduling latency benchmarks
http://www.gardena.net/benno/linux/audio
