From: Paco <paco@OhKeePa.Net>
Date: Fri, 22 Oct 1999 23:17:31 +0000
Subject: Re: SNDCTL_DSP_BUSY
Message-Id: <marc-linux-sound-94063531708919@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94063085304036@msgid-missing>
In-Reply-To: <marc-linux-sound-94063085304036@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 22 Oct 1999, Jirka Hanika wrote:

> Hi,
> 
> a programming question.
> 
> I need an ioctl or some other API to find out whether the sound card 
> has completely processed the buffers.  Something exactly like 
> ioctl(SNDCTL_DSP_SYNC), but an asynchronous breed.
> I have looked at audio.c and there is no such ioctl.
> 
> The only solution known to me is to write the neutral sample (silence)
> asynchronously to the sound card until a bufferfarmfull bytes is 
> written, then ioctl(SNDCTL_DSP_RESET).  This is however ugly as 
> 12-bit FAT.
> 
> In case there is no better approach available, what would you think of a 
> new ioctl (say SNDCTL_DSP_BUSY)?
> 
> Jirka
> 


Hi, Jirka...

I'm slightly confused about what exactly it is that you want, but if you
simply want to wait for the soundcard to finish with the buffers before
your program progresses to the next stage, you can use a SNDCTL_DSP_POST.

Normally, the cards wait until the buffer is full before playing that
audio, but this will force the soundcard to play any data in the buffer,
even if the buffer is only partially filled.

Sorry if this is not the answer you are looking for, but I really wasn't
sure what the question was.

-Paco
