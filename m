From: Benno Senoner <sbenno@gardena.net>
Date: Sat, 28 Aug 1999 19:14:29 +0000
Subject: Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubles
Message-Id: <marc-linux-sound-93586766006172@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I benchmarked Mingo's latest low-latency patches (2.2.10-N6 a bit modified)

The patches give me excellent results with sporadic very 2.9ms peaks !

See the testresults here:
http://www.gardena.net/benno/linux/audio/2.2.10-n6b/index.html

You can get the patch here:
http://www.gardena.net/benno/linux/audio/patches/lowlatency-2.2.10-N6B.patch

More details on my audio page.

Unfortunately the patch has still some problems , not latency-related:

- The ISDN hisax driver (my card is a Fritz classic) crashes the kernel at
modprobe hisax.o
(does not happen on an unpatched 2.2.10 kernel)   
Can someone of the ISDN maintainers please reproduce/fix this ?
(maybe a race at module initialization ?) 

- The disk performance decreases by 10-25% when I increase the CPU load in
the "latencytest" bench.
(On light CPU load there are no disk performance differences,
maybe this is related to higher scheduling overhead)

I think most of us want to have these "low-latency" features in the upcoming
2.4 kernel since it will make Linux a very good _MULTIMEDIA_OS_.

With Mingo's patches the Linux low-latency performance comes very close
to BEOS, and is much much better (3-4 times) Windows on the same hardware.
It's now time to stress audio-software vendors to port their cool apps to Linux.

comments ?


PS: To Microsoft's Anti-Linux team: just download the patch and compare the
performance with your crappy DirectX API :-)

regards,
Benno.


--
Benno Senoner
E-Mail: sbenno@gardena.net
Linux scheduling latency benchmarks
http://www.gardena.net/benno/linux/audio
