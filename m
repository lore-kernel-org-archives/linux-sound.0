From: Scott Murray <scott@spiteful.org>
Date: Wed, 19 Jul 2000 13:13:04 +0000
Subject: Re: "noise" while recording with an OPL3SAx
Message-Id: <marc-linux-sound-96401244204131@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96376558726822@msgid-missing>
In-Reply-To: <marc-linux-sound-96376558726822@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 16 Jul 2000, Jirtme Augi wrote:

[snip]
> I tried Alsa and I noticed that with Alsa there is no more noise but If
> I boot again with OSS the noise is back when recording. I also noticed
> that the noise disappear when using OSS after unloading Alsa modules.
> So I've made a patch for OSS (by looking at Alsa driver source) that fix
> this noise but before posting the patch I'd like to know if someone else
> noticed this noise with OSS or if it occurs only with me ?

I'm currently at OLS, but I'll look at the patch in more detail when
I get home.  When I pieced together the OSS OPL3-SAx driver that's in
the kernel I assumed that the recording limitations were in the under-
lying ad1848 code, but obviously I missed something in Yamaha's docs.
I'm planning on sending a patch for 2.4.0-test to Linus/Alan soon after
OLS, as a couple of people have sent me PnP integration code that I need
to merge and test.

Scott


-- 
======================================Scott Murray                                        email: scott@spiteful.org
http://www.interlog.com/~scottm                       ICQ: 10602428
-----------------------------------------------------------------------------
     "Good, bad ... I'm the guy with the gun." - Ash, "Army of Darkness"
