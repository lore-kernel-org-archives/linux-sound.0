From: Thomas Sailer <sailer@scs.ch>
Date: Sun, 15 Feb 2004 10:07:23 +0000
Subject: Re: es1371 microphone volume problems
Message-Id: <402F44DB.5090107@scs.ch>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Kevin Page wrote:

> At first I thought there was no sound input through the microphone at
> all, but then I found if I tapped the mic (prety hard) then that got
> picked up - but certainly nothing if I were speaking.

Sounds like your microphone needs bias - enable with "options es1371 
micbias=1" in /etc/modules.conf

