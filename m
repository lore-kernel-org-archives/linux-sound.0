From: David Lang <dlang@digitalinsight.com>
Date: Mon, 09 Jan 2006 21:58:00 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.62.0601091355541.4005@qynat.qvtvafvgr.pbz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601091405.23939.rene@exactcode.de>
 <Pine.LNX.4.61.0601091637570.21552@zeus.compusonic.fi> <200601091812.55943.rene@exactcode.de>
In-Reply-To: <200601091812.55943.rene@exactcode.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?q?Ren=E9_Rebe?= <rene@exactcode.de>
Cc: Hannu Savolainen <hannu@opensound.com>, Jaroslav Kysela <perex@suse.cz>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, 9 Jan 2006, Ren=E9 Rebe wrote:

> On Monday 09 January 2006 16:10, Hannu Savolainen wrote:
>
>>>> I don't think so. The library can do such conversions (and alsa-lib do=
es)
>>>> quite easy. If we have a possibility to remove the code from the kernel
>>>> space without any drawbacks, then it should be removed. I don't see any
>>>> advantage to have such conversions in the kernel.
>>>
>>> Also, when the data is already available as single streams in a user-sp=
ace
>>> multi track application, why should it be forced interleaved, when the =
hardware
>>> could handle the format just fine?
>> Because the conversion doesn't cost anything. Trying to avoid it by
>> making the API more complicated (I would even say confusing) is extreme
>> overkill.
>
> Since when doesn't cost convesion anything? I'm able to count a lot of wa=
sted
> CPU cycles in there ...

if the data needed to be accessed by the CPU anyway it's free becouse=20
otherwise the CPU would stall waiting for the next chunk of memory. you=20
can do quite a bit of work on data in cache while you are waiting for the=20
next cache line to load.

in this same way, checksumming a network packet is free if the CPU needs=20
to copy the data anway, it only costs something if the data could bypass=20
the CPU.

David Lang

--=20
There are two ways of constructing a software design. One way is to make it=
 so simple that there are obviously no deficiencies. And the other way is t=
o make it so complicated that there are no obvious deficiencies.
  -- C.A.R. Hoare

