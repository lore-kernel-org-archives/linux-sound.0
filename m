From: Hamish Moffatt <moffatt@cs.rmit.edu.au>
Date: Sat, 19 Sep 1998 13:02:56 +0000
Subject: Re: gmod and xmp, cannot open /dev/sequencer !
Message-Id: <marc-linux-sound-90621003326481@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90586345324981@msgid-missing>
In-Reply-To: <marc-linux-sound-90586345324981@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, Sep 18, 1998 at 12:19:57PM +0300, Tuukka Toivonen wrote:
> On Fri, 18 Sep 1998, Alamais wrote:
> >mod,xm,s3m,etc files include their own samples, 
> >and [do not/should not] use the midi sequencer. 
> 
> I don't know if awe drivers support it (but I assume they do) -- but at
> least with GUS this is completely wrong way to play modules. Using /dev/dsp
> eats CPU time since the processor has to mix the samples. With proper sound
> card (ie. GUS) the sample are downloaded to the soundcard memory and the
> player just says "play this sample with this pitch". Eats practically 0%
> CPU time. And this is where to use /dev/sequencer.

That's a loaded statement if ever there was one. If the GUS was
such a great sound card, surely Gravis would still be in business? :-)



Hamish
-- 
Hamish Moffatt, StudIEAust              hamish@debian.org, hamish@moffatt.nu
Student, computer science & computer systems engineering.    4th year, RMIT.
http://hamish.home.ml.org/ (PGP key here)             CPOM: [*******   ] 73%
Get a stable, reliable &  upgradable operating system free at www.debian.org
