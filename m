From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 31 Jul 2005 19:29:29 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050731192929.GG3608@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <105c793f050726091722f3cbb2@mail.gmail.com>
In-Reply-To: <105c793f050726091722f3cbb2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrew Haninger <ahaning@gmail.com>
Cc: linux-kernel@vger.kernel.org, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com

On Tue, Jul 26, 2005 at 12:17:14PM -0400, Andrew Haninger wrote:
> On 7/26/05, Adrian Bunk <bunk@stusta.de> wrote:
> >  config SOUND_OPL3SA2
> >         tristate "Yamaha OPL3-SA2 and SA3 based PnP cards"
> > -       depends on SOUND_OSS
> > +       depends on SOUND_OSS && OBSOLETE_OSS_DRIVER
> >         help
> >           Say Y or M if you have a card based on one of these Yamaha so=
und
> >           chipsets or the "SAx", which is actually a SA3. Read
> Forgive me if I'm misreading this (I'm hardly a coder and no kernel
> hacker) but, as it stands, the OPL3SA2 driver provided by ALSA and the
> main kernel tree work but are not correctly detected by ALSA's
> detection routines (in alsaconf) on the 2.6 kernel. The OSS drivers
> work, as well, but (AFAIK) there are no methods of automatic
> configuration with the OSS drivers.
>=20
> So, for people who don't feel like configuring ALSA with their OPL3SA2
> card, the OSS modules may be easier to configure and thus should be
> left in until the ALSA/2.6 kernel problems are worked out with the
> OPL3SA2.

This is kernel bug #3117 [1] / ALSA bug #879 [2]?

> -Andy

cu
Adrian

[1] http://bugzilla.kernel.org/show_bug.cgi?id117
[2] https://bugtrack.alsa-project.org/alsa-bug/view.php?id=879

--=20

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

