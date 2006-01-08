From: Olivier Galibert <galibert@pobox.com>
Date: Sun, 08 Jan 2006 02:03:35 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20060108020335.GA26114@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl> <mailman.1136368805.14661.linux-kernel2news@redhat.com> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl> <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de> <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de>
In-Reply-To: <s5h8xtshzwk.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, Jan 07, 2006 at 03:32:27PM +0100, Takashi Iwai wrote:
> Yes, it's a known problem to be fixed.  But, it's no excuse to do
> _everything_ in the kernel (which OSS requires).

OSS does not require to do anything in the kernel except an entry
point.


> And if the application doesn't support, who and where converts it?
> With OSS API, it's a job of the kernel.

Once again no.  Nothing prevents the kernel to forward the data to
userland daemons depending on a userspace-uploaded configuration.

  OG.
