From: Hannu Savolainen <hannu@opensound.com>
Date: Tue, 27 Jun 2000 21:49:23 +0000
Subject: Re: which is preferred interface: SOUND_PCM... or SNDCTL_DSP... ?
Message-Id: <marc-linux-sound-96214268602399@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96213283117889@msgid-missing>
In-Reply-To: <marc-linux-sound-96213283117889@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 27 Jun 2000, Britton wrote:

> 
> I was under the impression that the SOUND_PCM ioctls were now preferred,
> but I don't see any equivalent for SNDCTL_DSP_GETBLKSIZE.  Am I just
> missing it or is the old format still used for some things (or am I
> confused which is the old format)?  
The SOUND_PCM ioctls are completely obsolete and they exist only to
provide compatibility with some older applications. Use the SNDCTL_ ones
instead.

The OSS Programmer's Guide is available at http://www.opensound.com/pguide
and it documents all supported ioctl calls.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
