From: Georg Wendt <Georg.Wendt@stud.uni-karlsruhe.de>
Date: Fri, 15 Jan 1999 21:50:02 +0000
Subject: Re: SoundBlasterPCI128
Message-Id: <marc-linux-sound-91643724904100@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91584820831233@msgid-missing>
In-Reply-To: <marc-linux-sound-91584820831233@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

> Thanks. I guess I had the wrong patch (2.0.36*patch*) applied.
> That's why the ES1371 driver did not show up.

linux detects on my Creative SoundBlasterPCI128 a ES1370 and it works!
So do not concentrate too much on the ES1371, better try the Modules
ES1370 AND ES1371, then you'll see, what the sndconfig detects after
booting with the new Kernel.

Good night
	Georg
