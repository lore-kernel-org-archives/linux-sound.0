From: =?iso-8859-1?Q?J=E9r=F4me=20Aug=E9?= <jauge@club-internet.fr>
Date: Thu, 28 Jun 2001 19:04:29 +0000
Subject: Re: Strange issue with opl3sa2 driver under linux 2.4.4
Message-Id: <marc-linux-sound-99375499326228@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99375164302844@msgid-missing>
In-Reply-To: <marc-linux-sound-99375164302844@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

David Nedved wrote:
>=20
> Hi all,
>=20
> I'm trying to get sound working on my laptop, and  I'm having some strange
> problems getting it work as expected, and I hope that you can give me some
> insight.  I have a Toshiba Libretto 70CT, which is one of the hardware
> platforms that is mentioned as working in the docs... I CAN get sound out=
 of
> it, but only after a strange ritual...
>=20
> I have to do this to get it to work:
>=20
> #modprobe opl3sa2 io=3D0x220 mss_io=3D0x530 mpu_io=3D0x330 irq=3D5 dma=3D=
1 dma2=3D0
> opl3sa2: Control I/O port 0x220 is not a YMF7xx chipset!
> #modprobe opl3sa2 io=3D0x370 mss_io=3D0x530 mpu_io=3D0x330 irq=3D5 dma=3D=
1 dma2=3D0
> opl3sa2: Control I/O port 0x370 is not free
> opl3sa2: Control I/O port 0x370 is not free
> opl3sa2: Control I/O port 0x370 is not free
> #modprobe opl3sa2 io=3D0x220 mss_io=3D0x530 mpu_io=3D0x330 irq=3D5 dma=3D=
1 dma2=3D0
>=20
> notice that I have to modprobe it FIRST at 0x370, it fails, then it will
> insert into 0x220!  I have verified all the settings through both the BIOS
> setup utility and by dual-booting into Windows98.
>=20
> This is with kernel version 2.4.4.  Do you have any idea about why it is
> acting so strange upon inserting?  In /proc/ioports it lists 0x370 as bel=
onging
> to OPL3-SA3, and 0x220 is not listed, however 0x220 is
> the address that it ends up working under both in Windows98 and Linux.
>=20
> Thanks very much, I really hope you have some idea how to work around this
> more elegantly (so that maybe I can boot and have sound without typing all
> that junk!)  If there's anything I can do to experiment around that would=
 help
> others, just let me know and I'll be happy to do it.
>=20

Are you sure it really fails when modprobing at 0x370 ?

Try to modprobe at 0x370 and immediatly look at the output of "lsmod" to
see if the driver is really loaded or not ... ???

--=20
J=E9r=F4me Aug=E9
echo cdqgm@vnqb-hklmpkml.yp | tr khplmndvqyc nirtelacufj
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
