From: Tuukka Toivonen <tuukkat@ees2.oulu.fi>
Date: Fri, 18 Sep 1998 09:19:57 +0000
Subject: Re: gmod and xmp, cannot open /dev/sequencer !
Message-Id: <marc-linux-sound-90611179126582@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90586345324981@msgid-missing>
In-Reply-To: <marc-linux-sound-90586345324981@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 18 Sep 1998, Alamais wrote:

>mod,xm,s3m,etc files include their own samples, 
>and [do not/should not] use the midi sequencer. 

I don't know if awe drivers support it (but I assume they do) -- but at
least with GUS this is completely wrong way to play modules. Using /dev/dsp
eats CPU time since the processor has to mix the samples. With proper sound
card (ie. GUS) the sample are downloaded to the soundcard memory and the
player just says "play this sample with this pitch". Eats practically 0%
CPU time. And this is where to use /dev/sequencer.

--
| Tuukka Toivonen <tuukkat@ee.oulu.fi>       [PGP public key
| Homepage: http://www.ee.oulu.fi/~tuukkat/       available]
| Try also finger -l tuukkat@ee.oulu.fi
| Studying information engineering at the University of Oulu
+-----------------------------------------------------------
