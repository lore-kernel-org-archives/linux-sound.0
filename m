From: Jeff Garzik <jgarzik@mandrakesoft.com>
Date: Thu, 24 Feb 2000 23:58:29 +0000
Subject: Re: [PATCH] removal of legacy sound defines
Message-Id: <marc-linux-sound-95144338817116@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95143229508229@msgid-missing>
In-Reply-To: <marc-linux-sound-95143229508229@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Christoph Hellwig wrote:
> 
> Hi, this patch removes all the sound (oss) legacy defines.
> Since Alan modularized the oss code, the semed to be no new free
> version of OSS, so it might be usefull to remove the legacy defines.

This doesn't look like a good idea to me....  Have you analyzed all the
paths and permutations for those config options you are chopping?

-- 
Jeff Garzik              |
Building 1024            | Viva la open source!
MandrakeSoft, Inc.       |
