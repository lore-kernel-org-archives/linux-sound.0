From: Peter Monta <pmonta@halibut.imedia.com>
Date: Mon, 23 Aug 1999 17:42:05 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93543158007968@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> > I agree; the raw-io system will make this much more pleasant.
>
> Why do you think so?
>
> IO is IO, whether it is raw or not. And it will eat up resources from
> everybody else trying to do IO.

True; raw I/O won't magically increase resources.  But it offers
a valuable way to tell the kernel something it can't know/infer: a good
buffering policy for streaming data.  The existing cache mechanism
for normal I/O works fine but is inappropriate for this case; indeed
perfectly good working sets are messed up by buffering the streaming data,
as Benno points out.

Cheers,
Peter
