From: Rainer Wiener <rainer@konqui.de>
Date: Fri, 16 Jun 2000 05:16:35 +0000
Subject: Re: no sound
Message-Id: <marc-linux-sound-96113293809556@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96112557801963@msgid-missing>
In-Reply-To: <marc-linux-sound-96112557801963@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi wackode!

On Thu, 15 Jun 2000, wackode .....! wrote:

> Hello list:
>=20
>    I have a laptop toshiba satellite 2540CDS which uses a yamaha opl3-sax=
=20
> wdm sound card, how can i make it works?
>=20
> I have linux redhat 6.2.
>=20
> I=B4ve tried with oss, but isn=B4t supported.

Try the following in the kernel:

<M> Sound card support
<M> OSS sound modules
<M> MPU-401 support (NOT for SB16)
<M> Microsoft Sound System support
<M> Support for Yamaha OPL3-SA2, SA3, and SAx based PnP cards
<M> Yamaha OPL3-SA1 audio controller
<M> FM synthesizer (YM3812/OPL-3) support

and put this lines into the /etc/modules.conf file:

alias sound-slot-0 ad1848
alias sound-slot-0 opl3sa2
options sound dmabuf=3D1
alias midi opl3
options opl3 io=3D0x388
options opl3sa2 mss_io=3D0x530 irq=3D9 dma=3D1 dma2=3D0 mpu_io=3D0x330 io=
=3D0x370


It could be that you must set the irq and dma in your BIOS.

Cu
Rainer

PS: Also have a look at my Homepage http://www.konqui.de
--=20
 http://www.konqui.de ** PGP PUBLIC KEY AVAILABLE ON REQUEST=20
