From: Ricard Wanderlof <ricardw@axis.com>
Date: Fri, 01 Oct 2021 08:54:07 +0000
Subject: Re: ALSA kernel projects - for academic purposes
Message-Id: <alpine.DEB.2.21.2110011046540.20945@lnxricardw1.se.axis.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+i=3NDuxK2rZZY6N18=OTbkna3VMVpx4nNgF0vyq3JmQA@mail.gmail.com>
 <324112.1632501120@turing-police>
 <CAHhAz+jNCd=cw-bohcoiAA2UhNZYSFLX07qEV-T2p+KAsVHhAQ@mail.gmail.com>
 <CAJfuBxxAEXnPxY-nx4JEe+fzH7J+nLYzD9zLCSzgjViBHsQbPA@mail.gmail.com>
 <20210929150052.GB15841@www2.mrbrklyn.com>
In-Reply-To: <20210929150052.GB15841@www2.mrbrklyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ruben Safir <ruben@mrbrklyn.com>
Cc: Muni Sekhar <munisekharrms@gmail.com>, alsa-devel <alsa-devel@alsa-project.org>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernelnewbies <kernelnewbies@kernelnewbies.org>, "jim.cromie@gmail.com" <jim.cromie@gmail.com>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>


On Wed, 29 Sep 2021, Ruben Safir wrote:

> > also, theres now pipewire, which is new, and all the buzz.
> > its apparently the future of linux audio
>
> BTW - we hear the BS every month, and yet, ALSA is still here and the
> backbone of Linux sound...

PipeWire is not really a replacement for ALSA, if by ALSA mean the Linux 
kernel audio subsystem, as it still needs to access audio hardware via 
ALSA kernel drivers.

If we include alsa-lib in ALSA, then, with proper configuration, not 
really out of the box, PipeWire can replace the plugin hierarchy that is 
normally set up in /etc/asound.conf etc.

But PipeWire is purely userspace, and is really more of a replacement for 
JACK and PulseAudio at the same time. It does seem to be the future in the 
sense that although it's still in development, it's here now, and it works 
out of the box at least in some distributions.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
