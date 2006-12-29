From: =?ISO-8859-1?Q?Beno=EEt?= Rouits <brouits@free.fr>
Date: Fri, 29 Dec 2006 17:06:26 +0000
Subject: Re: No sound in KDE with intel hda since 2.6.20-rc1
Message-Id: <1167411986.6309.80.camel@chimay>
List-Id: <linux-sound.vger.kernel.org>
References: <20061229062559.GB16659@mellanox.co.il>
	 <20061229071819.GB19327@mellanox.co.il>
In-Reply-To: <20061229071819.GB19327@mellanox.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Michael S. Tsirkin" <mst@mellanox.co.il>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, PeiSen Hou <pshou@realtek.com.tw>

Hello,
I think your kernel is Ok with your sound card.
The problem is from KDE.

I suggest you look at: 
- your "KDE control center" => sound system and configure ArtsD
- verify Amarok's preferences to see if ALSA or ArtsD are used.
cheers.

Le vendredi 29 décembre 2006 à 09:18 +0200, Michael S. Tsirkin a écrit :
> > Since 2.6.20-rc1 (tested both -rc1 and rc2), system notification sounds under
> > KDE, and sound in games (e.g. TuxPaint) no longer seem to work on my T60
> > thinkpad. Works fine under 2.6.19 though.  The strange thing is e.g. Amarok
> > still plays music fine.
> 
> Tis is on Kubuntu 6.06, BTW.
> 

