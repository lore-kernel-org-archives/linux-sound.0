From: "Joe T." <auximini@yahoo.com>
Date: Mon, 01 May 2000 00:54:07 +0000
Subject: wav rates
Message-Id: <marc-linux-sound-95714288704119@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

OK, thanks for all the help with the sound input
problem.. but now ive got another road block:

I recorded the wav using sox:
sox -t ossdsp -w -s /dev/audio -r 44100 -c 2 blah.wav

I used 44100 because CDRDAO (the cdr program i use)
will not let me burn it to cd unless it is that.
But!
using sox, the file is actually 44192, not 44100.. it
still wont let me burn.
so? just use sox to convert it, right? nah..
I do that, and get stupid/weird scratching noises..

so...does anyone have any ideas to get it right on the
notch at 44100?

thanks

==Joe Topjian
auximini@yahoo.com
http://auximini.cjb.net

Even a stopped clock gives the right time twice a day

__________________________________________________
Do You Yahoo!?
Talk to your friends online and get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
