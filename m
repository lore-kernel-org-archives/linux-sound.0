From: =?iso-8859-1?Q?Rog=E9rio?= Brito <rbrito@ime.usp.br>
Date: Wed, 27 Jul 2005 23:58:19 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050727235818.GC31781@ime.usp.br>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <42E6645B.30206@zabbo.net> <20050726233837.459A.3.NOFFLE@islands.iskon.hr> <1122506920.22844.10.camel@mindpipe>
In-Reply-To: <1122506920.22844.10.camel@mindpipe>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lee Revell <rlrevell@joe-job.com>
Cc: Zoran Dzelajlija <jelly+news@srk.fer.hr>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

On Jul 27 2005, Lee Revell wrote:
> On Wed, 2005-07-27 at 01:38 +0200, Zoran Dzelajlija wrote:
> > The OSS maestro driver works better on my old Armada E500 laptop.
> > I tried ALSA after switching to 2.6, but the computer hung with
> > 2.6.8.1 or 2.6.10 if I touched the volume buttons.
>=20
> Please test a newer ALSA version, like the one in 2.6.12.

I have an Armada V300 laptop that uses the maestro2 chipset (and I
wouldn't be surprised if your E500 used that very same chip) and it
works fine with the ALSA provided in kernels since the 2.6.10-mm era
(actually, I think it worked fine with even earlier kernels, but I am
not sure).


Just another datapoint, Rog=E9rio.

--=20
Rog=E9rio Brito : rbrito@ime.usp.br : http://www.ime.usp.br/~rbrito
Homepage of the algorithms package : http://algorithms.berlios.de
Homepage on freshmeat:  http://freshmeat.net/projects/algorithms/
