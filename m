From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 11 Oct 1999 15:45:29 +0000
Subject: Re: [linux-audio-dev] full-duplex
Message-Id: <marc-linux-sound-93968252431691@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 11 Oct 1999, Paul Barton-Davis wrote:
> >ALSA:
> >Won't compile with gcc-2.95 but it's probably similar to OSS/Free.
> 
> ALSA:
> 1) open the device O_RDWR. then use it the way you'd expect,
>    independent of the card type or anything else.
> 
> OSS/Free or OSS/Commercial:
> 1) forget about it for full-duplex. its just not reliable and/or too
> card dependent.
> 
> --p

Hi,
Paul gave me a code fragment to use the soundcard in fullduplex mode,
(My old code were not able to perform DSP_SET_FRAGMENT, because
of wrong order of soundcard initialization).

But my Turtlebeach on my P133 with Tyan Tomcat motherboard (HX)
locks up the kernel some times.
( I tried 2.2.5 and 2.2.10 )

Is this due to a hw problem of buggy mainboards (from the Audio-quality HOWTO
:-) )  ?

Is there a workaround for OSS/Free ?
Does have ALSA the same problems ?

thanks for infos.

regards,
Benno.
