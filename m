From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 07 Oct 1999 08:34:56 +0000
Subject: Re: es1370 driver
Message-Id: <marc-linux-sound-93928528611450@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93923401100718@msgid-missing>
In-Reply-To: <marc-linux-sound-93923401100718@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

"Gerald J. Puhl" wrote:
> 
> Greetings!
> 
> I am new to linux sound (and have probably a dumb question). I have the
> es1370 driver loaded and I get sound on my machine but the cdplayer (RH6.0
> Gnome) doesn't output any sound. I is working because the tracks of the CD
> appears without a problem.  Am I missing something needed in the kernel
> or is this driver not capable of playing CDs?

I guess you want to play audio CD's by routing an analog signal from
the CD ROM drive to the soundcard output mixer. You might need to
enable CD as a recording source. Try enabling all recording sources
and turn up the volume for all channels, then you should be able to
hear the CD output.

Tom
