From: Lee Revell <rlrevell@joe-job.com>
Date: Thu, 28 Jul 2005 18:33:26 +0000
Subject: Re: [Alsa-devel] Re: [2.6 patch] schedule obsolete OSS drivers for
Message-Id: <1122575607.2772.2.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <Pine.LNX.4.61.0507281636040.20815@tek01.intern.thorsten-knabe.de>
In-Reply-To: <Pine.LNX.4.61.0507281636040.20815@tek01.intern.thorsten-knabe.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thorsten Knabe <linux@thorsten-knabe.de>
Cc: Adrian Bunk <bunk@stusta.de>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On Thu, 2005-07-28 at 17:04 +0200, Thorsten Knabe wrote:
> I'm the maintainer of the OSS AD1816 sound driver. I'm aware of two 
> problems of the ALSA AD1816 driver, that do not show up with the OSS 
> driver:
> - According to my own experience and user reports audio is choppy with 
> some VoIP Softphones like gnophone at least when used with the ALSA OSS 
> emulation layer, whereas the OSS driver is crystal clear.
> - Users reported, that on some HP Kayak systems the on-board AD1816A 
> was not properly detected by the ALSA driver or was detected, but 
> there was no audio output. I'm not sure if the problem is still present in 
> the current ALSA driver, as I do not own such a system.

What are the bug id #s in the ALSA BTS?  If it's not in the bug tracker
it's never going to get fixed.

Lee

