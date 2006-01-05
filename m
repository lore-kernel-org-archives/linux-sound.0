From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Thu, 05 Jan 2006 22:39:43 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <43BDA02F.5070103@folkwang-hochschule.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de> <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl> <mailman.1136368805.14661.linux-kernel2news@redhat.com> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl> <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

Tomasz K=B3oczko wrote:
> List all neccessary feactures and abstract them. Below this layer you=20
> can plug to this all device drivers. Where is the problem ?

users want to use all the bells and whistles that modern sound hardware=20
has to offer. so "necessary features" roughly equals the union of all=20
the "cool ideas of the week" of all soundcard vendors.

please have a look at, say, the rme hammerfall cards, compare them with=20
ye olde sblive, then take a look at usb audio devices and for dessert,=20
take a peek into current firewire hardware.

then push up your sleeves, design a small and elegant little abstraction=20
mechanism that is maximally effective in all circumstances and makes all=20
hardware features usable, wrap it up nicely and submit it to linus.

i look forward to hearing back from you, in, oh, 2015 or so?

jaroslav, takashi and the other alsa developers have been toiling with=20
this for years, and i hate to see them having to take shit from people=20
who don't do anything more with their sound hardware than listen to mp3s=20
in stereo and can't imagine anything else.

granted, there is always room for improvement. the alsa guys are very=20
receptive towards constructive criticism, when it is backed with a=20
little insight. many linux audio developers have criticised the API for=20
the high initial barrier, and ALSA certainly does not score that high in=20
the "making simple things simple" department. but it does make=20
*complicated things possible*, and all those rants of "gimme back me=20
oss" usually ignore this.

modem dialup users know better than to chime in to networking core=20
discussions and complain they don't need all that complexity. why do=20
professional audio users always have to put up with people who only=20
listen to mp3s whining about a complicate API?

i'll always grant you far better taste and insight into kernel matters=20
than i will ever have, but hey: the library is in userspace. it does not=20
clutter the kernel. so rrreeelaax!


--=20
j=F6rn nettingsmeier

home://germany/45128 essen/lortzingstr. 11/
http://spunk.dnsalias.org
phone://+49/201/491621

if you are a free (as in "free speech") software developer
and you happen to be travelling near my home, drop me a line
and come round for a free (as in "free beer") beer. :-D
