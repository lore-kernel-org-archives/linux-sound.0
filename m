From: Christoph Hellwig <c0hellwi@rks.harz.ni.schule.de>
Date: Fri, 25 Feb 2000 07:50:51 +0000
Subject: Re: [PATCH] removal of legacy sound defines
Message-Id: <marc-linux-sound-95146779531327@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95143229508229@msgid-missing>
In-Reply-To: <marc-linux-sound-95143229508229@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jeff Garzik wrote:
> Christoph Hellwig wrote:
> > 
> > Hi, this patch removes all the sound (oss) legacy defines.
> > Since Alan modularized the oss code, the semed to be no new free
> > version of OSS, so it might be usefull to remove the legacy defines.
> This doesn't look like a good idea to me....  Have you analyzed all the
> paths and permutations for those config options you are chopping?

Yes, it's ok, they are all defined in thenoe obsolete header legacy.h.
Look at the file README.CONFIG that is removed by my patch.

Btw. When I get some more old sound cards to test it, I'll try to clean up the oss mess even more
and remove the compile-time selection of the resources.

Christoph


-- 
Always remember that you are unique.  Just like everyone else.
