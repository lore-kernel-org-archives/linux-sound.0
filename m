From: Florin Andrei <florin@expert.ro>
Date: Fri, 05 Feb 1999 12:15:35 +0000
Subject: 2.2.0 oddities
Message-Id: <marc-linux-sound-91821737719852@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


	I just compiled kernel-2.2.0 on a stock Red Hat 5.2 Intel box and saw few
strange things:
	1. My soundcard (ESS688) stopped. After digging into the system, i saw that
the DMA moved from 0 to 1 !!! So, i modified it and now i'm able to play .au
files again. Even if it is strange, that's ok for now, but...
	2. I cannot use WinAmp anymore! It dies instantly, and reports "Whoops... You
caught a bug...", preceded by "socket: Too many open files".

	Any idea why #2 happens?

						Florin Andrei
