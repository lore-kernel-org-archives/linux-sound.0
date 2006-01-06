From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Fri, 06 Jan 2006 00:22:48 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <43BDB858.5060500@folkwang-hochschule.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de> <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl> <mailman.1136368805.14661.linux-kernel2news@redhat.com> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl> <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <43BDA02F.5070103@folkwang-hochschule.de> <20060105234951.GA10167@dspnet.fr.eu.org>
In-Reply-To: <20060105234951.GA10167@dspnet.fr.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Olivier Galibert <galibert@pobox.com>, Joern Nettingsmeier <nettings@folkwang-hochschule.de>, Tomasz K?oczko <kloczek@rudy.mif.pg.gda.pl>, Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

Olivier Galibert wrote:
> On Thu, Jan 05, 2006 at 11:39:43PM +0100, Joern Nettingsmeier wrote:
>> modem dialup users know better than to chime in to networking core=20
>> discussions and complain they don't need all that complexity. why do=20
>> professional audio users always have to put up with people who only=20
>> listen to mp3s whining about a complicate API?
>=20
> Funnily enough, people who added SIGIO and epoll did not remove
> select nor limited its capabilities.
>=20
> The ALSA api has issues, whether you want to acknowledge them or not.
> The OSS api has issues too, of course.  But it is there to stay, and
> it has advantages in some situations, like when simplicity or not
> depending on a shared library matters.  Ignoring it is stupid.  Doing
> your best to cripple it is stupid.  The OSS api is an entrypoint in
> the sound system as valid and important than others.

agreed. nobody doubts this. a long time ago, this thread was about=20
removing obsolete *drivers*. that is orthogonal to the api issue.

then people starting whining about bugs in the alsa oss layer, while=20
being too lazy to file bug reports. nobody wants to "cripple" this api,=20
saying so is just stupid FUD and rather offensive.

then somebody started an api discussion, where *oss* was represented=20
quite fairly. it does have its nice sides. but to me it looks like most=20
of the people bashing *alsa* for its complexity have not understood the=20
problems it tries to (and does) solve.

shuffle 16 tracks of 24bit 48k audio in and out of the machine at a=20
latency where a professional drummer will not complain, with routing=20
options adequate for professional work, and then let's see how simple=20
your API is.
for those audio-challenged people out there: recall the tcp-offloading=20
discussions in the networking layer. nobody wants to do it, and they can=20
get away with it, because it does not buy you much and fucks up the api=20
big time.
in audioland, you have all kinds of funky shit going on in the hardware,=20
and you can't say, no we don't support that, to inelegant, because then=20
your stuff just can't compete.
hardware peculiarities cannot be abstracted away without sacrificing=20
efficiency, and this makes for a complicated api.

instead people keep whining and talk about headsets not working. sheesh.
tomasz, your impressive arithmetic with years is quite correct, but your=20
data is wrong. there have been years of development before alsa ever=20
came near the kernel. stop bitching, read up on some stuff (for=20
instance, find out about how different the gizmos i mentioned actually=20
are), get your facts straight. if by then you should happen to develop a=20
real interest in audio matters, the linux-audio-* lists welcome your=20
questions and contributions.


--=20
j=F6rn nettingsmeier

home://germany/45128 essen/lortzingstr. 11/
http://spunk.dnsalias.org
phone://+49/201/491621

if you are a free (as in "free speech") software developer
and you happen to be travelling near my home, drop me a line
and come round for a free (as in "free beer") beer. :-D
