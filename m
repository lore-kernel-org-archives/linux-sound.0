From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 16 Sep 1999 21:03:31 +0000
Subject: latencytests results on a Pentium133, again EXCELLENT, 2.1ms.:-)
Message-Id: <marc-linux-sound-93751869030865@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi, folks,
I performed more latency benchmarks on an old Pentium box:
P133 , mainboard Tyan Tomcat HX, 64MB RAM, harddisk IBM EIDE 6GB,
 Soundcard TB Tropez plus, videocard S3 PCI.

To my surprise the results were excellent,  2.1ms !  ( 3x128 bytes audio bu=
ffer)
(even if the jitter is a bit higher than on a PII400 , but anyway very good=
 !)

I lowered the CPU load to 60% since cpuload=80% made the box quite unusable
(it's like running on a Pentium with 20-25Mhz  :-))

look at the results here:

http://www.gardena.net/benno/linux/audio/2.2.10-p133-3x128/3x128.html

Seems that Benjamin was right: a P166MMX Laptop can deliver the 3-4ms laten=
cy.
:-)

PS: I noticed that the TB Tropez plus, takes a few msecs to startup,
(after the first write() call) therefore just write an empty audio buffer
before entering the main loop.

regards,
Benno.

--
Benno Senoner
E-Mail: sbenno@gardena.net
Linux low latency audio / scheduling latency benchmarks:
http://www.gardena.net/benno/linux/audio
=20
