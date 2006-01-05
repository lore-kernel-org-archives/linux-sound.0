From: Lee Revell <rlrevell@joe-job.com>
Date: Thu, 05 Jan 2006 18:56:45 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <1136487406.31583.35.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <20060103193736.GG3831@stusta.de>
	 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
	 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
	 <20060104030034.6b780485.zaitcev@redhat.com>
	 <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
	 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
	 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
	 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Tomasz =?iso-8859-2?Q?K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

On Thu, 2006-01-05 at 16:07 +0100, Tomasz K=B3oczko wrote:
> - KNOWN FACT is OSS provides simpler API for user space for handle
>    usual cases.
>    Why Linux can't provide only OSS API abstraction for user space
>    application ? And/or why ALSA developers want to replace this by
>    mostly bloated and pourly documented ALSA user space API ?
>=20

Please, stop with the documentation thing.  ALSA is perfectly well
documented.  I guess the problem is that you googled "ALSA
documentation" and this page didn't come up as the first hit (or even on
the first page):

http://www.alsa-project.org/alsa-doc/alsa-lib/index.html

This is a Google bug.  I suspect that the copius inter-document links
that Doxygen creates causes Google to think someone is trying to spam it
and penalizes the result.

Lee


