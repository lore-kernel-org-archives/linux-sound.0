From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 04 Aug 1999 09:25:04 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93375868527895@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 03 Aug 1999, Kurt Wall wrote:
> Hello, all,
> 
> Does the 2.2.x sound driver yet support MPEG?  Or is this being coded up in
> ALSA (I've not looked at this) or video-for-linux?
> 
> On a related question, does anyone know the current status of the
> programmer's guide to the OSS API?  I saw a blurb on their site
> (http://www.opensound.com/pguide/index.html) that it was currently being
> updated, but quite some time has passed, and I'm quite sure that it has
> become dated.
> 
> Thanks and regards,
> 
> Kurt
> -- 

If you are speaking about MPEG audio Layer II / Layer III ( MP2/MP3) , then
you can AND SHOULD do this in userspace.

there are several  MP2/MP3 players arount like freeamp (
http://www.freeamp.org ) , or XMMS  ( http://www.xmms.org )

if you need a great MPEG decoding audio library you can get it
at http://www.xaudio.com
It's one of the fastest around the planet :-)
(Includes pentium optimized decoding routines)

Alternatively you can use the decoding lib of mpg123.

A good MP3 encoder for Linux is Bladeenc (you can find the link at
http://www.mpeg.org )


hope this helps,

regards,
Benno.
