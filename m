From: Raoul Boenisch <st0136@hrz.uni-essen.de>
Date: Sat, 16 Jan 1999 00:48:07 +0000
Subject: Re: recording with Microphone
Message-Id: <marc-linux-sound-91644419907849@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91612993715069@msgid-missing>
In-Reply-To: <marc-linux-sound-91612993715069@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Mon, 11 Jan 1999, Georg Wendt wrote:

> im looking for a simple tool, that allows me to record voice using a
> 
> Microphone plugged into the Soundcard.
> 
> Best with Program-Code...
> 
> BTW, is there anything, I should especially take care of?

Here is a solution with fixed sample length:

# Record <count> seconds of audio from microphone
dd bs=8k count=4 < /dev/audio > sample.au

# Play back sound
cat sample.au > /dev/audio

-- 
Raoul Boenisch, Winkhauser Talweg 165, 45473 Muelheim an der Ruhr, Germany
homepage: http://www.raoul.home.pages.de/       home phone: +49 208 764257
Reply-To: st0136@hrz.uni-essen.de
