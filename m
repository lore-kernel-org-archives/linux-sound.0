From: Andrea Arcangeli <andrea@suse.de>
Date: Mon, 23 Aug 1999 21:01:43 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93544355722182@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Benno Senoner wrote:

>No , have very little swapin/swapouts (only occasionally) when clicking on the
>xterm icon. 

As expected.

Incidentally that's exactly the _thing_ you report to be slow just in the
line below. Maybe it's only an unlucky coincidence? ;)

>After this time when I must wait up to 5-6sec from clicking to the icon to the
>actual launch of the xterm.

>Of course this is because the disk is under high load , and loads the

The swapin slowdown things (still more if the disk is under load).

Andrea
