From: Matthew Haas <wedge@onlineimage.com>
Date: Fri, 08 Jan 1999 14:36:29 +0000
Subject: Re: Problems with rvplayer
Message-Id: <marc-linux-sound-91590893017006@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91577868929600@msgid-missing>
In-Reply-To: <marc-linux-sound-91577868929600@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 6 Jan 1999, samad wrote:
>

[SNIP]

> 
> Anybody can help me?
> 

I'm not sure when it became an issue, but somewhere between 2.1.131 and
2.2.0-pre4 this appeared in the linux/Documentation/Changes file for the
kernel:

RealPlayer
=====

   Current releases of Real Player 5.0 depend on a bug in the sound
sub-system which is no longer there.  Consequently, they don't work.
Real is aware of the problem and should have an updated version of the
software available shortly.  In the mean time, you can always try
backing up your copy of rvplayer, and then editing it by:

   dd if=/dev/zero of=rvplayer bs=1 count=1 seeke7586 conv=notrunc dd
if=/dev/zero of=rvplayer bs=1 count=1 seekf5986 conv=notrunc

   If you're lucky, you'll then have sound....

> 
> THANKS
> samad
> samad.wanadoo.fr
>

Hope that helps.
 
> 
--------------------------------------------------------------------------
      * * *      Atari 8-bit RULES! 400/800/XL/XE 2600/5200/7800            
      * * *      Battlestar: Galactica! Star Wars! SeaQuest!                
      * * *      Voltron! DESCENT! Star Trek! SPARCstation 2!            
  *  *  *  *  *                                                             
   **   *   **            !   !  ! ! L I N U X ! !  !   !         2.0.36   
--------------------------------------------------------------------------
