From: Kurt Wall <kwall@xmission.com>
Date: Thu, 05 Aug 1999 10:30:46 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93387121412099@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Also sprach Jonathan C. Masters:
> I have to disagree with you here. I believe that MPEG audio decoding/encoding
> and MPEG video decoding/encoding optional devices such as /dev/mpad /dev/mpae
> /dev/mpvd /dev/mpve would be emensely useful. It would save so much rewritten
> code (libraries are never quite as good as they sound) and my programs would
> instantaneously become much more enhanced. Besides, since MPEG decoding/encoding
> cards are popular these days, you begin to see the speed required (so much so
> that so many cards exist) so putting low level kernel routines into the kernel
> would probably be the only way to achieve maximum software "emulation" of these
> expensive cards.

The original question I asked was simply if MPEG support had ever been added
to the <linux/soundcard.h>, as some of the declarations therein seemed to
suggest that such support would be added.  I didn't ask for a lecture on
whether or not it is appropriate to add such to the kernel

As it is, I concur with the posters who wrote that this is not appropriate
for the kernel.  The kernel is big enough as it is, but, more to the point,
this is just something that needs to be done in userland or, perhaps,
implemented as a loadable module if you the need for kernel access can be
demonstrated.  There appear to be several good libraries for achieving the
sort of speed necessary for decoding/encoding layer II/III files, so I don't
see the need for more bulk in the kernel.

My $US 1/50.  Thanks to those who replied.

[snippety snip snip]

Kurt
-- 
