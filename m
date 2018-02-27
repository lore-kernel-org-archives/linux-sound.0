From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 27 Feb 2018 12:12:02 +0000
Subject: Re: [alsa-devel] aplay\arecord compare utility
Message-Id: <CAHhAz+hmJfevM+e1XBcDQtQwbdHAFgXnbXAKKcP9qvFA0LGBHA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+hoM5n42vJ650iod2OJv6ZbMwYQh4bArtiGwPETSjS04Q@mail.gmail.com>
 <alpine.DEB.2.11.1802260850111.9527@lnxricardw1.se.axis.com>
 <alpine.DEB.2.11.1802260853330.9527@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.11.1802260853330.9527@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org

Thanks Ricard for the explanation.

On Mon, Feb 26, 2018 at 1:24 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Mon, 26 Feb 2018, Ricard Wanderlof wrote:
>
>> On Fri, 23 Feb 2018, Muni Sekhar wrote:
>>
>> >  [ Please keep me in CC as I'm not subscribed to the list]
>> >
>> > I?m using an alsa utilities(aplay & arecord) for sound loopback
>> > testing. From Linux host , sending & receiving the wav file.
>> >
>> > At end I want to compare the sent & received wav file. Does Linux has
>> > any utility to support this one?
>>
>> If the wav headers are identical, you can just use cmp or diff. Otherwis=
e,
>> you can extract the raw audio using sox, which gives you files with just
>> the audio samples in them, and then you can use cmp or diff to compare
>> them. It won't work though if the files aren't actually identical, for
>> instance if there is an offset of a couple of samples in one compared to
>> the other.
>>
>> If I had to compare two wav files which were offset by a small number of
>> samples, I'd open them in Audacity, manually align them, then sum the
>> result, write to a new file and verify that the file just contained zero=
s.
>
> (Sorry, pressed enter a bit too fast there)...
>
> ... align them, _invert_one_of_them_, then sum the result, write to a new
> file and verify that the file just contains zeros.
>
> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30



--=20
Thanks,
Sekhar
