From: David Nedved <dnedved@nuvox.net>
Date: Fri, 29 Jun 2001 17:33:17 +0000
Subject: Re: Strange issue with opl3sa2 driver under linux 2.4.4
Message-Id: <marc-linux-sound-99383619620156@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99375164302844@msgid-missing>
In-Reply-To: <marc-linux-sound-99375164302844@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Merci beaucoup J=E9r=F4me!  You are indeed correct, somehow you saw through=
 my
rantings, and although I thought I had tested everything extensively and
scientifically, it does indeed work with 0x370...

Now I have an alias in /etc/modules.conf so that all I have to do is=20
modprobe opl3sa2 and everything works... if you don't mind I'd like to ask a
few questions about getting it a little more automated...

1.) any idea how to get it automatically inserted when I try to use the sou=
nd
    card?  (For ethernet cards I know you alias eth0 to the driver name,=20
    but aliasing dsp and sound to opl3sa2 don't seem to work)
2.) any ideas how to avoid the "opl3sa2: Control I/O port 0x370 is not free"
    messages since they are apparently bogus?
3.) any ideas what to do to make it work when compiled into the kernel?
    a line in lilo to pass parameters to the kernel?

Thanks again,

David

On Thu, Jun 28, 2001 at 09:04:29PM +0200, J=E9r=F4me Aug=E9 wrote:
> David Nedved wrote:
> >=20
> > Hi all,
> >=20
> > I'm trying to get sound working on my laptop, and  I'm having some stra=
nge
> > problems getting it work as expected, and I hope that you can give me s=
ome
> > insight.  I have a Toshiba Libretto 70CT, which is one of the hardware
> > platforms that is mentioned as working in the docs... I CAN get sound o=
ut of
> > it, but only after a strange ritual...
> >=20
> > I have to do this to get it to work:
> >=20
> > #modprobe opl3sa2 io=3D0x220 mss_io=3D0x530 mpu_io=3D0x330 irq=3D5 dma=
=3D1 dma2=3D0
> > opl3sa2: Control I/O port 0x220 is not a YMF7xx chipset!
> > #modprobe opl3sa2 io=3D0x370 mss_io=3D0x530 mpu_io=3D0x330 irq=3D5 dma=
=3D1 dma2=3D0
> > opl3sa2: Control I/O port 0x370 is not free
> > opl3sa2: Control I/O port 0x370 is not free
> > opl3sa2: Control I/O port 0x370 is not free
> > #modprobe opl3sa2 io=3D0x220 mss_io=3D0x530 mpu_io=3D0x330 irq=3D5 dma=
=3D1 dma2=3D0
> >=20
> > notice that I have to modprobe it FIRST at 0x370, it fails, then it will
> > insert into 0x220!  I have verified all the settings through both the B=
IOS
> > setup utility and by dual-booting into Windows98.
> >=20
> > This is with kernel version 2.4.4.  Do you have any idea about why it is
> > acting so strange upon inserting?  In /proc/ioports it lists 0x370 as b=
elonging
> > to OPL3-SA3, and 0x220 is not listed, however 0x220 is
> > the address that it ends up working under both in Windows98 and Linux.
> >=20
> > Thanks very much, I really hope you have some idea how to work around t=
his
> > more elegantly (so that maybe I can boot and have sound without typing =
all
> > that junk!)  If there's anything I can do to experiment around that wou=
ld help
> > others, just let me know and I'll be happy to do it.
> >=20
>=20
> Are you sure it really fails when modprobing at 0x370 ?
>=20
> Try to modprobe at 0x370 and immediatly look at the output of "lsmod" to
> see if the driver is really loaded or not ... ???
>=20
> --=20
> J=E9r=F4me Aug=E9
> echo cdqgm@vnqb-hklmpkml.yp | tr khplmndvqyc nirtelacufj
> -
> To unsubscribe from this list: send the line "unsubscribe linux-laptop" in
> the body of a message to majordomo@vger.kernel.org
>=20
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
