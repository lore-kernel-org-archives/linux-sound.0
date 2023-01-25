From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 25 Jan 2023 18:34:43 +0000
Subject: Re: struct snd_pcm_ops callbacks
Message-Id: <971a9d17-58ec-3655-6cc4-42c59da6e0af@linux.intel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+gxrjB04c-GHa1YzahyKDQcW3+xoDt9iUnkj9THKvG_TA@mail.gmail.com>
 <53e3919e-48cc-81a0-365e-015235d10c9b@linux.intel.com>
 <CAHhAz+gTrToehWki8h17DdR_u8uKmRPsDWeEygijpm51MLvz1g@mail.gmail.com>
In-Reply-To: <CAHhAz+gTrToehWki8h17DdR_u8uKmRPsDWeEygijpm51MLvz1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org



On 1/25/23 12:06, Muni Sekhar wrote:
> On Wed, Jan 25, 2023 at 8:30 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 1/25/23 05:21, Muni Sekhar wrote:
>>> Hi,
>>>
>>> struct snd_pcm_ops callbacks can be used for sending\receiving PDM
>>> audio data to and from a sound card? Or is it only designed for PCM
>>> audio data?
>>
>> It depends what side of the sound card you are looking at, the physical
>> interface with external devices or the userspace interface.
> I am looking at the userspace interface side.

that's not possible without some sort of formatting of 1-bit audio in
bytes or more likely 24/32-bit words that look like PCM and can be
handled by existing DMA/FIFO hardware. That solution works for HDMI/DP
and USB.

>> PDM can be supported at the physical interface level as long as there is
>> a conversion to PCM somewhere in the hardware. Userspace will
>> play/record PCM. See examples in many codecs and SOCs.
>>
>> There is also the possibility of packing PDM (aka DSD) as pseudo-PCM,
>> that's a trick used by several USB cards. In that case of course the
>> sound card cannot apply any processing to the data and is just a
>> pass-through module.
>>
>>
> 
> 
