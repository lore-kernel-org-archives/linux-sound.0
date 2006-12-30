From: "Michael S. Tsirkin" <mst@mellanox.co.il>
Date: Sat, 30 Dec 2006 17:47:47 +0000
Subject: Re: No sound in KDE with intel hda since 2.6.20-rc1
Message-Id: <20061230174747.GB4637@mellanox.co.il>
List-Id: <linux-sound.vger.kernel.org>
References: <1167411986.6309.80.camel@chimay>
In-Reply-To: <1167411986.6309.80.camel@chimay>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?Q?Beno=EEt?= Rouits <brouits@free.fr>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, PeiSen Hou <pshou@realtek.com.tw>

> > > Since 2.6.20-rc1 (tested both -rc1 and rc2), system notification sounds under
> > > KDE, and sound in games (e.g. TuxPaint) no longer seem to work on my T60
> > > thinkpad. Works fine under 2.6.19 though.  The strange thing is e.g. Amarok
> > > still plays music fine.
> > 
> > Tis is on Kubuntu 6.06, BTW.
> > 
> 
> Hello,
> I think your kernel is Ok with your sound card.
> The problem is from KDE.
> 
> I suggest you look at: 
> - your "KDE control center" => sound system and configure ArtsD
> - verify Amarok's preferences to see if ALSA or ArtsD are used.
> cheers.

Don't really see anything strange there.
KDE is set to ALSA. Amarok is set to autodetect.

Why would things work fine when I switch back to 2.6.19?

-- 
MST
