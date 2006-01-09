From: Thierry Vignaud <tvignaud@mandriva.com>
Date: Mon, 09 Jan 2006 17:49:49 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <m2ace5jnpe.fsf@vador.mandriva.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20060104030034.6b780485.zaitcev@redhat.com>
	<Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
	<Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
	<Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
	<Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
	<s5hmziaird8.wl%tiwai@suse.de>
	<Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl>
	<s5h8xtshzwk.wl%tiwai@suse.de> <20060108020335.GA26114@dspnet.fr.eu.org>
	<Pine.LNX.4.60.0601080317040.22583@kepler.fjfi.cvut.cz>
	<20060108132122.GB96834@dspnet.fr.eu.org>
In-Reply-To: <20060108132122.GB96834@dspnet.fr.eu.org> (Olivier Galibert's
	message of "Sun, 8 Jan 2006 14:21:22 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Galibert <galibert@pobox.com>
Cc: Martin Drab <drab@kepler.fjfi.cvut.cz>, Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Olivier Galibert <galibert@pobox.com> writes:

> - stop making a fundamentally unsecure shared library mandatory

do you speak about known vulnerabilities in ALSA lib or are you
trolling^h^h^h^h^h^h^h assuming that kernel code is safer than
userspace one?

afaic I don't assume this.
I'd prefer see bad code make one app crashing than oopsing the whole
machine.

