From: Paul Laufer <pelaufer@csupomona.edu>
Date: Mon, 27 Mar 2000 21:32:12 +0000
Subject: Re: sb_card.c cleanup
Message-Id: <marc-linux-sound-95419738008949@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95417089715481@msgid-missing>
In-Reply-To: <marc-linux-sound-95417089715481@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 27 Mar 2000, Alessandro Zummo wrote:

>  On 27-Mar-00 at 12:19:17,
>   Paul Laufer <pelaufer@csupomona.edu> wrote:
> 
> 
> > Overview: After Alex's last patch the various sb_init_* functions were
> > quite redundant, so I've written a generic sb_init function.  I also
> > reorganized sb_isapnp_list.  I raided the ALSA drivers for all the ISAPnP
> > codes for CTL and ESS chips and added them to the table (as I believe Alan
> > suggested). Also returns the 2.3.99pre2 dev->active behavior, which was
> 
> [...] Well done Paul, but i have some comments...

Thanks :)  Feedback is very helpful.

>  first, now that we use find_card instead of find_dev
>  we loose some automagic compatibility .. i.e. any
>  sb "compatible" card not listed in the table but
>  with a know logical device id will not work as before.

Hrm. The only cards that would automagically match the logical device ids
there were Creative Labs cards. No other vendors have CTL as their ISAPnP
vendor id. And we know what all the ISAPnP ids are for these Creative Labs
and ESS cards, so I don't see the problem. Besides, I am willing to handle
a few "My card isn't autodetected anymore, what happened?" bug reports to
l-k for a code cleanup. Fixing these is a simple matter of adding entries
to sb_isapnp_list.

>  second, the "already active thing". This was done
>  to allow the user to setup manually it's card via
>  the /proc/isapnp interface. 
> 
>  Obviously the second instance of the driver
>  will get in the same card. There's no easy solution
>  to this, but  you perfectly know how to solve this:    
> 
> :-)
> 
>  Do you remember your patch for multiple detection
>  in a round? I think it's time to merge it in.
> 
>  Then you could also take in account
>  if the card has been initialized by the driver
>  or not.

I thought that if the user went through all the trouble of messing with
/proc/isapnp that he could use isapnp=0 and enter in the paramaters with
module options, as before. But I also like the multiple detection scheme.
I had stopped working on it after not hearing back from Alan about the
idea.

>  There's still the problem with ALS007 type
>  card which obviously won't work....
>  btw the card was no more in my -pre3
>  kernel.. maybe i've removed it by a mistake.. :-/
> 
>  I also sent a patch to Linus a few hours ago.. 
>  but it should apply with some fuzz...sorry.
>  
> 
> -- 
> 
>    - *Alex* -
> 
>   http://freepage.logicom.it/azummo/

Ok, I'll rework the multiple card detection back in, and leave your
"already active" behavior alone. Then I'll repost and have another round
of comments and testing.

Paul Laufer
