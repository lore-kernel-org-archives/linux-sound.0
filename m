From: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Date: Thu, 05 Jan 2006 20:13:25 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1782304796-1136492005=:15077"
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de>
In-Reply-To: <s5hmziaird8.wl%tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1782304796-1136492005=:15077
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable

[..]
>>> It means that you are saying that kernel should be bigger and bigger.
>>> Please, see the graphics APIs. Why we have X servers in user space (and
>>> only some supporting code is in the kernel) then? It's because if we
>>> would move everything into kernel it will be even more bloated. The ker=
nel
>>> should do really the basic things like direct hardware access, DMA
>>> transfer etc.
>>
>> List all neccessary feactures and abstract them. Below this layer you
>> can plug to this all device drivers. Where is the problem ?
>> Cureent way moves some importand details like mixing to user space
>> library.
>> All abstraction are NOW coded but some parts of this abstraction are on
>> library level and you are wrong because this still ONE abstraction
>> (not multiple/growing).
>> Moving some patrs of this abstraction to user space level DISSALLOW secu=
re
>> manage because you do not have *single point of entry to this layer*. Try
>> plug library abstraction to SELinux layer. Can you do this with ALSA way=
 ?
>
> I don't understand this.  The alsa-lib doesn't skip the h/w access.
> It still accesses the device file as usual, open/close/ioctls.  If the
> h/w to do softmix is restricted, you can't use it, too.
> Or, am I missing something else?

Soft mixing is performed by writing to allocated shared memory block.
Try to use SELinux on dissalow use SHM only for mixing souds.
In case performing ALL (possible) mixing tricks you have SINGLE point of=20
entry from any application. Using SHM with r/w permission allow one
allicattions dump sound streams writed by other applications.

>> If you have sound device with hardware mixer(s) ALSA now work
>> transparently.
>> If you have sound device without this soft mixing is moved to user space
>> .. but  applications do not need know about this even now because all
>> neccessary details are handled on library level. Is it ?
>> So question is: why the hell *ALL* mixing details are not moved to kernel
>> space to SIMPLE and NOT GROWING abstraction ?
>
> Because many people believe that the softmix in the kernel space is
> evil.  The discussion aboult this could be a long thread.

Moment .. are you want to say: there is no compact mixing abstraction=20
layer in ALSA because because ALSA is developed by believers ? (not=20
technicians/enginers ?)
Sorry .. be so kind and try to answer on my question using only stricte=20
*technical arguments*.

> (snip)
>> In case ALSA now questions are very basic:
>>
>> - all hardware mixers are very simillar with very izomorphic interface
>>    (read this as: this can be very easy abstracted) and we have only one
>>    other case with soft mixing when this hardwware must be emulated in
>>    software .. so all this details can be rolled to one leyer on kernel
>>    level.
>>    So: why all mixing details are not in kernel space ?
>
> The problem is not the interface but the implementation.

Hmm .. if "ALSA is developed by belivers" slowny now I undestand .. all=20
this :>

[..]
> Because OSS API doesn't cover many things.  For example,
>
> - PCM with non-interleaved formats
> - PCM with 3-bytes-packed 24bit formats

Not true. Download OSS from opensound. You can find in soundcard.h=20
AFMT_S24_PACKED define.

> These functions are popluar on many sound devices.
>
> In addition, imagine how you would implement the following:
>
> - Combination of multiple devices
> - Split of channels to concurrent accesses
> - Handling of floating pointer samples
> - Post/pre-effects (like chorus/reverb)

Are you want say something like: architesture of OSS is so bad there is no =

civilized way for extending this ? (except: chorus/reverb are now handled=20
by comercial OSS).
Correct me if I'm wrong: his not true.

> Forcing OSS API means to force to process the all things above in
> the kernel.  I guess many people would disagree with it.

Completly disagee.
And another argument: comercial OSS have ALSA emulation and ALSA have OSS=20
emulation.
So .. there is no general architecture problems on implemting both varians =

(in both variants sits only some implementation bugs).

This unhides one fact: *ALSA and OSS are mostly izomorphic* (look on=20
similarities ALSA and OSS device drivers architecture).

And if it is true there was/is no strong arguments for droping OSS and=20
replace this by ALSA. As I sayd ALSA is only on Linux. Using OSS allow=20
easier develpment soud support in user space applications for some group=20
of currently used unices. This is IMO strong argument .. much stronger=20
than existing or not group of belivers. For me now switching to ALSA have=20
only *political groud* .. nothing more. Interesting .. how long Linux can=20
survive without looking on some economic aspects ?

If you allow .. EOT

kloczek
--=20
-----------------------------------------------------------
*Ludzie nie maj=B1 problem=F3w, tylko sobie sami je stwarzaj=B1*
-----------------------------------------------------------
Tomasz K=B3oczko, sys adm @zie.pg.gda.pl|*e-mail: kloczek@rudy.mif.pg.gda.p=
l*
--0-1782304796-1136492005=:15077--
