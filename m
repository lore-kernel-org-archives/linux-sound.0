From: Andrea Arcangeli <andrea@suse.de>
Date: Tue, 15 Jun 1999 23:01:44 +0000
Subject: Re: New scheduling latencies during audio playing + heavy disk I/O
Message-Id: <marc-linux-sound-92948739505330@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92948447502258@msgid-missing>
In-Reply-To: <marc-linux-sound-92948447502258@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 15 Jun 1999, Benno Senoner wrote:

>I tested various kernel versions:  2.0.36 , 2.2.9 , 2.2.9+andrea-patch , 2.3.5

Which is exactly the andrea-patch you mentioned? I suppose the one that I
posted here some time ago that will avoid too much stall during a `cp
/dev/zero /tmp', right? (the one that only adds the wait_for_IO variable)

If the above is true I would be interested to get some number also for:

	ftp://ftp.suse.com/pub/people/andrea/kernel-patches/2.2.10_andrea-VM5.bz2

Andrea Arcangeli

PS. Thanks for your very interesting reports :).
