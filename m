From: Paul Laufer <pelaufer@csupomona.edu>
Date: Tue, 28 Mar 2000 06:22:28 +0000
Subject: Re: [Patch] sb_card.c, take 2
Message-Id: <marc-linux-sound-95422511826202@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95420636815936@msgid-missing>
In-Reply-To: <marc-linux-sound-95420636815936@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Tue, 28 Mar 2000, [iso-8859-15] Ga=EBl Qu=E9ri wrote:

> On Mon, Mar 27, 2000 at 04:11:17PM -0800, Paul Laufer wrote:
> > Hello again,
> > (...)
> >=20
> > Please send me your feedback. And I don't have any CMI, Diamond, or ALS
> > cards to test this with either. So if you have one please test :)
>=20
> OK so it works with my ALS007 with the diff I include below,
> except that the 16 bit dma is set to 0 (there is no such dma on ALS007)
> But for now it's harmless...
>=20
> Also there will be a problem with mpu401 because at least the ALS007
> has a separate irq for that.
>=20
> Anyway thanks for that cleanup...
>=20
> regards, gael

Thanks for the ALS isapnp info, your diff will be included.  Could you do
me a favor and send me your /proc/isapnp for the ALS007? It should help me
deal with the rest of the problems.

Thanks,
Paul Laufer
