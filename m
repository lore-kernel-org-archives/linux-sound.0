From: <paco@hydrofunk.org>
Date: Mon, 22 May 2000 22:29:32 +0000
Subject: Re: OSS/Free /dev/audio full duplex sound format.
Message-Id: <marc-linux-sound-95903472415091@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95903210912907@msgid-missing>
In-Reply-To: <marc-linux-sound-95903210912907@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Well, this isn't really a "work-around", but...

All you should have to do is make ioctl calls to change the sample format.
It's all documented in the OSS programmers guide.

As for why it switched on you in the first place... I have no idea.

--Paco


On Mon, 22 May 2000, Dave Mielke wrote:

> When /dev/audio is opened, it's supposed to start with the sound format set to
> mulaw (Sun .snd format). When I open it for read/write (O_RDWR), however, it
> appears that it switches to unsigned 8-bit linear. Does anyone know what the
> cause of this switch in format is, and how, if at all, it can be worked around?
> 
> -- 
> Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
> Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
> EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
> 
