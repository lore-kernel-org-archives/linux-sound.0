From: Jeff Garzik <jgarzik@mandrakesoft.com>
Date: Tue, 23 May 2000 18:09:12 +0000
Subject: Re: OSS/Free /dev/audio full duplex sound format.
Message-Id: <marc-linux-sound-95910945614309@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95903210912907@msgid-missing>
In-Reply-To: <marc-linux-sound-95903210912907@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dave Mielke wrote:
> 
> [quoted lines by paco@hydrofunk.org on May 22, 2000, at 15:29]
> 
> >As for why it switched on you in the first place... I have no idea.
> 
> I'm using the 2.2.12-20 kernel, as suplied by RedHat6.1, and the OSS/Free
> drivers which it contains. If I open /dev/audio just for input (O_RDONLY), then
> it delivers sound in mu_law format. If I open it just for output (O_WRONLY),
> then it interprets sound in mu_law format. If I open it for both input and
> output (O_RDWR), then it delivers sound in mu_law format, but, and this is my
> problem, it interprets sound in unsigned 8-bit format (as though it were
> /dev/dsp).

An easy answer might then be "don't do that".  :)

Are you checking DSP_CAP_DUPLEX?

And what makes you say "as though it were /dev/dsp"?  /dev/audio is
supposed to default to 8-bit, /dev/dsp is supposed to default to 16-bit.

Are you following the OSS guide at
http://www.opensound.com/pguide/oss.pdf ?  It doesn't contain a few
2.3.x features, but it should be fairly close to the 2.2.x API.

	Jeff



-- 
Jeff Garzik              | Liberty is always dangerous, but
Building 1024            | it is the safest thing we have.
MandrakeSoft, Inc.       |      -- Harry Emerson Fosdick
