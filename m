From: Wilmer van der Gaast <lintux@debian.org>
Date: Thu, 21 Feb 2002 18:03:40 +0000
Subject: Re: es1371 driver
Message-Id: <marc-linux-sound-101431472704282@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101430199925056@msgid-missing>
In-Reply-To: <marc-linux-sound-101430199925056@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jaroslav Kysela (perex@suse.cz) wrote:
> If O_NONBLOCK is clear:
> 	The open() function will block the calling thread until the device
> is ready or available before returning.
> 
Hmm.. Damn, looks like a *lot* of applications don't know about this.

Also, I checked a couple of other drivers (including GUS, the card I
used to have), they all return -EBUSY when the device in use, even when
O_NONBLOCK is clear. Why this inconsistency?


Greetings,

Wilmer van der Gaast.

-- 
+-------- .''`.     - -- ---+  +         - -- --- ---- ----- ------+
| lintux : :'  :  lintux.cx |  | Unix and CGI @   IOI/NIO(Dutch)at |
|   at   `. `~'  debian.org |  | www.lintux.cx/   www.algoritme.nl |
+--- -- -  ` ---------------+  +------ ----- ---- --- -- -         +
