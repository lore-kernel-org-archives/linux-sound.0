From: Michael Stutz <stutz@dsl.org>
Date: Fri, 18 Sep 1998 15:42:58 +0000
Subject: Re: making wav sample of a big mp3
Message-Id: <marc-linux-sound-90613788304589@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90609207319651@msgid-missing>
In-Reply-To: <marc-linux-sound-90609207319651@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 18 Sep 1998, Thomas C Sobczynski wrote:

> Out of curiosity, I tried this, and just got noise with "play sample.wav"

Was is a mono mp3? If so, use "-c1" instead of "-c2" on the last line..

> 
> > This is how I do it (improvements welcome!):
> > 
> > dd if=<input.mp3> of=tmp.mp3 count=X  [where X = 14.2 * number-of-seconds-des
> > ired]
> > 
> > mpg123 -s tmp.mp3 > tmp.raw 
> > 
> > sox -r44100 -s -w -c2 tmp.raw sample.wav
> 
