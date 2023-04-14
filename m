From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 14 Apr 2023 14:37:43 +0000
Subject: Re: ALSA: arecord : silennce recorded as 0x80
Message-Id: <CAHhAz+g-Mtz3xhnU9hDHG9DzBuBM_e9_4n0BSRpALRJcyLF0LQ@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
 <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
In-Reply-To: <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Luke Koch <lu.ale.koch@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org

On Fri, Apr 14, 2023 at 3:45 PM Luke Koch <lu.ale.koch@gmail.com> wrote:
>
>
> On Thu, Apr 13, 2023 at 3:50 PM Muni Sekhar <munisekharrms@gmail.com> wrote:
> >
> > Hi all,
> >
> > I recorded the silence on the default audio card by running "arecord
> > -d 5 test.wav."
> >
> > Once it exited, I checked the contents by running "hexdump test.wav,"
> > and I see that silence is recorded as a sequence of 0x80 instead of
> > 0x00.
> >
> > 0000000 4952 4646 0024 8000 4157 4556 6d66 2074
> > 0000010 0010 0000 0001 0001 1f40 0000 1f40 0000
> > 0000020 0001 0008 6164 6174 0000 8000 8080 8080
> > 0000030 8080 8080 8080 8080 8080 8080 8080 8080
> > 0000040 8080 8080 8080 8080 8080 8080 8080 8080
> > ...
> >
> > What might be the reason for silence being recorded as 0x80 instead of 0x0?
> >
> >
> > --
> > Thanks,
> > Sekhar
>
> This is what I found after Googling a bit:
> Since you didn't specify a format, arecord defaults to 8 bit format (U8).
> Being unsigned, a negative value for maximum negative amplitude is impossible. Therefore the value is given a bias of 128,
> making 0 the maximum negative amplitude, 255 the maximum positive, and 128 the center point (or silence).
Thanks for the clarification.
So I tried passing signed 8-bit format (S8), and then the arecord died
immediately, as mentioned below.

$ arecord -f S8 test.wav
Recording WAVE 'test.wav' : Signed 8 bit, Rate 8000 Hz, Mono
arecord: begin_wave:2481: Wave doesn't support S8 format...

For other format S16_LE, the arecord hangs for a few seconds and
throws an I/O error.

$ arecord -f S16_LE test.wav
Recording WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 8000 Hz, Mono
arecord: pcm_read:2032: read error: Input/output error

I am not sure why recording works only on the default format of U8.
For other formats, the record either dies immediately or hangs for a
timeout and then throws an I/O error. Any ideas about this behaviour?

>
> Best Regards,
> Luke
>
>
>


-- 
Thanks,
Sekhar
