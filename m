From: Christoph Hellwig <c0hellwi@rks.harz.ni.schule.de>
Date: Tue, 29 Feb 2000 09:09:10 +0000
Subject: Re: Problem compiling 2.3.48
Message-Id: <marc-linux-sound-95181754032386@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95169276902786@msgid-missing>
In-Reply-To: <marc-linux-sound-95169276902786@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

This is a because of my code-cleanups ...

Replace

#ifdef MODULE

static int timer_installed = -1;

#endif

with

#ifndef EXLUDE_TIMERS

static int timer_installed = -1;

#endif

This will be cleared in my next patch

Christoph


-- 
Always remember that you are unique.  Just like everyone else.
