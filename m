From: Keith Duthie <psycho@albatross.co.nz>
Date: Sat, 20 Feb 1999 13:23:44 +0000
Subject: Re: kernel sound error
Message-Id: <marc-linux-sound-91951710430105@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91951643529951@msgid-missing>
In-Reply-To: <marc-linux-sound-91951643529951@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, 20 Feb 1999, Sangohn Christian wrote:

> Hello Everyone!
> 
> Since a few days I'm getting the following error on my console:
> Feb 20 14:05:44 sikasso kernel: Sound error: Couldn't allocate DMA buffer 
> What's wrong?
Not enough contiguous free memory below 16M. Try using the dmabuf=1 option
so some memory is permanently held for dma.
-- 
.sig under deconstruction. Please watch out for falling stars.
                          O-        +++ATH0
