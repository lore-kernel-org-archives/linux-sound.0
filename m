From: Michael Stutz <stutz@dsl.org>
Date: Fri, 18 Sep 1998 14:28:48 +0000
Subject: Re: making wav sample of a big mp3
Message-Id: <marc-linux-sound-90613218001589@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90609207319651@msgid-missing>
In-Reply-To: <marc-linux-sound-90609207319651@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 17 Sep 1998, Michael Stutz wrote:

> I need to make a 15-second WAV sample from a 3-minute mp3 file that I have.
> Does anyone know an easy way to do this?

This is how I do it (improvements welcome!):

dd if=<input.mp3> of=tmp.mp3 count=X  [where X = 14.2 * number-of-seconds-desired]

mpg123 -s tmp.mp3 > tmp.raw 

sox -r44100 -s -w -c2 tmp.raw sample.wav
