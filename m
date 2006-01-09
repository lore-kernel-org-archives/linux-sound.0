From: =?iso-8859-1?q?Ren=E9_Rebe?= <rene@exactcode.de>
Date: Mon, 09 Jan 2006 13:05:23 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <200601091405.23939.rene@exactcode.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <Pine.LNX.4.61.0601080225500.17252@zeus.compusonic.fi> <Pine.LNX.4.61.0601081007550.9470@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081007550.9470@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Hannu Savolainen <hannu@opensound.com>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>

Hi,

On Sunday 08 January 2006 10:24, Jaroslav Kysela wrote:

> > > > > - PCM with non-interleaved formats
> > > > There is no need to handle non-interleaved data in kernel level drivers 
> > > > because all the devices use interleaved formats.
> > > 
> > > Many RME boards support only non-intereleave data.
> > In such cases it's better to do interleavin/deinterleaving in the kernel 
> > rather than forcing the apps to check which method they should use.
> 
> I don't think so. The library can do such conversions (and alsa-lib does) 
> quite easy. If we have a possibility to remove the code from the kernel 
> space without any drawbacks, then it should be removed. I don't see any 
> advantage to have such conversions in the kernel.

Also, when the data is already available as single streams in a user-space
multi track application, why should it be forced interleaved, when the hardware
could handle the format just fine?

Yours,
  Rene

-- 
ExactCODE, Berlin
