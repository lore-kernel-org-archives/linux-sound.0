From: Andrea Arcangeli <andrea@suse.de>
Date: Mon, 23 Aug 1999 19:25:09 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93544142420533@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Benno Senoner wrote:

>No , I'm not saying that there is a bug, I'm saying that the
>filebuffering works very well in almost all cases , except of reading large
>files from disk continuously.

Could you check `vmstat 1` and verify if you have continous
swapin/swapout? (I bet yes) If I am right then you'll probably want to
apply this my patch and try again and notice the performance difference
with eyes.

	ftp://ftp.suse.com/pub/people/andrea/kernel-patches/my-2.2.12-final3/no-swapout-2.2.10-B

Andrea
