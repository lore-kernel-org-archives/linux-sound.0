From: Dominik Stadler <Dominik.Stadler@apertum.de>
Date: Wed, 09 Sep 1998 09:03:43 +0000
Subject: AW: record overrun
Message-Id: <marc-linux-sound-90534379411786@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org


Hi!

I'm not an insider in sound-driver-stuff, but as far as I know, you can
specify a certain amount of memory as DMA-Buffer (in sound-config during
kernel-configuration).

This amount of memory is used to store incoming sound until it is
written to disk.

Obviously if your hard-disk is too slow or your machine is too much
stressed, the buffer will be too small and will overrun, causing it to
be emptied and leave a crack in the sound.=20

You should check if your DMA-Buffer is set to the maximum amount (I
think for 2.0.xx no more than 65536 Bytes), and try to decrease the load
of your machine during recording. If this doesn't help, your machine is
too slow for the desired sampling parameters (sampling rate, number of
channels, ..) and therefore you could decrease the quality of your
recording to avoid overruns.

Dschau.. Dominik


	-----Urspr=FCngliche Nachricht-----
	Von:	Karsten Patzwaldt [SMTP:kpa@gmx.net]
	Gesendet am:	Dienstag, 8. September 1998 17:16
	An:	linux-sound@vger.rutgers.edu
	Betreff:	record overrun

	hi!

	when i try to record something with my sb16, the kernel gives me
'Sound:
	Recording overrun' messages. this happens with the 'normal'
sb-driver as
	well as with the oss/free. i use linux 2.0.33, oss/free 3.8 and
a normal
	sb16. please tell me what this means, it sounds terrible when
this
	occurs...

	thanks in advance,

	---=20
	Karsten Patzwaldt             http://kpa.notrix.de
kpa@gmx.net
	                        "Wisdom is earned... not given."
