From: Robert Siemer <Robert.Siemer@gmx.de>
Date: Thu, 15 Nov 2001 18:06:07 +0000
Subject: Opti 82c924 pnp-mode "Secrets" - need Help
Message-Id: <marc-linux-sound-100584750103644@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi!

Before I forget it: can anybody with a Opti 82c924 based soundcard send
the output of "cat /proc/isapnp" to my private email address?

I'm currently developing drivers for my miroSOUND PCM20 radio sound
card and poking around with the shitty 82c924 in pnp-mode.

I discoverd some "secrets" from this chip when using pnp. But before I
go into details: are usable specs available??
- I got the file 'db031_10.pdf' (82C924, 16-Bit Sound Controller, Data
Book; Revision 1.0, 912-3000-031, April, 1995) but it's missing 'some
details'...

I've read mad16.c (kernel-oss) and card-opti92x-ad1848.c (alsa) and
there seems to be a gap in respect of the pnp-mode...

Further I need information about the optional 512 Byte EEPROM and how
it's content is used by the chip...

Who can help? - And, who needs help besides me?


Regards,
		Robert
