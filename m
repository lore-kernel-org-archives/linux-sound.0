From: "Stephen C. Tweedie" <sct@redhat.com>
Date: Thu, 26 Aug 1999 16:55:29 +0000
Subject: Re: mmap() better than read() fro streaming, Was: Re: Streaming disk I/O kills file buffering and ma
Message-Id: <marc-linux-sound-93569557801143@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93559158330469@msgid-missing>
In-Reply-To: <marc-linux-sound-93559158330469@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

Benno Senoner writes:

 > Yes, I run with mlockall(MCL_CURRENT|MCL_FUTURE)
 > I can confirm this now:
 > I just removed my memcpy()s for testing purposes, and the app loads the
 > data nicely.

As it should be.  mlock/mlockall apply to _all_ pages which appear in
your process' address space, regardless of whether they are page cache
or local data pages.

 > Pratically this means that if you enabled MCL_FUTURE, mmap() will
 > return only after all the mapped segment of the file resides in
 > memory.  Correct me please if I am wrong.

Yes.  If MCL_FUTURE is used then all future mmap()s are automatically
marked as locked, and we do a make_pages_present() before returning
from mmap.  This is exactly what mlockall is designed for: memory
access should simply never page fault if you use MCL_CURRENT |
MCL_FUTURE.  This is even true for writable MAP_PRIVATE pages: if you
have full mlockall enabled, then the make_pages_present() will do a
copy-on-write page fault for you.

--Stephen
