From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Mon, 01 Nov 1999 10:24:19 +0000
Subject: Re: Problem with ESS Solo1
Message-Id: <marc-linux-sound-94145592308258@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94131439128758@msgid-missing>
In-Reply-To: <marc-linux-sound-94131439128758@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

"Ravi K. Swamy" wrote:

> When playing realaudio files with the new g2 player it sounds like the
> sound is played back 1000 times faster than it should be, none of the

It looks like it's the same thing as with the older real players that's
documented in Documentation/Changes. So you either need to find
the place to patch g2 or use the LD_PRELOAD trick...

Tom
