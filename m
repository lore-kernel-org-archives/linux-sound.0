From: Andrea Arcangeli <andrea@suse.de>
Date: Thu, 17 Jun 1999 19:35:13 +0000
Subject: Re: [alsa-devel] New scheduling latencies during audio playing +
Message-Id: <marc-linux-sound-92964890718034@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92962100616666@msgid-missing>
In-Reply-To: <marc-linux-sound-92962100616666@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 17 Jun 1999, Juhana Sadeharju wrote:

>How about defining a maximum number of swap pages to write to disk at
>a time? Does kernel really have to wait for the disk operation to complete?

We just have such limit for the swap and it's set to 32 pages if I remeber
well. In the normal write to disk (via filesystem) case instead the limit
is forced to the 42 requests slot shared by all block-writes operations.
That make sense but it become an overkill for reads if we are writing
continously to disk.

Andrea Arcangeli
