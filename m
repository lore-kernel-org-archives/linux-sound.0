From: I.S.Wolfe@happy-man.com
Date: Sun, 16 Jul 2000 18:17:18 +0000
Subject: Re: "noise" while recording with an OPL3SAx
Message-Id: <marc-linux-sound-96377185100592@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96376558726822@msgid-missing>
In-Reply-To: <marc-linux-sound-96376558726822@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> I tried Alsa and I noticed that with Alsa there
> is no more noise but If I boot again with OSS the
> noise is back when recording.  I also noticed that
> the noise disappear when using OSS after unloading
> Alsa modules. 

I'm unfamiliar with both your Satellite and your
Red Hat, so perhaps I should keep my mouth shut. 
But the combination you describe makes me think of
how Alsa mutes the mike (and everything else) and
OSS (I think) doesn't, so if your machine has a
built-in mike, you may be mixing in computer and
other background noises without realizing it, until
you run Alsa and it mutes the mike.  If I'm write,
setting a mute mike with aumix, say, doing a save
there, and then running aumix -L when you log in,
might solve the problem.

Regards,
 - Irving
-
 Irving_Wolfe@Happy-Man.com   Happy Man Corporation
 +1 206 463 9399, ext. 101    4410 SW Pt Robinson Rd
      fax: +1 209 463 9255    Vashon, WA  98070  USA

 Solid Value Investment Letter -- more than 14 years
 safely outperforming the stock market through wise,
 conservative selection: http://www.solid-value.com/
