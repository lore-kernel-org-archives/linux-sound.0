From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 26 Aug 1999 21:04:04 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected
Message-Id: <marc-linux-sound-93570644313806@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> Is possible to create some thread for this loop inside kernel module?

There is no point

> I don't want to suspend the application execution due to a broken
> hardware. I did some tests with 2.2 kernels (using kernel_thread()) and
> I've not been successful.

It is cheaper for the application thread to spin briefly in kernel space
than to schedule other threads.
