From: Muni Sekhar <munisekharrms@gmail.com>
Date: Sat, 12 Jun 2021 11:27:00 +0000
Subject: Re: USB sound card issues
Message-Id: <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <26698.1623455194@turing-police>
In-Reply-To: <26698.1623455194@turing-police>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

On Sat, Jun 12, 2021 at 5:16 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Tue, 08 Jun 2021 16:20:07 +0530, Muni Sekhar said:
>
> > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz =
x.wav
> > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mo=
no
> > arecord: pcm_read:2032: read error: Input/output error
>
> Always check the obvious stuff first  does the card support S16_LE 32Khz =
data?
Yes , it supports.
> And if it's configurable for multiple formats, was it set for the correct=
 one?
Is there a way to verify was it set for the correct one or not?
>
> Does wireshark or other USB snoop program show any traffic at all?
> Does the record die immediately, or hang for a few seconds and timeout?
What is the difference between these two ways? For my hardware, I
noticed that it hangs for a few seconds and gives EIO (arecord:
pcm_read:2032: read error: Input/output error).
> Does 'arecord -v' or arecord -vv' tell us anything more about the situati=
on?



--=20
Thanks,
Sekhar
