From: Simon Huggins <huggie@earth.li>
Date: Fri, 04 Jun 1999 19:20:53 +0000
Subject: Re: Ensoniq SoundScape PnP
Message-Id: <marc-linux-sound-92852360608488@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Salut Yau!

On Thu, Jun 03, 1999 at 07:16:45PM -0500, Yau Chan wrote:
> Hi.  I'm a beginner in Linux.
> I'm using an Ensoniq SoundScape PnP and RH 6.0
> After reading all the documentations, it says
> OSS/Free doesn't work with my sound card.  
> Only the OSS/Linux works with it, I wonder if
> there is any other drivers that's available
> for free that I can use to activate my sound card?

I have one of these cards which I'm using happily under 2.2.9 at the
moment.

I have documented (more or less) how I got it to work with my kernel. I
don't have Redhat 6.0 but you might be interested in:
http://ds.dial.pipex.com/huggie/linux/sound.shtml

I haven't been able to get MIDI working though. Nor have I been able to
avoid oops happening if I try to remove the module and then reload it.
(not sure why this one happens and no one on linux-kernel has followed
up to my oops message...)

-- 
Simon            [ huggie@earth.li ] *\       "Thanks to teamwork, I almost  \**
[ http://ds.dial.pipex.com/huggie/ ] **\         stapled something today." -  \*
****************************************\                             Dilbert  \
