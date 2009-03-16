From: Krzysztof Helt <krzysztof.h1@wp.pl>
Date: Mon, 16 Mar 2009 18:21:56 +0000
Subject: Re: [PATCH] Fix NULL dereference when suspending snd_opl3sa2
Message-Id: <20090316192156.80709aff.krzysztof.h1@wp.pl>
List-Id: <linux-sound.vger.kernel.org>
References: <1237197709.7210.2.camel@localhost.localdomain>
	<1237212968.11067.3.camel@localhost.localdomain>
In-Reply-To: <1237212968.11067.3.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Krzysztof Helt <krzysztof.h1@wp.pl>, stable@kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Mon, 16 Mar 2009 15:16:08 +0100
Lubomir Rintel <lkundrak@v3.sk> wrote:

> On Mon, 2009-03-16 at 11:01 +0100, Lubomir Rintel wrote:
> > This should fix the following OOPS:
> > http://www.kerneloops.org/raw.php?rawid=80591&msgid>=20

>=20
> This is the same issue, with 2.6.28:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bugQ9939
>=20
>=20

I'll look into this.

Regards,
Krzysztof
