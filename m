From: Keith Duthie <psycho@albatross.co.nz>
Date: Thu, 29 Apr 1999 16:52:38 +0000
Subject: Re: ESS1689
Message-Id: <marc-linux-sound-92540476731625@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92533813705699@msgid-missing>
In-Reply-To: <marc-linux-sound-92533813705699@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 29 Apr 1999, John Foster wrote:

> I'm having all sorts of problems getting a PCI ESS1689 card to work at
> all. I've tried the ALSA 1688 driver, which detects and loads OK, but
> whenever I try to use any app that talks to the card, I get errors that
> say that the device #0/0 is busy.
> 
> I'm sure someone, somewhere has made this card work. Any clues at all
> appreciated.
Your problem is that you haven't set up the alsa device files. Run
snddevices is the alsa-drivers source directory.

-- 
Understanding is a three edged sword. Do you *want* to get the point?
         http://www.albatross.co.nz/~psycho/        O-
