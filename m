From: Matthew Haas <wedge@onlineimage.com>
Date: Thu, 11 Feb 1999 13:10:18 +0000
Subject: Re: Aztech 16-bit in SB mode??
Message-Id: <marc-linux-sound-91873877129363@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91870762615258@msgid-missing>
In-Reply-To: <marc-linux-sound-91870762615258@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 10 Feb 1999, lokesh setia wrote:
>
> Hi all,
> 
> I have a Aztech 16-bit sound card which reports to be SB16 compatible.
> (In DOS that is, all games etc. use the SB 16  settings after the Aztech 
> sound driver is loaded.).
>

Unless this is some very new card (last few months), there exists no
SoundBlaster 16 clones.

I have an Aztech Sound Galaxy PRO 16 card, which I used before getting my
genuine SB32, and it was a good card. 

Most cards which claim 16-bit sound mode usually use something like
MSS/WSS, and have a SoundBlaster PRO mode. 

An interesting thing about some of the Aztech's (mine included) is that
they ran both 16 and 8-bit modes at once...(at least the DOS-sided driver
did, I could never get it to work this way under Linux, had to be one or
the other).

If it has an EEPROM / software jumper, set it for EEPROM and make sure the
correct values are in memory, and then you won't need to use LOADLIN, just
boot it straight to Linux.

--------------------------------------------------------------------------
      * * *      Atari 8-bit RULES! 400/800/XL/XE 2600/5200/7800            
      * * *      Battlestar: Galactica! Star Wars! SeaQuest!                
      * * *      Voltron! DESCENT! Star Trek! SPARCstation 2!            
  *  *  *  *  *                                                             
   **   *   **            !   !  ! ! L I N U X ! !  !   !           2.2.1   
--------------------------------------------------------------------------
