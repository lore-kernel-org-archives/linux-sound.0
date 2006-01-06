From: Zan Lynx <zlynx@acm.org>
Date: Fri, 06 Jan 2006 01:21:49 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <1136510509.9382.24.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-fuwTEsj+aADdkIJR3NtG"
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <20060103193736.GG3831@stusta.de>
	 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
	 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
	 <20060104030034.6b780485.zaitcev@redhat.com>
	 <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
	 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
	 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
	 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
	 <s5hmziaird8.wl%tiwai@suse.de>
	 <Pine.LNX.4.61.0601060028310.27932@zeus.compusonic.fi>
	 <1136504460.847.91.camel@mindpipe>
	 <4A284096-E889-4E6D-B017-B8241CD72A0D@dalecki.de>
In-Reply-To: <4A284096-E889-4E6D-B017-B8241CD72A0D@dalecki.de>
To: Marcin Dalecki <martin@dalecki.de>
Cc: Lee Revell <rlrevell@joe-job.com>, Hannu Savolainen <hannu@opensound.com>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


--=-fuwTEsj+aADdkIJR3NtG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-01-06 at 01:14 +0100, Marcin Dalecki wrote:
> On 2006-01-06, at 00:40, Lee Revell wrote:
> > Hey, interesting, this is exactly what dmix does in userspace.  And we
> > have not seen any bug reports caused by the concept of userspace =20
> > mixing
> > (just implementation bugs like any piece of software).
>=20
> This attitude that every kind of software has to have bugs is
> blunt idiotic tale-tale bullshit just showing off complete incompetence.
>=20
> Does the acronym car-ABS and micro-controller maybe perhaps ring a =20
> bell for you?=20

Funny that you should mention bug-free code and ABS.

Just a few months ago, Subaru updated the ABS controller code for the
WRX.  They sent me the notice in the mail.  It was an optional upgrade,
the change was only needed to fix some very odd corner cases. =20

The point being that even critical micro-controller software has bugs.

Even software that has been mathematically proofed can have bugs.  Knuth
uses it as a joke: "Beware bugs in the above code.  I have
proven it correct; I have not actually tried it."

It's so funny because it's so true.
--=20
Zan Lynx <zlynx@acm.org>

--=-fuwTEsj+aADdkIJR3NtG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDvcYtG8fHaOLTWwgRArPmAKCsDiU38AkUoFRz0Ya/HpTA/GDlSQCgq400
j63fFXfcnLULwCamSEDUTFs=
=53Md
-----END PGP SIGNATURE-----

--=-fuwTEsj+aADdkIJR3NtG--

