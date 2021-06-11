From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Date: Fri, 11 Jun 2021 23:46:34 +0000
Subject: Re: USB sound card issues
Message-Id: <26698.1623455194@turing-police>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1623455194_23653P"
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
In-Reply-To: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

--==_Exmh_1623455194_23653P
Content-Type: text/plain; charset=us-ascii

On Tue, 08 Jun 2021 16:20:07 +0530, Muni Sekhar said:

> $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
> Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error

Always check the obvious stuff first  does the card support S16_LE 32Khz data?
And if it's configurable for multiple formats, was it set for the correct one?

Does wireshark or other USB snoop program show any traffic at all?
Does the record die immediately, or hang for a few seconds and timeout?
Does 'arecord -v' or arecord -vv' tell us anything more about the situation?

--==_Exmh_1623455194_23653P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYMP12gdmEQWDXROgAQLIDg/+OTEH8NUNHBi0Z0ZAwqC40hjQlz5u+K/x
/1Lm/4vfMZo5O9Xs3S1pgtTkElRWkKls5gErziSPTOFsKF9yAWsz+rTxKT4+NKNt
OK8DQicMfmbzKYNslThtm6V5JTLRJMGDtho6tK9K2V8n9C3WJTJHclvuTyWBXyLE
ZeJQa//b95ce8q+9e4MmYv9KU1Nyf7uKTleQPUWMNBcYC2MvB6okb/D6Q3N0zSZV
wWbMMC00oilqfkJxBw0AvjhdpQ+0Yc2dbx58NaIwirAs/okE1z1uPJoW05XoSdwo
unQuKKa6qoN85wwo4qkKjN2H4Ev9ao5+427M+xPPc2AjhBoctNzA7CQJeg9ZmyTI
T1ewBD8sxNrharNeZ0BLtMTgpfcFhpXCLOcaMbUqIqu9iE6hDypACSWYSLZgN1ee
fJr8tkIe6qUx75VbbY1f0H+UfRqVrogp/EFqJYQaiXL461Ls0Lc4PyzqRMEMEjwR
vRMjOci0Q1tbEO0UXjaw7XSs8lKE0IcBYHGOBGanrPNDfDlMu0RCbAeWiHgC0vxn
ZFZ4m37nJN0Pj9mQiuyk1RAzTMyOCc/t213dNjOElYb8ZpvqjyHngIxTtAHzCSVG
g1l5m6gXxWM54gN6pDn/4sk40TPmwPHNcCaYpzkUa2/8xudTs/zZ+lQoc8Znd4nx
LxU/hQOag6s=
=1MM3
-----END PGP SIGNATURE-----

--==_Exmh_1623455194_23653P--
