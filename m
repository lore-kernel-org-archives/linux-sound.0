From: bscaring@slpmbo.ed.ray.com (Bryan Scaringe)
Date: Mon, 14 Sep 1998 19:16:43 +0000
Subject: Re: Desperately Seeking *#$^@^@% AWE64 Help :)
Message-Id: <marc-linux-sound-90580997205552@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90573905510932@msgid-missing>
In-Reply-To: <marc-linux-sound-90573905510932@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Sorry, can't help with your problem, but...

There has recently ben some VERY interesting discussion
about getting the AWE64 working under linux
on the linux-sound mailing list.

linux-sound, like this list, can be found
at vger.rutgers.edu

Good luck...

Bryan



> Well I've read every document I can find on installing the AWE64.
> 
> I've gone to the awedrv website.
> 
> I've spent close to 20hrs on #linux asking for help, getting it and
> trying to get the SOB working.
> 
> I tried the OSS drivers with 2.0.35.
> 
> I've installed 2.1.121 to try to get it working.
> 
> I told it I would wish cancer on it if it didn't start to work.
> 
> I contemplating sacraficing a goat...
> 
> And yet still the damned thing doesn't work and so now I'm going
> for what is my avenue of last resort. This list. Did I miss something
> important? Am I just a clueless git? (DON'T answer that. :) Is reality
> against me? Help.
> 
> My config as it stands (more or less. I'll spam with more detail if
> requested)
> 
> In the kernel compile all options are set as module. Sound, old fm stuff
> (typing this from memory), oss dirvers and the lowlevel driver.
> 
> pnp configured by changing the dump of pnpdump and uncommenting the right
> lines plus adding 2 for the wavetable stuff. isapnp is seemingly happy and
> gives me a single line responce with a bunch of hex numbers and so on.
> 
> modprobe sound seems to work. it doesn't whine but neither does it produce
> any output.
> 
> insmod iso406 (I think that's the right number. again, doing it from
> memory) barfs, pukes and generally paints the screen technicolour with
> error msgs about not being able to find internal labels. ie it finds
> it but when it tries to deal with it it cannot figure out where to point
> stuff.
> 
> same with sb and the others (as stated in the HOWTO on AWE32 in the
> kernel distrib. I think. I've read so many I'm losing count).
> 
> I know there's not much info here but if someone expresses interest
> in helping out I'll go to the hassle of getting whatever data is req
> when I get home tonight.
> 
> Thanks muchly.
> 
> -- 
> CaT (cat@zip.net.au)                       URL: http://www.zip.com.au/dev/null
> 
>     There was farting in the air that night,
>         It lit so bright,
>             Fernando...
> 
> 
