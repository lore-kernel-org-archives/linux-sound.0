From: Filip Peters <filip.peters@metris.be>
Date: Fri, 05 Feb 1999 20:54:58 +0000
Subject: Re: 2.2.0 oddities
Message-Id: <marc-linux-sound-91824849412883@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91821737719852@msgid-missing>
In-Reply-To: <marc-linux-sound-91821737719852@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Florin,

Second question is easy, it's because you use zipped skins. There is a bug in x11amp that
shows up in the new kernel, the solution  is to unzip the skins or to not use them.

I had these error messages also for a while, the answer was on the kernel mailing list.
Hope this helps,

Filip.

Florin Andrei wrote:

>         I just compiled kernel-2.2.0 on a stock Red Hat 5.2 Intel box and saw few
> strange things:

> .....

>         2. I cannot use WinAmp anymore! It dies instantly, and reports "Whoops... You
> caught a bug...", preceded by "socket: Too many open files".

--
Filip Peters
fp@metris.be
