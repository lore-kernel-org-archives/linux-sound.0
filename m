From: Peter Monta <pmonta@halibut.imedia.com>
Date: Mon, 23 Aug 1999 17:06:43 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93542839103812@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> Will future kernels ave an O_DIRECT like flag to avoid caching ?

Stephen Tweedie has written a patch for unbuffered I/O; the URL I have
from some time ago is

ftp://ftp.linux.org.uk/pub/linux/sct/fs/raw-io

though this host doesn't seem to respond at the moment.  I believe
Stephen has mentioned that this will go into the main tree at some point.
(Possibly it's already in 2.3.x---I haven't looked recently.)

> I think without some buffer-cache usage limiting, or buffering disabling,
> Linux is actually UNSUITABLE for streaming applications which do run
> concurrently with other apps.

I agree; the raw-io system will make this much more pleasant.

Cheers,
Peter Monta   pmonta@imedia.com
Imedia Corp.
