From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Mon, 27 Sep 1999 08:54:26 +0000
Subject: Re: AC'97 and mic amplifier (in Ensoniq 1371)
Message-Id: <marc-linux-sound-93842245427955@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93841923624939@msgid-missing>
In-Reply-To: <marc-linux-sound-93841923624939@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Nagy Balazs wrote:
> 
> Hi,
> 
> I downloaded the AC'97 mixer specification and I found that AC97 has (or can
> have) a 20dB preamp in the mic port.  It can be turned on and off.  Despite
> of its simplicity I cannot see where this checkbox fits in the mixer
> structure (eg. the code).  Any ideas?

The MIC preamp in the driver just extends the range of the MIC volume
slider,
i.e. if you turn the MIC volume fully up, the MIC preamp will be turned
on
and the MIC volume set to max.

Tom
