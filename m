From: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Date: Thu, 05 Jan 2006 15:07:02 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-234079267-1136473622=:17086"
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
To: Jaroslav Kysela <perex@suse.cz>
Cc: Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-234079267-1136473622=:17086
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Jan 2006, Jaroslav Kysela wrote:

> On Thu, 5 Jan 2006, Tomasz K=B3oczko wrote:
>
>> On Wed, 4 Jan 2006, Jaroslav Kysela wrote:
>
>>> Well, the ALSA primary goal is to be the complete HAL not hidding the
>>> extra hardware capabilities to applications. So API might look a bit
>>> complicated for the first glance, but the ALSA interface code for simple
>>> applications is not so big, isn't?
>>
>> Sorry Jaroslav byt this not unix way.
>> Wny applications myst know anything about hardware layer ?
>> In unix way all this details are rolled on kernel layer.
>
> It means that you are saying that kernel should be bigger and bigger.
> Please, see the graphics APIs. Why we have X servers in user space (and
> only some supporting code is in the kernel) then? It's because if we
> would move everything into kernel it will be even more bloated. The kernel
> should do really the basic things like direct hardware access, DMA
> transfer etc.

List all neccessary feactures and abstract them. Below this layer you=20
can plug to this all device drivers. Where is the problem ?
Cureent way moves some importand details like mixing to user space=20
library.
All abstraction are NOW coded but some parts of this abstraction are on=20
library level and you are wrong because this still ONE abstraction
(not multiple/growing).
Moving some patrs of this abstraction to user space level DISSALLOW secure =

manage because you do not have *single point of entry to this layer*. Try
plug library abstraction to SELinux layer. Can you do this with ALSA way ?

If you have sound device with hardware mixer(s) ALSA now work=20
transparently.=20
If you have sound device without this soft mixing is moved to user space=20
.. but  applications do not need know about this even now because all
neccessary details are handled on library level. Is it ?
So question is: why the hell *ALL* mixing details are not moved to kernel=20
space to SIMPLE and NOT GROWING abstraction ?

Next thing: look again on diffrent types sound devices. What do you have ?
Sound  output/input device(s) wich acan be oppened with diffrent sampling=20
rates and diffrent samle sizes or only constatns sample rates/sizes, mixer
devic(s), midi ... all ot them CAN BE abstracted to form with hidded ALL
hardware details. Problem with growing abstraction size ocurres ONLY when=20
some new hardware will provides new hardware sound part class/type.
Generaly this NOT OCCURRES in case sound devices.
So .. I don't see your "kernel should be bigger and bigger". If you=20
want continue please describe this.

BTW X11: please don't use X11 examplary. Despite the fact that ther are=20
quite a lot of people working around it's defficiencies in a moderately=20
successfully way, X11 has to be considered a piece of rotten bloated=20
mindless utter crap and by no way as an exemplary piece of software design =

exercise.

In case ALSA now questions are very basic:

- all hardware mixers are very simillar with very izomorphic interface
   (read this as: this can be very easy abstracted) and we have only one
   other case with soft mixing when this hardwware must be emulated in
   software .. so all this details can be rolled to one leyer on kernel
   level.
   So: why all mixing details are not in kernel space ?

- KNOWN FACT is OSS provides simpler API for user space for handle
   usual cases.
   Why Linux can't provide only OSS API abstraction for user space
   application ? And/or why ALSA developers want to replace this by
   mostly bloated and pourly documented ALSA user space API ?

kloczek
--=20
-----------------------------------------------------------
*Ludzie nie maj=B1 problem=F3w, tylko sobie sami je stwarzaj=B1*
-----------------------------------------------------------
Tomasz K=B3oczko, sys adm @zie.pg.gda.pl|*e-mail: kloczek@rudy.mif.pg.gda.p=
l*
--0-234079267-1136473622=:17086--
