From: Paul Barton-Davis <pbd@Op.Net>
Date: Wed, 27 Oct 1999 18:31:14 +0000
Subject: Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94104907404254@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94104909204283@msgid-missing>
In-Reply-To: <marc-linux-sound-94104909204283@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>> >Wouldn't you say that an HZ > 100 kernel is the cleanest solution?
>> 
>> its the cleanest, but not the best. HZ = 1000 adds about 8% overhead
>> to IRQ processing *all the time*.
>
>Are you *sure* about this?  I seem to remember there was some debate
>about that figure on linux-kernel.

Ed Hall measured it, and my overall impression of Ed is that I'd trust
him to do this correctly. what did the l-k folks think ?
