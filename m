From: Andrea Arcangeli <andrea@e-mind.com>
Date: Wed, 17 Mar 1999 23:09:42 +0000
Subject: Re: [patch] SBPRO 16bit 44.1khz stereo (and some improvement to sb16
Message-Id: <marc-linux-sound-92172599101928@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92170794120018@msgid-missing>
In-Reply-To: <marc-linux-sound-92170794120018@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 17 Mar 1999, Andrea Arcangeli wrote:

>conversion. But the reason I removed the buffer is just that I don't like
>a static buffer, if write(2) would be threaded (in the case we'll drop

And I didn't thought that it can be just threaded if you run two sb16 in
full-duplex mode and the userbuffer is in the swap...

Andrea Arcangeli
