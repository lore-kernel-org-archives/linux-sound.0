From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 25 Aug 1999 16:16:25 +0000
Subject: Re: mmap() better than read() fro streaming, Was: Re: Streaming disk I/O kills file buffering and ma
Message-Id: <marc-linux-sound-93559778407435@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93559158330469@msgid-missing>
In-Reply-To: <marc-linux-sound-93559158330469@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 25 Aug 1999, Andrea Arcangeli wrote:
> On Wed, 25 Aug 1999, Benno Senoner wrote:
> 
> >will mlock() automatically cause all pages to be read from the file ?
> 
> Yes.
> 
> >But since I already do an mlockall() at the beginnig, there is no need of
> >additional mlock()s
> 
> Yes (if you use MCL_FUTURE).
> 
> Andrea

Yes, I run with mlockall(MCL_CURRENT|MCL_FUTURE)
I can confirm this now:
I just removed my memcpy()s for testing purposes, and the app loads the
data nicely.
Pratically this means that if you enabled MCL_FUTURE,
mmap() will return only after all the mapped segment of the file resides in
memory.
Correct me please if I am wrong.

regards,
Benno.
