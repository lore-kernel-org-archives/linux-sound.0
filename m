From: Hannu Savolainen <hannu@opensound.com>
Date: Thu, 05 Aug 1999 19:12:14 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93388116522557@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 5 Aug 1999, Kurt Wall wrote:

> The original question I asked was simply if MPEG support had ever been added
> to the <linux/soundcard.h>, as some of the declarations therein seemed to
> suggest that such support would be added.  I didn't ask for a lecture on
> whether or not it is appropriate to add such to the kernel
The define for MPEG audio was added there for cards with hardware MPEG
audio capability. At that time (good old 486 days) software MPEG in kernel
simply was not possible. The definition was added just for future
purposes.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
