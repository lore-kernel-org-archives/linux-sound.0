From: Artur Skawina <skawina@geocities.com>
Date: Thu, 27 May 1999 20:23:08 +0000
Subject: Re: Support for YMF744???
Message-Id: <marc-linux-sound-92800806719533@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92718939801567@msgid-missing>
In-Reply-To: <marc-linux-sound-92718939801567@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Karim Yaghmour wrote:
> 
> Furthermore, the card, for which I would like to have
> a linux driver, has to be initialized in DOS before
> I can even touch it in linux (It somewhat works with
> a SB driver). Is there a way to this directly in Linux?
> Hacking is not a problem ... I just need someone to
> tell me where to start digging.

If you can not get the docs then you could always (1) reverse
engineer the dos 'drivers', or (2) run them in dosemu while
logging the io.
