From: Robert.Siemer@gmx.de
Date: Tue, 01 Apr 2003 12:34:30 +0000
Subject: Re: azt1008 on HP Vectra
Message-Id: <marc-linux-sound-104920066720862@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-104912330303494@msgid-missing>
In-Reply-To: <marc-linux-sound-104912330303494@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Mar 31, 2003 at 01:53:38PM -0500, W. L. Estes wrote:
> On Monday, 31 March 2003,17:05 +0200, Robert.Siemer@gmx.de wrote:
> 
> > Yeah, include the error messages.
> 
> /lib/modules/2.4.18-14/kernel/drivers/sound/ad1848.o: init_modlue: no such device

- I don't believe that this is the correct error message.
- Further, look into the kernel ring buffer (dmesg) for more messages.
- Use insmod and follow the dependancies manually.


Robert
