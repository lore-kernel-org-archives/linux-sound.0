From: David Lang <dlang@digitalinsight.com>
Date: Mon, 09 Jan 2006 23:21:21 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.62.0601091515570.4005@qynat.qvtvafvgr.pbz>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601091405.23939.rene@exactcode.de>
 <Pine.LNX.4.61.0601091637570.21552@zeus.compusonic.fi> <200601091812.55943.rene@exactcode.de>
 <Pine.LNX.4.62.0601091355541.4005@qynat.qvtvafvgr.pbz>
 <20060109232043.GA5013@localhost.localdomain>
In-Reply-To: <20060109232043.GA5013@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: John Rigg <ad@sound-man.co.uk>
Cc: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactcode.de>, Hannu Savolainen <hannu@opensound.com>, Jaroslav Kysela <perex@suse.cz>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, 9 Jan 2006, John Rigg wrote:

> On Mon, Jan 09, 2006 at 01:58:00PM -0800, David Lang wrote:
>> On Mon, 9 Jan 2006, Ren=E9 Rebe wrote:
>>>>>
>>>>> Also, when the data is already available as single streams in a
>>>>> user-space
>>>>> multi track application, why should it be forced interleaved, when the
>>>>> hardware
>>>>> could handle the format just fine?
>>>> Because the conversion doesn't cost anything. Trying to avoid it by
>>>> making the API more complicated (I would even say confusing) is extreme
>>>> overkill.
>>>
>>> Since when doesn't cost convesion anything? I'm able to count a lot of
>>> wasted
>>> CPU cycles in there ...
>>
>> if the data needed to be accessed by the CPU anyway it's free becouse
>> otherwise the CPU would stall waiting for the next chunk of memory. you
>> can do quite a bit of work on data in cache while you are waiting for the
>> next cache line to load.
>>
>> in this same way, checksumming a network packet is free if the CPU needs
>> to copy the data anway, it only costs something if the data could bypass
>> the CPU.
>
> Yes, but the CPU has plenty of other work to do. The sound cards that
> would be worst affected by this are the big RME cards (non-interleaved) a=
nd
> multiple ice1712 cards (non-interleaved blocks of interleaved data),
> which AFAIK are the only cards capable of handling serious professional a=
udio.
> This could represent 48 or more channels of 96kHz audio, which
> doesn't leave a lot of spare CPU capacity for running X, for example.

does the CPU touch the data for these, or do you DMA directly from=20
userspace (i.e. "zero-copy")?

if the cpu touches this data on it's way in and out of the system then you =

are going to have a time period where you are maxing out the memory bus of =

your CPU (this may be a short time, but since the bus is either active or=20
not there will be a time when it's active transfering audio data :-).=20
while the memory bus is busy transfering the audio data your cpu can only=20
work on data that's in the cache.

remember that as you keep reading the data from memory it will push other=20
stuff out of your cache.

what magic do you pull to have the CPU busy on other things while the=20
cache (and memory bus) is being occupied by the audio data transfers?

David Lang

--=20
There are two ways of constructing a software design. One way is to make it=
 so simple that there are obviously no deficiencies. And the other way is t=
o make it so complicated that there are no obvious deficiencies.
  -- C.A.R. Hoare

