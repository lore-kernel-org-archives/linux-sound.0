From: "defcon maillinglists" <defcon@sap-ag.de>
Date: Tue, 15 Jun 1999 13:50:27 +0000
Subject: Intellistation MPRO and CS4232
Message-Id: <marc-linux-sound-92945631502471@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi,
I have a problem with an Intellistation MPRO and CS4232.
I can configure the onboard Soundcard (irq 5 io 534 dma 1,3 mpuirq 9 mpuio
330).
The soundcard works fine for 5 til 10 minutes and the stops playing. Someti=
mes
in the syslog you can see the message could=B4nt allocate DMA buffer. Somet=
imes
nothing and somtimes DMA buffer overrun.

It is impossible to use the card after this crash. (Allocating memory with a
big program and then freeing the allocate memory is also useless).

So my question, has any one sucessful configured this card on an intellisat=
ion.
What can I do (by the way I use kernel 2.2.9).

Please help. I think it should not be possible to say this intellistation w=
orks
better under M$. Everything else works great under linux.

Cheers
 David Conner
