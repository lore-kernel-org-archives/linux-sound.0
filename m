From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Wed, 10 Feb 1999 13:19:48 +0000
Subject: Re: cheap pci sound card with full duplex support?
Message-Id: <marc-linux-sound-91865298303677@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91762722501635@msgid-missing>
In-Reply-To: <marc-linux-sound-91762722501635@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

DAVID BALAZIC wrote:

> But also  have a cosmetic bug - in order to record a sound, you must
> set it to play ( hear it on the output of your card ),
> the microphone is an exception, otherwise it would be unusable.

I think it should be sufficient to enable a channel as recording source
but turn its volume down to 0. But this is indeed on a list to
rethink 8-)

Tom
