From: "Benjamin GOLINVAUX" <golinvaux@benjamin.net>
Date: Fri, 17 Sep 1999 07:37:49 +0000
Subject: Re: latencytests results on a Pentium133, again EXCELLENT, 2.1ms.:-)
Message-Id: <marc-linux-sound-93755390721649@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93751869030865@msgid-missing>
In-Reply-To: <marc-linux-sound-93751869030865@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

I'd like to implement a small audio thru loop with waveshaping effect to
test the audio latency of my own box with ingo's patches

(and Benno's last message does really encourages me)

My question is : is it really mandatory to use two threads (one for audio in
an one for audio out).

What if I do :

while(1)
{
    read(&buffer); // btw I'll be using alsa not oss
    Process(buffer);
    write(&buffer);
}

Isn't it ok ? I suppose some people have already written this kind of app...

I assume I want to use (potentially) blocking read and write and that the
playback and recording have the same clock.

That is, the offset between read and write offset will always be the same.

If I manage to start the playback and recording at the same time, can I
assume that, when the write returns, there is also a whole fragment ready in
the record buffer (and that read() will never block) ?

Thanks.

Benjamin-


----- Original Message -----
From: Benno Senoner <sbenno@gardena.net>
To: <linux-sound@vger.rutgers.edu>; <music-dsp@shoko.calarts.edu>;
<audiality@swipnet.se>; Paul Barton-Davis <pbd@op.net>
Cc: Roger Larsson <roger.larsson@skelleftea.mail.telia.com>
Sent: Thursday, September 16, 1999 11:03 PM
Subject: latencytests results on a Pentium133, again EXCELLENT, 2.1ms ! :-)


> Hi, folks,
> I performed more latency benchmarks on an old Pentium box:
> P133 , mainboard Tyan Tomcat HX, 64MB RAM, harddisk IBM EIDE 6GB,
>  Soundcard TB Tropez plus, videocard S3 PCI.
>
> To my surprise the results were excellent,  2.1ms !  ( 3x128 bytes audio
buffer)
> (even if the jitter is a bit higher than on a PII400 , but anyway very
good !)
>
> I lowered the CPU load to 60% since cpuload=80% made the box quite
unusable
> (it's like running on a Pentium with 20-25Mhz  :-))
>
> look at the results here:
>
> http://www.gardena.net/benno/linux/audio/2.2.10-p133-3x128/3x128.html
>
> Seems that Benjamin was right: a P166MMX Laptop can deliver the 3-4ms
latency.
> :-)
>
> PS: I noticed that the TB Tropez plus, takes a few msecs to startup,
> (after the first write() call) therefore just write an empty audio buffer
> before entering the main loop.
>
> regards,
> Benno.
>
> --
> Benno Senoner
> E-Mail: sbenno@gardena.net
> Linux low latency audio / scheduling latency benchmarks:
> http://www.gardena.net/benno/linux/audio
>
>
>
> dupswapdrop -- the music-dsp mailing list and website: subscription info,
> FAQ, source code archive, list archive, book reviews, dsp links
> http://shoko.calarts.edu/musicdsp/
>
