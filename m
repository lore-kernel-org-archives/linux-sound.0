From: Hannu Savolainen <hannu@opensound.com>
Date: Mon, 09 Jan 2006 00:33:43 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601090231260.32511@zeus.compusonic.fi>
List-Id: <linux-sound.vger.kernel.org>
References: <20060104030034.6b780485.zaitcev@redhat.com>
 <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de>
 <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de>
 <20060108020335.GA26114@dspnet.fr.eu.org> <Pine.LNX.4.60.0601080317040.22583@kepler.fjfi.cvut.cz>
 <20060108132122.GB96834@dspnet.fr.eu.org> <Pine.LNX.4.61.0601081424560.10981@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081424560.10981@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Olivier Galibert <galibert@pobox.com>, Martin Drab <drab@kepler.fjfi.cvut.cz>, Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 8 Jan 2006, Jaroslav Kysela wrote:

> > - having a real kernel api for which you can make different libraries
> >   depending on the need of the users
> > 
> > - stop making a fundamentally unsecure shared library mandatory
> 
> ALSA kernel API is real and binary compatible. 
Less than an year ago you (or was it Takashi) told that the kernel API 
cannot be used or documented because it may be changed any time without 
notice.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
OH2GLH QTH: Karkkila, Finland LOC: KP20CM
