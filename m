From: "Joey Lee" <jlee@novell.com>
Date: Mon, 31 May 2010 04:34:26 +0000
Subject: Re: [PATCH] Add 92HD81B1X5 to stac92hd83xxx_cfg_tbl[] for mute
Message-Id: <4C03C8F2020000230001A57A@novprvlin0050.provo.novell.com>
List-Id: <linux-sound.vger.kernel.org>
References: <4C00F946020000230001A3FC@novprvlin0050.provo.novell.com>
In-Reply-To: <4C00F946020000230001A3FC@novprvlin0050.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-sound@vger.kernel.org

Hi Takashi, 

Yes, you are right! 
I just check the newest 2.6.34 drvier, it works fine and don't need this
quirk.


Thank's a lot!
Joey Lee

於 六，2010-05-29 於 21:47 +0200，Takashi Iwai 提到：
> At Sat, 29 May 2010 03:23:50 +0200,
> Joey Lee wrote:
> > 
> > Hi Takashi, 
> > 
> > The attached is my patch to 
> > 
> > Add 92HD81B1X5 subsystem id 0x103c1584 to stac92hd83xxx_cfg_tbl[] for
> > mute LED support on HP mini.
> > 
> > Please kindly help review it.
> > 
> > 
> > Thank's a lot!
> > Joey Lee
> > 
> > 
> > Add 92HD81B1X5 subsystem id 0x103c1584 to stac92hd83xxx_cfg_tbl[] for
> > mute LED support on HP mini.
> > 
> > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> 
> 2.6.34 driver should work without this quirk.  Could you check?
> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  sound/pci/hda/patch_sigmatel.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/sound/pci/hda/patch_sigmatel.c
> > b/sound/pci/hda/patch_sigmatel.c
> > index f1e7bab..18b75bd 100644
> > --- a/sound/pci/hda/patch_sigmatel.c
> > +++ b/sound/pci/hda/patch_sigmatel.c
> > @@ -1655,6 +1655,8 @@ static struct snd_pci_quirk
> > stac92hd83xxx_cfg_tbl[] = {
> >                       "unknown Dell", STAC_DELL_S14),
> >         SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x3600,
> >                       "HP", STAC_92HD83XXX_HP),
> > +       SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x1500,
> > +                       "HP", STAC_92HD83XXX_HP),
> >         {} /* terminator */
> >  };
> > 
> > -- 
> > 1.6.0.2
> > 
> > [2 Add-92HD81B1X5-to-stac92hd83xxx_cfg_tbl-for-mute-L.patch <text/plain (quoted-printable)>]
> > >From e32ef26f88d2a2217ce70e5a04bf5c1d9973649e Mon Sep 17 00:00:00 2001
> > From: Lee, Chun-Yi <jlee@novell.com>
> > Date: Thu, 27 May 2010 19:52:47 +0800
> > Subject: [PATCH] Add 92HD81B1X5 to stac92hd83xxx_cfg_tbl[] for mute LED support on HP mini
> > 
> > Add 92HD81B1X5 subsystem id 0x103c1584 to stac92hd83xxx_cfg_tbl[] for
> > mute LED support on HP mini.
> > 
> > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> > ---
> >  sound/pci/hda/patch_sigmatel.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
> > index f1e7bab..18b75bd 100644
> > --- a/sound/pci/hda/patch_sigmatel.c
> > +++ b/sound/pci/hda/patch_sigmatel.c
> > @@ -1655,6 +1655,8 @@ static struct snd_pci_quirk stac92hd83xxx_cfg_tbl[] = {
> >  		      "unknown Dell", STAC_DELL_S14),
> >  	SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x3600,
> >  		      "HP", STAC_92HD83XXX_HP),
> > +	SND_PCI_QUIRK_MASK(PCI_VENDOR_ID_HP, 0xff00, 0x1500,
> > +			"HP", STAC_92HD83XXX_HP),
> >  	{} /* terminator */
> >  };
> >  
> > -- 
> > 1.6.0.2
> > 

