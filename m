From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 15 Jun 2021 07:12:45 +0000
Subject: Re: USB sound card issues
Message-Id: <CAHhAz+iOFda+T3=ri2o8UhNR1L1KVdKJUYABS8djijqvhsn3JQ@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <26698.1623455194@turing-police> <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
 <27987.1623737660@turing-police>
In-Reply-To: <27987.1623737660@turing-police>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

On Tue, Jun 15, 2021 at 11:44 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Sat, 12 Jun 2021 16:45:00 +0530, Muni Sekhar said:
>
> > > And if it's configurable for multiple formats, was it set for the cor=
rect one?
> > Is there a way to verify was it set for the correct one or not?
>
> arecord -v gives what it thinks the setup is.
>
> > > Does the record die immediately, or hang for a few seconds and timeou=
t?
> > What is the difference between these two ways?
>
> An immediate failure is usually related to a "Can't do it" situation wher=
e the
> USB interaction to configure the device has failed, while a timeout usual=
ly
> indicates that the configuration at least *claimed* to succeed, but is fa=
iling
> to properly transfer valid data.
>
> > For my hardware, I noticed that it hangs for a few seconds and gives EI=
O (arecord:
> > pcm_read:2032: read error: Input/output error).
>
> Given that the usbmon output ran to several megabytes, that's tending to
> point at "the card was returning lots of packets, but they weren't actual=
ly the
> format/data that arecord was expecting.
So, is it a USB card issue?



--=20
Thanks,
Sekhar
