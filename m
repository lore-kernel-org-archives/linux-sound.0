From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 25 Jan 2023 18:18:30 +0000
Subject: Re: struct snd_pcm_ops callbacks
Message-Id: <CAHhAz+gTrToehWki8h17DdR_u8uKmRPsDWeEygijpm51MLvz1g@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+gxrjB04c-GHa1YzahyKDQcW3+xoDt9iUnkj9THKvG_TA@mail.gmail.com>
 <53e3919e-48cc-81a0-365e-015235d10c9b@linux.intel.com>
In-Reply-To: <53e3919e-48cc-81a0-365e-015235d10c9b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org

On Wed, Jan 25, 2023 at 8:30 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 1/25/23 05:21, Muni Sekhar wrote:
> > Hi,
> >
> > struct snd_pcm_ops callbacks can be used for sending\receiving PDM
> > audio data to and from a sound card? Or is it only designed for PCM
> > audio data?
>
> It depends what side of the sound card you are looking at, the physical
> interface with external devices or the userspace interface.
I am looking at the userspace interface side.

>
> PDM can be supported at the physical interface level as long as there is
> a conversion to PCM somewhere in the hardware. Userspace will
> play/record PCM. See examples in many codecs and SOCs.
>
> There is also the possibility of packing PDM (aka DSD) as pseudo-PCM,
> that's a trick used by several USB cards. In that case of course the
> sound card cannot apply any processing to the data and is just a
> pass-through module.
>
>


-- 
Thanks,
Sekhar
