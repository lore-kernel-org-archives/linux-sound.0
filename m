From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Mon, 27 Mar 2000 15:08:23 +0000
Subject: Re: sb_card.c cleanup
Message-Id: <marc-linux-sound-95417089715481@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

 On 27-Mar-00 at 12:19:17,
  Paul Laufer <pelaufer@csupomona.edu> wrote:


> Overview: After Alex's last patch the various sb_init_* functions were
> quite redundant, so I've written a generic sb_init function.  I also
> reorganized sb_isapnp_list.  I raided the ALSA drivers for all the ISAPnP
> codes for CTL and ESS chips and added them to the table (as I believe Alan
> suggested). Also returns the 2.3.99pre2 dev->active behavior, which was

[...] Well done Paul, but i have some comments...

 first, now that we use find_card instead of find_dev
 we loose some automagic compatibility .. i.e. any
 sb "compatible" card not listed in the table but
 with a know logical device id will not work as before.

 second, the "already active thing". This was done
 to allow the user to setup manually it's card via
 the /proc/isapnp interface. 

 Obviously the second instance of the driver
 will get in the same card. There's no easy solution
 to this, but  you perfectly know how to solve this:    

:-)

 Do you remember your patch for multiple detection
 in a round? I think it's time to merge it in.

 Then you could also take in account
 if the card has been initialized by the driver
 or not.

 There's still the problem with ALS007 type
 card which obviously won't work....
 btw the card was no more in my -pre3
 kernel.. maybe i've removed it by a mistake.. :-/

 I also sent a patch to Linus a few hours ago.. 
 but it should apply with some fuzz...sorry.
 

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/
