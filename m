From: "Jonathan C. Masters" <mastersj@periscope-systems.freeserve.co.uk>
Date: Wed, 04 Aug 1999 12:50:23 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93380307719642@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have to disagree with you here. I believe that MPEG audio decoding/encoding
and MPEG video decoding/encoding optional devices such as /dev/mpad /dev/mpae
/dev/mpvd /dev/mpve would be emensely useful. It would save so much rewritten
code (libraries are never quite as good as they sound) and my programs would
instantaneously become much more enhanced. Besides, since MPEG decoding/encoding
cards are popular these days, you begin to see the speed required (so much so
that so many cards exist) so putting low level kernel routines into the kernel
would probably be the only way to achieve maximum software "emulation" of these
expensive cards.

Benno Senoner wrote:

> On Tue, 03 Aug 1999, Kurt Wall wrote:
> > Hello, all,
> >
> > Does the 2.2.x sound driver yet support MPEG?  Or is this being coded up in
> > ALSA (I've not looked at this) or video-for-linux?
> >
> > On a related question, does anyone know the current status of the
> > programmer's guide to the OSS API?  I saw a blurb on their site
> > (http://www.opensound.com/pguide/index.html) that it was currently being
> > updated, but quite some time has passed, and I'm quite sure that it has
> > become dated.
> >
> > Thanks and regards,
> >
> > Kurt
> > --
>
> If you are speaking about MPEG audio Layer II / Layer III ( MP2/MP3) , then
> you can AND SHOULD do this in userspace.
>
> there are several  MP2/MP3 players arount like freeamp (
> http://www.freeamp.org ) , or XMMS  ( http://www.xmms.org )
>
> if you need a great MPEG decoding audio library you can get it
> at http://www.xaudio.com
> It's one of the fastest around the planet :-)
> (Includes pentium optimized decoding routines)
>
> Alternatively you can use the decoding lib of mpg123.
>
> A good MP3 encoder for Linux is Bladeenc (you can find the link at
> http://www.mpeg.org )
>
> hope this helps,
>
> regards,
> Benno.

--
Jonathan C. Masters                     (jonathan@oxlug.org)
                                        PGP: www.brookes.ac.uk/~95227860/KEY

           "Upon this rock I will build my church,
            and the gates of hell shall not prevail against it".

                 -- Matthew 16, 17-18
