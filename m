From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Mon, 25 Oct 1999 10:07:10 +0000
Subject: Re: SNDCTL_DSP_BUSY
Message-Id: <marc-linux-sound-94084623201206@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94063085304036@msgid-missing>
In-Reply-To: <marc-linux-sound-94063085304036@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jirka Hanika wrote:

> I need an ioctl or some other API to find out whether the sound card
> has completely processed the buffers.  Something exactly like

SNDCTL_DSP_ODELAY

Tom
