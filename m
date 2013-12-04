From: "Zhong Li" <zql@glomationinc.com>
Date: Wed, 04 Dec 2013 15:54:11 +0000
Subject: RE: [PATCH 2/2] ASoC: sam9x5_wm8731: change to work in DSP A mode
Message-Id: <075e01cef109$136c56f0$3a4504d0$@com>
List-Id: <linux-sound.vger.kernel.org>
References: <1386124624-22414-1-git-send-email-voice.shen@atmel.com>
 <1386124624-22414-3-git-send-email-voice.shen@atmel.com>
 <529F1424.7040501@gmail.com>
In-Reply-To: <529F1424.7040501@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Richard Genoud' <richard.genoud@gmail.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org

Richard,

> -----Original Message-----
> From: linux-arm-kernel [mailto:linux-arm-kernel-
> bounces@lists.infradead.org] On Behalf Of Richard Genoud
> Sent: Wednesday, December 04, 2013 6:38 AM
> To: Bo Shen
> Cc: zql@glomationinc.com; nicolas.ferre@atmel.com; alsa-devel@alsa-
> project.org; linux-sound@vger.kernel.org; broonie@kernel.org; linux-
> arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 2/2] ASoC: sam9x5_wm8731: change to work in DSP A
> mode
> 
> On 04/12/2013 03:37, Bo Shen wrote:
> > Change sam9x5 with wm8731 work in DSP A mode, this will fix the
> > left/right channel swap issue.
> >

> >
> Tested-by: Richard Genoud <richard.genoud@gmail.com> on at91sam9g35-ek
> with 3.12-rc2 + "ASoC: wm8731: fix dsp mode configuration"
> 
> 
> Thanks !
> 
> 

Where can I get a snap shot of your kernel source?  My test still have the
same issue after I applied the two patches.


Thanks,

Zhong


