From: Paul Laufer <pelaufer@csupomona.edu>
Date: Wed, 12 Apr 2000 00:44:48 +0000
Subject: Re: Soundblaster driver
Message-Id: <marc-linux-sound-95550502210496@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95540038226444@msgid-missing>
In-Reply-To: <marc-linux-sound-95540038226444@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 10 Apr 2000, Torsten Werner wrote:

> Hi Paul,
> 
> On Mon, Apr 10, 2000 at 02:05:32AM -0700, Paul Laufer wrote:
> > Please test this if you use the Soundblaster driver. This is a rather
> > large patch that touches most of sb_card.c. If there are no problems I
> > will submit this to Linus.
> 
> There are two problems:
> 
> +       {"Diamond DT0197H",
> +               ISAPNP_VENDOR('R','W','B'), ISAPNP_DEVICE(0x1688),
> +               ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
> +               ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001),
> +               0,-1,0,-1},
> 
> should really be:
> 
> +       {"Diamond DT0197H",
> +               ISAPNP_VENDOR('R','W','B'), ISAPNP_DEVICE(0x1688),
> +               ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
> +               ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001),
> +               0,-1,0,0},
> 
> note the last 0 like in the ALS007 entry. The opl3 driver does not work
> anymore because it is not activated. What is the reason for that?
> 
> Torsten
> -- 
> Torsten Werner                          Dresden University of Technology
> email: twerner@intercomm.de                phone/fax: +49 3501 530061/11
> Homepage:                              http://www.phy.tu-dresden.de/apg/

I had to guess on that one. The sb_init_diamond() function does not assign
mpu_config->irq and I don't have a printout of /proc/isapnp for this card,
so I guessed and asked for people to test it :-)

The mpu is no longer activated by default on cards with a mpu isapnp
device separate from the audio isapnp device. Reason being most people
don't use midi devices and so the IRQ taken up by them is wasted. To
configure the mpu device on such clones you must pass the module option
"mpu=1".  I've recently changed the name of that option to "uart401".

Thank you for testing and the correction! Could you please send me a copy
of your /proc/isapnp for this card? I'd like to add it to my growing
collection.

Thank you for your time,
Paul Laufer
