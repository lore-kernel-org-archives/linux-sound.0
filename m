From: Keith Duthie <keith.duthie@stonebow.otago.ac.nz>
Date: Tue, 15 Dec 1998 08:10:55 +0000
Subject: Re: help needed for cs423x chips
Message-Id: <marc-linux-sound-91371322019754@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91325015828495@msgid-missing>
In-Reply-To: <marc-linux-sound-91325015828495@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 13 Dec 1998, Michael Haller wrote:

> Audio support of the CS4235 with the existing CS4232 driver will not
> work because the 4235 does not support ulaw, alaw or adpcm.  sequencer
> support probably doesn't work for any of the crystal chips because of a
> code ordering problem in cs4232.c.   I'm attaching a patch file for
> 2.1.131 which fixes these problems on my CS4235.
 
> Let me know how this works.

It definitely fixes the problem of the sequencer not working, but I've
also been getting messages about the OSS stuff needing to downgrade the
number of voices used, and I've also been getting breaks in music from
tracker and mpg123 when I scroll down in a web page. I'm just about to 
confirm that these are from the patch by reversing it and testing the
official module.

-- 
     |                   Keith Duthie      O-               | 
     +         Don't call me, I'll call you.  Maybe.        +
     |           keith.duthie@stonebow.otago.ac.nz          |
   __   _
  / /  (_)__  __ ____  __
 / /__/ / _ \/ // /\ \/ /  . . .  t h e   c h o i c e   o f   a
/____/_/_//_/\_,_/ /_/\_\              G N U   g e n e r a t i o n . . .
