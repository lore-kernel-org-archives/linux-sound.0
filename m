From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 07 Jan 2006 14:32:27 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <s5h8xtshzwk.wl%tiwai@suse.de>
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
	<s5hmziaird8.wl%tiwai@suse.de>
	<Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Tomasz =?ISO-8859-2?Q?K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

At Thu, 5 Jan 2006 21:13:25 +0100 (CET),
Tomasz K=B3oczko wrote:
>=20
> [..]
> >>> It means that you are saying that kernel should be bigger and bigger.
> >>> Please, see the graphics APIs. Why we have X servers in user space (a=
nd
> >>> only some supporting code is in the kernel) then? It's because if we
> >>> would move everything into kernel it will be even more bloated. The k=
ernel
> >>> should do really the basic things like direct hardware access, DMA
> >>> transfer etc.
> >>
> >> List all neccessary feactures and abstract them. Below this layer you
> >> can plug to this all device drivers. Where is the problem ?
> >> Cureent way moves some importand details like mixing to user space
> >> library.
> >> All abstraction are NOW coded but some parts of this abstraction are on
> >> library level and you are wrong because this still ONE abstraction
> >> (not multiple/growing).
> >> Moving some patrs of this abstraction to user space level DISSALLOW se=
cure
> >> manage because you do not have *single point of entry to this layer*. =
Try
> >> plug library abstraction to SELinux layer. Can you do this with ALSA w=
ay ?
> >
> > I don't understand this.  The alsa-lib doesn't skip the h/w access.
> > It still accesses the device file as usual, open/close/ioctls.  If the
> > h/w to do softmix is restricted, you can't use it, too.
> > Or, am I missing something else?
>=20
> Soft mixing is performed by writing to allocated shared memory block.
> Try to use SELinux on dissalow use SHM only for mixing souds.
> In case performing ALL (possible) mixing tricks you have SINGLE point of =

> entry from any application. Using SHM with r/w permission allow one
> allicattions dump sound streams writed by other applications.

Yes, it's a known problem to be fixed.  But, it's no excuse to do
_everything_ in the kernel (which OSS requires).


> >> If you have sound device with hardware mixer(s) ALSA now work
> >> transparently.
> >> If you have sound device without this soft mixing is moved to user spa=
ce
> >> .. but  applications do not need know about this even now because all
> >> neccessary details are handled on library level. Is it ?
> >> So question is: why the hell *ALL* mixing details are not moved to ker=
nel
> >> space to SIMPLE and NOT GROWING abstraction ?
> >
> > Because many people believe that the softmix in the kernel space is
> > evil.  The discussion aboult this could be a long thread.
>=20
> Moment .. are you want to say: there is no compact mixing abstraction=20
> layer in ALSA because because ALSA is developed by believers ? (not=20
> technicians/enginers ?)
> Sorry .. be so kind and try to answer on my question using only stricte=20
> *technical arguments*.

I stated above because I know it will be a discussion without a clear
end.  From the convenence viewpoint, doing everthing in the kernel
including the software mixing is fine.  But, do you want to it -- to
do EVERTHING in the kernel with a great risk of system down and the
programming restrictions (no FP, etc)?


> > Because OSS API doesn't cover many things.  For example,
> >
> > - PCM with non-interleaved formats
> > - PCM with 3-bytes-packed 24bit formats
>=20
> Not true. Download OSS from opensound. You can find in soundcard.h=20
> AFMT_S24_PACKED define.

And if the application doesn't support, who and where converts it?
With OSS API, it's a job of the kernel.

> > These functions are popluar on many sound devices.
> >
> > In addition, imagine how you would implement the following:
> >
> > - Combination of multiple devices
> > - Split of channels to concurrent accesses
> > - Handling of floating pointer samples
> > - Post/pre-effects (like chorus/reverb)
>=20
> Are you want say something like: architesture of OSS is so bad there is n=
o=20
> civilized way for extending this ? (except: chorus/reverb are now handled=
=20
> by comercial OSS).
> Correct me if I'm wrong: his not true.

Could you tell me how do you handle the floating point in the kernel
code?

> This unhides one fact: *ALSA and OSS are mostly izomorphic* (look on=20
> similarities ALSA and OSS device drivers architecture).
>=20
> And if it is true there was/is no strong arguments for droping OSS and=20
> replace this by ALSA. As I sayd ALSA is only on Linux. Using OSS allow=20
> easier develpment soud support in user space applications for some group =

> of currently used unices. This is IMO strong argument .. much stronger=20
> than existing or not group of belivers. For me now switching to ALSA have=
=20
> only *political groud* .. nothing more. Interesting .. how long Linux can=
=20
> survive without looking on some economic aspects ?

Don't get me wrong.  I, as ALSA developer, don't believe that OSS API
would disappear.  The API will remain.  But the implementation may
change.  That's all what is happening -- Adrian has asked to drop the
codes which are implemented differently (on ALSA).  No one requested
to drop the API support.


Takashi
