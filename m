From: Luke Koch <lu.ale.koch@gmail.com>
Date: Sat, 15 Apr 2023 09:51:43 +0000
Subject: Re: ALSA: arecord : silennce recorded as 0x80
Message-Id: <ZDpzr8VOD5w5UhsR@kernelhacking.kernelhacking.example.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
 <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
 <CAHhAz+g-Mtz3xhnU9hDHG9DzBuBM_e9_4n0BSRpALRJcyLF0LQ@mail.gmail.com>
In-Reply-To: <CAHhAz+g-Mtz3xhnU9hDHG9DzBuBM_e9_4n0BSRpALRJcyLF0LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org

> > This is what I found after Googling a bit:
> > Since you didn't specify a format, arecord defaults to 8 bit format (U8).
> > Being unsigned, a negative value for maximum negative amplitude is impossible. Therefore the value is given a bias of 128,
> > making 0 the maximum negative amplitude, 255 the maximum positive, and 128 the center point (or silence).
> Thanks for the clarification.
> So I tried passing signed 8-bit format (S8), and then the arecord died
> immediately, as mentioned below.
> 
> $ arecord -f S8 test.wav
> Recording WAVE 'test.wav' : Signed 8 bit, Rate 8000 Hz, Mono
> arecord: begin_wave:2481: Wave doesn't support S8 format...
> 
> For other format S16_LE, the arecord hangs for a few seconds and
> throws an I/O error.
> 
> $ arecord -f S16_LE test.wav
> Recording WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 8000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error
> 
> I am not sure why recording works only on the default format of U8.
> For other formats, the record either dies immediately or hangs for a
> timeout and then throws an I/O error. Any ideas about this behaviour?

The flag --dump-hw-params should show the formats arecord supports On
your installation. On top of that .wav does not support any big endian formats
as well as no signed formats below 9 bit. You could try testing with raw
file type instead.

The i/o error *might* relate to incorrect device selection.

I hope you can pinpoint your issue to something more specific - and
provide more information - so people with actual expertise in this driver can
help you, I just googled a bit to not leave your questions hovering around unanswered.
Maybe take a peek into the guide on how to ask good questions, linked on
the kernelnewbies site, to make your questions more concise and worth busy people's time.

Best regards,
Luke
