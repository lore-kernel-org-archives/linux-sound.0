From: "Benno Senoner" <sbenno@gardena.net>
Date: Tue, 20 Jun 2000 11:54:03 +0000
Subject: Re: [linux-audio-dev] Re: Multimedia compression
Message-Id: <marc-linux-sound-96200429928834@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96126686903146@msgid-missing>
In-Reply-To: <marc-linux-sound-96126686903146@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Mon, 19 Jun 2000, Juhana Sadeharju wrote:
> >From:	Benno Senoner <sbenno@gardena.net>
> >
> >I prefer to use MPEG Layer 2 ( MP2) at 384kbit (lossy) which outperforms all
> >MP3 based codecs even 320kbit. 
> 
> How do you know it? Where I could read tests about it?
> I have used layer 3 with 320 kbps for compressing radio and cassette
> recordings (both music and sound samples snipped from them), so, most
> probably I have used the right compressor. But is layer 3 with 320 kbps
> somehow not enough for studio mikes (voice, guitar, etc.) or for digital
> synth tracks?
> 
> Of course, for compressing the final mix (20-bit or greater) of studio work,
> the 16-bit MP3 is not enough. But 16-bit could be enough for individual
> sounds, vocals, etc. However, I would not use any MP3 compression for even
> those because I would record only with 20-bit A/Ds in studio. I have used
> MP3 only because I have nothing better than 16-bit A/Ds. So, what compressor
> I could use for 20- or 24-bit material? Should we look at ourself for
> 20- or 24-bit compressor or can MP3 or AAC handle them (similarly than JPEG
> can handle 16-bit/channel images)?

I think Philips MPEGLIB  can encode 24bit files, their MP2 software encoder is
the same used in DMX SAT radio encoders , and other DSP platform.

I say I would prefer MP2 over MP3, because MP3 *WAS DESIGNED* for lower
bitrates. ( 128-192kbit).

Plus consider the fact that MP2 has better random-seek properties
(no long frame dependencies), not to mention higher speed when encoding/decoding
material.

If you ask me, if I were designing a system with the best possible audio
quality  while achieving 1:4 compression I would chose MP2 or alternatively
APT-X  ( http://www.aptx.com/ ) 
Unfortunately APT-X is not available as a software-only CODEC,
it is used in some cinema audio systems (DTS) , and doesn't use perceptual
coding, and has an amazing 2.9ms codec delay at 44.1kHz.
The granularity of editable regions is 80usecs = 2 samples, that means
you can edit an APT-X file with almost the same precision as a PCM file.
ATPX is some kind of ADPCM but which encodes subbands with different
precision to reflect the frequency resolution of the ear.

> Note that 16-bit is most probably enough for mic recordings, but the
> extra bits are needed for having extra room. I would not want to dither
> 20-bit recording down to 16-bit even it would fit very well.
> 
> Juhana

But I guess you are looking at a totally free codec  :-)
therefore there is only MP3 , ISO MP2 encoder and perhaps a good 
VORBIS (the patent-free audio codec which matches MP3 quality)


Benno.
