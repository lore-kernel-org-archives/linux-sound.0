From: Andrea Arcangeli <andrea@suse.de>
Date: Wed, 25 Aug 1999 15:39:31 +0000
Subject: Re: mmap() better than read() fro streaming, Was: Re: Streaming disk
Message-Id: <marc-linux-sound-93559668405752@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93559158330469@msgid-missing>
In-Reply-To: <marc-linux-sound-93559158330469@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 25 Aug 1999, Benno Senoner wrote:

>will mlock() automatically cause all pages to be read from the file ?

Yes.

>But since I already do an mlockall() at the beginnig, there is no need of
>additional mlock()s

Yes (if you use MCL_FUTURE).

Andrea
