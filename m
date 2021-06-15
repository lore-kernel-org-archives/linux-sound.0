From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Date: Tue, 15 Jun 2021 06:14:20 +0000
Subject: Re: USB sound card issues
Message-Id: <27987.1623737660@turing-police>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1623737660_27061P"
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com> <26698.1623455194@turing-police>
 <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
In-Reply-To: <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

--==_Exmh_1623737660_27061P
Content-Type: text/plain; charset=us-ascii

On Sat, 12 Jun 2021 16:45:00 +0530, Muni Sekhar said:

> > And if it's configurable for multiple formats, was it set for the correct one?
> Is there a way to verify was it set for the correct one or not?

arecord -v gives what it thinks the setup is.

> > Does the record die immediately, or hang for a few seconds and timeout?
> What is the difference between these two ways?

An immediate failure is usually related to a "Can't do it" situation where the
USB interaction to configure the device has failed, while a timeout usually
indicates that the configuration at least *claimed* to succeed, but is failing
to properly transfer valid data.

> For my hardware, I noticed that it hangs for a few seconds and gives EIO (arecord:
> pcm_read:2032: read error: Input/output error).

Given that the usbmon output ran to several megabytes, that's tending to
point at "the card was returning lots of packets, but they weren't actually the
format/data that arecord was expecting.

--==_Exmh_1623737660_27061P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYMhFPAdmEQWDXROgAQLflRAAs+j4NzJsZvDoYyONGr7oogKXJeN9xOeC
MZ4TriWfaNZFsJjF4vZLASaJHchFooza6IVmfXyydw5eaDqiMjY29248qWt3Udcn
pX0riM8ss4f1PZHJJ1wxXUB7xyWllk8B7rSUCQVQzleBa869EnUBL8scgZo4wfFR
bLcIWoB6MOYzCWUCAH46qKVBlDfuF21vH3X/njcPoYVDFkBzrWBdtf7EZRNUD4eF
OZECVvE6Wlf7FrAhMX7Z25MKEtvFk/5/3XO18vMvB+iI/4mcqgYhhTbL9T20kHxn
X5Z4diY31QZNRitK7uQvBCv70moH0gyP5wmP1qaEV6NV3PojwBsC2UlvkKx0Rq8q
Yj/+3BEhaJI3lmKnFzNKaAlxSoWLtkfaiYz3fq0s04kQg36j05eV+UuzvKMe6Nvi
PiB/QPhDAqpnxWCEQ8vAi9CXV/pM46ZdPFJlZtLZZe0RcwCRKKUfGKFVK9i19cRX
ifhZOMUtHdcQi8j7cDuauFQYd4j+M8wLsTEd7E4G0vEcp+hebC66s+cWMP0Ofg0f
OVRT4jHovw4UQuimQ5M7dc0B+MAqLUYv8caoHgBI3/Wvy7de/b7tSGwoEt8uZbha
opHBCfQ+5lxTwMn66g6GGMEarC1CCjD0D9DtaT4DaDHzx/ZUNg9w+rxS/sKJen+i
Q40iY/MKlhU=
=3wIB
-----END PGP SIGNATURE-----

--==_Exmh_1623737660_27061P--
