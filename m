From: =?iso-8859-1?Q?J=F6rn?= Nettingsmeier
Date: Tue, 11 Jul 2000 19:10:58 +0000
Subject: Re: Ensonic AudioPCI sound card problems
Message-Id: <marc-linux-sound-96334265806594@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96332630904955@msgid-missing>
In-Reply-To: <marc-linux-sound-96332630904955@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

audiopci works perfectly with alsa.
make sure to determine the correct chip, there are es1370 and es1371
versions which need different drivers.
see alsa-user archives for details:
http://www.alsa-project.org/

regards,

j=F6rn



Jay Ts wrote:
>=20
> > I bought an Ensoniq AudioPCI and I can't make it work!
> >
> > I'm using Red Hat Linux 6.0 and I'm trying to install the sound card
> > with "sndconfig".
>=20
> I have an AudioPCI and I like it very much.  Since I already had the
> 4Front (commercial) driver, I skipped the free drivers included with
> Linux and after paying 4Front another $10 for the AudioPCI support,
> I've been using their driver without problems.
>=20
> Another possibility is to try the ALSA driver; I read on the web that
> it supports the AudioPCI.  Anyone want to comment on that?
>=20
> I don't know if it's possible to use the free OSS Linux driver; I'm
> just responding because I have an AudioPCI, and I want to say what
> works for me so far.
>=20
> - Jay Ts

--=20
J=F6rn Nettingsmeier    =20
Kurf=FCrstenstr. 49       =20
45138 Essen, Germany     =20
http://www.folkwang.uni-essen.de/~nettings/
