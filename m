From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 25 Feb 2000 01:48:03 +0000
Subject: Re: [PATCH] removal of legacy sound defines
Message-Id: <marc-linux-sound-95145820825634@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95143229508229@msgid-missing>
In-Reply-To: <marc-linux-sound-95143229508229@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> > version of OSS, so it might be usefull to remove the legacy defines.
> 
> This doesn't look like a good idea to me....  Have you analyzed all the
> paths and permutations for those config options you are chopping?

I think its a good idea. If it breaks something lets fix the breakage.
I've fixed occasional bugs caused by this legacy cruft still existing so its
already a problem
