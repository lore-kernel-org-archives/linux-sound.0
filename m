From: Linus Torvalds <torvalds@transmeta.com>
Date: Mon, 23 Aug 1999 17:25:35 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93543017806245@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



On Mon, 23 Aug 1999, Peter Monta wrote:
> 
> > I think without some buffer-cache usage limiting, or buffering disabling,
> > Linux is actually UNSUITABLE for streaming applications which do run
> > concurrently with other apps.
> 
> I agree; the raw-io system will make this much more pleasant.

Why do you think so?

IO is IO, whether it is raw or not. And it will eat up resources from
everybody else trying to do IO.

I think this is a case of believing in magic cures and supernatural
beings.

		Linus
