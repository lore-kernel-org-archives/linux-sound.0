From: Paul Laufer <pelaufer@csupomona.edu>
Date: Tue, 28 Mar 2000 08:44:25 +0000
Subject: Re: [Patch] sb_card.c cleanup
Message-Id: <marc-linux-sound-95423320131587@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95415246500376@msgid-missing>
In-Reply-To: <marc-linux-sound-95415246500376@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Mon, 27 Mar 2000, [iso-8859-15] Ga=EBl Qu=E9ri wrote:

> On Mon, Mar 27, 2000 at 02:19:17AM -0800, Paul Laufer wrote:
> > Hey all,
> >=20
> > Alex told me to redo my previous sb_card.c cleanup patch after he got h=
is
> > into the kernel. So here is a new version, against 2.3.99pre3.
> >=20
> > Overview: After Alex's last patch the various sb_init_* functions were
> > quite redundant, so I've written a generic sb_init function.  I also
> > reorganized sb_isapnp_list.  I raided the ALSA drivers for all the ISAP=
nP
> > codes for CTL and ESS chips and added them to the table (as I believe A=
lan
> > suggested). Also returns the 2.3.99pre2 dev->active behavior, which was
> > necessary to detect two of the same type of cards (Alex changed that in
> > his last patch). I cut out some redundant code in probe_sb(), and clean=
ed
> > up sb_isapnp_init(). Finally, I cleaned up the ISAPnP card detection
> > procedure by dumping the audio device detection procedure and just using
> > card detection (which should be okay since we have all the card ids).  =

> > The overall result of this patch is a larger sb_isapnp_list with much l=
ess
> > duplicated code - which I believe to be a good trade off. Have a look a=
nd
> > please let me know what ya think, how it works for you, and/or if there=
 is
> > something I missed.
>=20
> That's great !!! sb_card.c was a bloat of nearly identical sb_init_*
> functions...
>=20
> But the problem is the nearly... Some cards are really broken in
> the sense that irq_resource[0] !=3D dma and irq_resource[1] !=3D dma2...
> For example the ALS007 doesn't have a dma2 but that's
> possible to fix it...
>=20
> But in the vanilla sb_card.c from 2.3.99-pre3 you can see that the
> ALS100 has dma =3D irq_resource[1] and dma2 =3D irq_resource[0]...  =20
> I really hope this was a typo because this would oblige us to put
> some new members in the struct of isapnp_list...

Hrm, looking at the ALSA als100 driver, they use dma_resource[1] =3D dma and
dma_resource[0] =3D dma2:

        snd_dma8[dev] =3D pdev->dma_resource[1].start;
        snd_dma16[dev] =3D pdev->dma_resource[0].start;

So, no typo. I guess the only thing to do is add another entry to
sb_isapnp_list... The ALS110, 120, and RTL3000 are the same way, it seems.
Do you know about the ALS200? It was in your diff but not mentioned in the
alsa driver, so I'm not sure if it has the same "backwardness" as the
ALS100.

> For the ALS007 the problem is that dma2 is set to 0, which is a valid
> dma. It works for me because I don't have anything using dma 0 but
> it's definitely not a good thing...
> The solution would be to set dma2 to -1 when we are sure it is not
> used but I didn't found an obvious way to do it...
> What I propose is replacing
>=20
> 	hw_config->dma2 =3D sb_dev->dma_resource[1].start;
>=20
> by
>=20
> 	if (sb_dev->dma_resource[1].child)
> 		hw_config->dma2 =3D sb_dev->dma_resource[1].start;
> 	else
> 		hw_config->dma2 =3D -1;
>=20
>=20
> Here I assume that normally dma_resource[1] is the child of dma_resource[=
0]
> but I can't test it... all my devices have only one irq and one dma.
> So please someone tell me if that portion of code is warranted to pick
> the dma2 in ALL the cards which have one, or if there is a better way
> to do it
>=20
>=20
> thanks, gael

Well, hrm. Looking back over 2.3.99pre3 vanilla I that I missed this
completely. I should have paid more attention. I also see that the ESS and
CTL cards swap locations of the fm and mpu resource locations. I've just
fixed that with more isapnp_list members . . .

It does not appear that isapnp sets resource.child or resource.sibling.
I'll just add another member to isapnp_list. . .

Dangit, now things are getting complicated again. Still, I think
maintaining a table is easier than maintaining a mess of sb_init
functions.

Anyway, I'll get out a new patch soon.

Thanks!
Paul Laufer
