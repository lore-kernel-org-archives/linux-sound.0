From: =?iso-8859-1?Q?J=F6rn?= Nettingsmeier
Date: Wed, 30 Jan 2002 12:09:20 +0000
Subject: Re: ibm notebook RS/6000 860 sound/vga/trackpoint problems
Message-Id: <marc-linux-sound-101239258017419@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101233686922268@msgid-missing>
In-Reply-To: <marc-linux-sound-101233686922268@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Alexey wrote:
>=20
> > im using the module cs4232 from 2.4.7-pre6 from bitkeeper-tree
> > i load the module with this parameters:
> > cs4232 io=3D0x830 irq=10 dma=3D6 dma2=3D7
>=20
> This module is rather old, and, it seems to me, buggy. I have a card based
> on CS4232 chipset, and I couldn't make it work propertly (it began playing
> something, but not for a long time :)
>=20
> A piece of advice: just try to use ALSA (advanced linux sound arch.) modu=
les.
> <www.alsa-project.org>. Take the stable version, compile it --with-oss,
> --with-cards=3Dcs4232 (may be there is another driver, a bit more suitabl=
e),

imho, it's better to take 0.9.0beta. it's at least as stable as the
old stuff, and 0.5.x is really obsolete.

> then edit your modules.conf file according to the INSTALL instructions,
> run depmod.
>=20
> modprobe snd-card-cs4232

iirc, this has been renamed to snd-cs4232 in the latest alsa
releases (as requested by linus for inclusion in the kernel).

if in doubt about module names, look in
/lib/modules/<your-kernel-version>/kernel/sound/=20
(used to be kernel/misc).

when you insert a module with modprobe, leave out the .o extension.

regards,

j=F6rn


btw: have you heard about the linux-audio-user list ?
that one is more active than linux-sound. information can be found
here:
http://www.linuxdj.com/audio/lad/user.php3

there is also a developer's list:
http://www.linuxdj.com/audio/lad/


--=20
J=F6rn Nettingsmeier    =20
home://Kurf=FCrstenstr.49.45138.Essen.Germany     =20
phone://+49.201.491621
http://spunk.dnsalias.org
http://www.linuxdj.com/audio/lad/
