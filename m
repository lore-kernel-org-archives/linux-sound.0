From: =?iso-8859-1?Q?J=E9r=F4me=20Aug=E9?= <jauge@club-internet.fr>
Date: Sat, 30 Jun 2001 00:44:06 +0000
Subject: Re: Strange issue with opl3sa2 driver under linux 2.4.4
Message-Id: <marc-linux-sound-99386179923833@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99375164302844@msgid-missing>
In-Reply-To: <marc-linux-sound-99375164302844@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

David Nedved wrote:
>=20
> Merci beaucoup J=E9r=F4me!  You are indeed correct, somehow you saw throu=
gh my
> rantings, and although I thought I had tested everything extensively and
> scientifically, it does indeed work with 0x370...
>=20
> Now I have an alias in /etc/modules.conf so that all I have to do is
> modprobe opl3sa2 and everything works... if you don't mind I'd like to as=
k a
> few questions about getting it a little more automated...
>=20
> 1.) any idea how to get it automatically inserted when I try to use the s=
ound
>     card?  (For ethernet cards I know you alias eth0 to the driver name,
>     but aliasing dsp and sound to opl3sa2 don't seem to work)
> 2.) any ideas how to avoid the "opl3sa2: Control I/O port 0x370 is not fr=
ee"
>     messages since they are apparently bogus?
> 3.) any ideas what to do to make it work when compiled into the kernel?
>     a line in lilo to pass parameters to the kernel?
>=20

:-)

1) here is the part for the sound from my modules.conf file :

alias sound-slot-0 opl3sa2
options sound dmabuf=3D1
alias midi opl3
options opl3 io=3D0x388
options opl3sa2 mss_io=3D0x530 irq=3D5 dma=3D1 dma2=3D0 mpu_io=3D0x330 io=
=3D0x370
ymode=3D1

2) I don't know ... I also get the 3 messages about 0x370 not free, so
I'll look into the driver and try to see what's wrong with the
initialization ...

3) If you build the opl3sa2 directly into the kernel you'll need to add
the "opl3sa2=3D<io>,<irq>,<dma>,<dma2>,<mssio>,<mpuio>" parameter to lilo.

mode details in /usr/src/linux/Documentation/sound/OPL3-SA2

--=20
J=E9r=F4me Aug=E9
echo cdqgm@vnqb-hklmpkml.yp | tr khplmndvqyc nirtelacufj
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
