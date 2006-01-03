From: Tomasz Torcz <zdzichu@irc.pl>
Date: Tue, 03 Jan 2006 16:05:02 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060103160502.GB5262@irc.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="JYK4vJDZwFMowpUq"
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031441.27519.s0348365@sms.ed.ac.uk> <Pine.LNX.4.61.0601031548210.436@yvahk01.tjqt.qr> <200601031522.06898.s0348365@sms.ed.ac.uk>
In-Reply-To: <200601031522.06898.s0348365@sms.ed.ac.uk>
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2006 at 03:22:06PM +0000, Alistair John Strachan wrote:
> On Tuesday 03 January 2006 14:50, Jan Engelhardt wrote:
> > >The problem with using OSS compatibility, at least on this machine with
> > > ALSA 1.0.9, is that if you use it you automatically lose the software
> > > mixing capabilities of ALSA, so it really is less than ideal.
> >
> > Well, I am able to open /dev/dsp multiple times here without problems.
> > (Is /dev/dsp soft- or hardmixing?)
>=20
> As far as I'm aware, it depends on your hardware. For example, software m=
ixing=20
> kicks in with zero configuration on most hardware that won't mix in hardw=
are,=20
> e.g. my laptop's i810 audio.
>=20
> [alistair] 15:18 [~] cat /proc/asound/cards
> 0 [I82801DBICH4   ]: ICH4 - Intel 82801DB-ICH4
>                      Intel 82801DB-ICH4 with AD1981B at 0xa0100000, irq 11
> 1 [Modem          ]: ICH-MODEM - Intel 82801DB-ICH4 Modem
>                      Intel 82801DB-ICH4 Modem at 0x3400, irq 11
>=20
> I can successfully hear two mixed sources when I execute the following:
>=20
> ogg123 -q --device=3Dalsa09 01\ -\ Good\ Times\ Bad\ Times.ogg
>=20
> And on another terminal
>=20
> ogg123 -q --device=3Dalsa09 01\ -\ Good\ Times\ Bad\ Times.og
>=20
> This is ALSA soft mixing the two sources for me. Very nifty. However, if =
I=20
> throw an OSS into the mix (whilst these other two are playing).
>=20
> [alistair] 15:20 [~/Music/Led Zeppelin - I] ogg123 -q --device=3Doss 01\ =
-\=20
> Good\ Times\ Bad\ Times.ogg
> Error: Cannot open device oss.

 Proper way (using userspace OSS emulation):
aoss ogg123 -q --device=3Doss [...]

--=20
Tomasz Torcz                "Funeral in the morning, IDE hacking
zdzichu@irc.-nie.spam-.pl    in the afternoon and evening." - Alan Cox


--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: gpg --search-keys Tomasz Torcz

iD8DBQFDuqCuThhlKowQALQRAtznAJ0WS7D2YFJ/8F/WgWgXjd4P3rzmwgCeOAEs
dWJKMaY0Jt0wOQicCyT8RHE=
=05kY
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
