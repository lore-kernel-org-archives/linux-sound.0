From: "Joe T." <auximini@yahoo.com>
Date: Mon, 01 May 2000 02:26:42 +0000
Subject: Re: wav rates
Message-Id: <marc-linux-sound-95715463510988@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95714288704119@msgid-missing>
In-Reply-To: <marc-linux-sound-95714288704119@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> Try putting -r 44100 before /dev/audio as well so
> that that's how /dev/audio
> will be opened. Then sox won't need to do any
> conversion.

I've tried that.. its not the problem.

If i dont include the rate argument at all, sox will
record it at a very low rate (i cant remember off hand
what rate)

but by using the 44100, it records it at the different
rate.. but i guess it just doesnt record *exactly*
44100..  :P

==Joe Topjian
auximini@yahoo.com
http://auximini.cjb.net

Even a stopped clock gives the right time twice a day

__________________________________________________
Do You Yahoo!?
Talk to your friends online and get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
