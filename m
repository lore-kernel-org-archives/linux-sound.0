From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Wed, 04 Aug 1999 14:31:01 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93377726217096@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Kurt Wall wrote:

> Does the 2.2.x sound driver yet support MPEG?  Or is this being coded up in
> ALSA (I've not looked at this) or video-for-linux?

Why would it want to? It doesn't make sense to put a software MPEG
decoding engine in the kernel. Only if the hardware has an MPEG
decoder (is there any PC hardware that does this?) it's interface
should be exposed to user space by the sound driver.

Tom
